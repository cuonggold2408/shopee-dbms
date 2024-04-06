const { Category } = require("../../../models/index");
const { errorResponse, successResponse } = require("../../../utils/response");
module.exports = {
    // trả về tên danh mục
    getOneCategory: async (req,res)=>{
        try{
            const id = req.params.id;
            const category = await Category.findByPk(id);
            const categoryProductline = await category.getProductLines();
            // console.log(category);
            if(!id || !category) {
                return errorResponse(res, 404, "Không tìm thấy danh mục");
            }
            else {
                return successResponse(res, 200, "success", categoryProductline);
            }
        } catch (e) {
            console.log(e);
            return errorResponse(res, 500, "Đã có lỗi xảy ra");
        }
    }
}