const { errorResponse, successResponse } = require("../../../utils/response");
const evaluate = require("../../../modelMongo/evaluate");

module.exports = {
    getAllEvaluated: async (req, res) => {
        const doc = await evaluate.find({
            user_id: req.params.user_id,
        });
        if (!doc) {
            return errorResponsense(res, 404, "Đã xảy ra lỗi")
        }
        else {
            return successResponse(res, 200, "Lấy thành công toàn bộ evaluate", doc);
        }
    },
    getOneEvaluated: async (req, res) => {
        try {
            const evaluation = await evaluate.findOne({
                user_id: req.params.user_id,
                product_id: req.params.id
            });
    
            if (!evaluation) {
                return errorResponse(res, 404, "Không tìm thấy đánh giá phù hợp");
            }
    
            return successResponse(res, 200, "Lấy thành công evaluate", evaluation);
        } catch (error) {
            console.error("Lỗi khi lấy evaluate:", error);
            return errorResponse(res, 500, "Đã xảy ra lỗi trong quá trình xử lý");
        }
    },
    pushOneEvaluate: async (req, res) => {
        const { comment, vote } = req.body;
        const sp = new evaluate({
            user_id: req.params.user_id,
            product_id: req.params.id,
            commented: comment,
            voted: vote,
        });
        sp.save().then(() => {
            return successResponse(res, 200, "Đẩy dữ liệu thành công");
        }).catch((err) => {
            return errorResponse(res, 404, "Đã xảy ra lỗi");
        })
    },
    updateOneEvaluated: async (req, res) => {
        const filter = { 
            product_id: req.params.id ,
            user_id: req.params.user_id
        };
        const { comment, vote } = req.body;
        const update = { commented: comment, voted: vote };
        const doc = await evaluate.findOneAndUpdate(filter, update, {
            new: true
        });
        if (!doc) {
            return errorResponse(res, 404, "Đã xảy ra lỗi");
        }
        else {
            return successResponse(res, 200, "Update thành công", doc);
        }
    },
    deleteOneEvaluated: async (req, res) => {
        const ok = await evaluate.deleteOne({ 
            product_id: req.params.id ,
            user_id: req.params.user_id,
        });
        if (ok.deletedCount != 0) {
            return successResponse(res, 200, "Delete thành công");
        }
        else {
            return errorResponse(res, 404, "Đã xảy ra lỗi");
        }
    },
    testInsert: async (req, res) => {
        try {
            for (let product = 3; product <= 90; product++) {
                const sp = new evaluate({
                    user_id: product,
                    product_id: product,
                    commented: `xin chao ${product}`,
                    voted: 4
                });
                await sp.save();
                console.log("Saved successfully for product: ", product);
            }
            res.status(200).send("Thêm dữ liệu thành công");
        } catch (err) {
            console.error("Error while inserting data:", err);
            res.status(500).send("Đã xảy ra lỗi khi thêm dữ liệu");
        }
    }

}