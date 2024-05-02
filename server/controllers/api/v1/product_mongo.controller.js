const { errorResponse, successResponse } = require("../../../utils/response");
const evaluate = require("../../../modelMongo/evaluate");
const test = require("../../../modelMongo/cart");
const {
    User,
} = require("../../../models/index");
const { json } = require("sequelize");
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
        const { commented, voted } = req.body;
        const sp = new evaluate({
            user_id: req.params.user_id,
            product_id: req.params.id,
            commented: commented,
            voted: voted,
        });
        sp.save().then(() => {
            return successResponse(res, 200, "Bình luật của bạn đã thành công");
        }).catch((err) => {
            return errorResponse(res, 404, "Đã xảy ra lỗi");
        })
    },
    updateOneEvaluated: async (req, res) => {
        const filter = {
            product_id: req.params.id,
            user_id: req.params.user_id
        };
        const { commented, voted } = req.body;
        const update = { commented: commented, voted: voted };
        const doc = await evaluate.findOneAndUpdate(filter, update, {
            new: true
        });
        if (!doc) {
            return errorResponse(res, 404, "Đã xảy ra lỗi");
        }
        else {
            return successResponse(res, 200, "Cập nhật thành công", doc);
        }
    },
    deleteOneEvaluated: async (req, res) => {
        const ok = await evaluate.deleteOne({
            product_id: req.params.id,
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
    },
    pushOneCart: async (req, res) => {
        try {
            const user_id = req.params.user_id;
            const id = req.params.id;
            const newEvaluateData = {
                product_id: id,
                user_id: user_id,
            };

            // Thêm các comment vào dữ liệu mới nếu chúng tồn tại và không rỗng
            for (const key in req.body) {
                const value = req.body[key];
                // Thực hiện xử lý với key và value tại đây
                newEvaluateData[key] = value;
            }
            const newEvaluate = new test(newEvaluateData);
            const doc = await newEvaluate.save();
            return successResponse(res, 200, "Thêm thành công", req.body);
        } catch (error) {
            console.error("Lỗi khi lưu đánh giá:", error);
            res.status(500).json({ error: "Đã xảy ra lỗi khi lưu đánh giá" });
        }
    },
    deleteOneCart: async (req, res) => {
        const user_id = req.params.user_id;
        const id = req.params.id;
        const newEvaluateData = {
            product_id: id,
            user_id: user_id,
        };

        // Thêm các comment vào dữ liệu mới nếu chúng tồn tại và không rỗng
        for (const key in req.body) {
            const value = req.body[key];
            // Thực hiện xử lý với key và value tại đây
            newEvaluateData[key] = value;
        }
        console.log(newEvaluateData);
        const ok = await evaluate.deleteOne({
            newEvaluateData
        });
        if (ok.deletedCount != 0) {
            return successResponse(res, 200, "Delete thành công");
        }
        else {
            return errorResponse(res, 404, "Đã xảy ra lỗi");
        }
    },
    getOneDetailUser: async (req, res) => {
        try {
            const { user_id, id } = req.params;
            console.log(id + " " + user_id);

            const user = await User.findByPk(user_id);
            const evaluation = await evaluate.findOne({
                user_id: user_id,
                product_id: id
            });
            const mergedData = {
                user_id: req.params.user_id,
                username: user.username,
                product_id: evaluation.product_id,
                commented: evaluation.commented,
                voted: evaluation.voted,
                timecommented: evaluation.createdAt,
            };

            // Trả về dữ liệu đã hợp nhất
            return successResponse(res, 200, "Thành công", json(mergedData));
        } catch (e) {
            return errorResponse(res, 404, "Đã xảy ra lỗi");
        }
    },



    getAllCommented: async (req, res) => {
        const id = req.params.id;
        try {
            const results = await evaluate.find({ product_id: id });

            for (const key in results) {
                const user = await User.findByPk(results[key].user_id);
                if (user) {
                    const mergedData = {
                        user_id: results[key].user_id,
                        username: user.username,// mysql
                        product_id: results[key].product_id,
                        commented: results[key].commented,
                        voted: results[key].voted,
                        timecommented: results[key].createdAt,
                    };
                    results[key] = mergedData;
                } else {
                    console.log("Không tìm thấy người dùng với ID:", results[key].user_id);
                }
            }
            console.log(results);
            return successResponse(res, 200, "Thành công", results);
        } catch (error) {
            console.error("Lỗi khi lấy dữ liệu:", error);
            return errorResponse(res, 500, "Đã xảy ra lỗi khi lấy dữ liệu");
        }
    }
}