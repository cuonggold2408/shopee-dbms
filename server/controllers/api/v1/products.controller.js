const { Product, Productline, ProductClassify, Category, ClassifyOption } = require("../../../models/index");
const { errorResponse, successResponse } = require("../../../utils/response");

module.exports = {
  getProducts: async (req, res) => { 
    try {
      const product = await Product.findAll({
        include: [
          {
            model: Productline,
            attributes: ['productline_name'],
            include: [
              {
                model: Category,
                attributes: ['category_name'],
              },
            ],
          },
          {
            model: ProductClassify,
            attributes: ['classify_name'],
            include: [
              {
                model: ClassifyOption,
                attributes: ['option_name'],
              }
            ]
          },
        ],
        attributes: ['product_name', 'description', 'quantity_in_stock', 'price'],
      });
      if (!product) {
        return errorResponse(res, 404, "Not Found");
      } else {
        return successResponse(res, 200, "success", product);
      }
    } catch (e) {
      console.log(e);
      return errorResponse(res, 500, "Đã có lỗi xảy ra");
    }
  },

  showCategories: async (req, res) => {
    try {
      const category = await Category.findAll();
      if (!category) {
        return errorResponse(res, 404, "Not Found");
      } else {
        return successResponse(res, 200, "success", category);
      }
    } catch (e) {
      console.log(e);
      return errorResponse(res, 500, "Đã có lỗi xảy ra");
    }
  },
};
