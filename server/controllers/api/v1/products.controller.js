const {
  Product,
  Productline,
  ProductClassify,
  Category,
  ClassifyOption,
  ProductImage,
  sequelize,
} = require("../../../models/index");
const { errorResponse, successResponse } = require("../../../utils/response");

module.exports = {
  getProducts: async (req, res) => {
    try {
      const { page = 1, limit } = req.query;
      // const product = await Product.findAll({
      //   include: [
      //     {
      //       model: Productline,
      //       attributes: ["productline_name"],
      //       include: [
      //         {
      //           model: Category,
      //           attributes: ["category_name"],
      //         },
      //       ],
      //     },
      //     {
      //       model: ProductClassify,
      //       attributes: ["classify_name"],
      //       include: [
      //         {
      //           model: ClassifyOption,
      //           attributes: ["option_name"],
      //           include: [
      //             {
      //               model: ProductImage,
      //               attributes: ["image_link"],
      //             },
      //           ],
      //         },
      //       ],
      //     },
      //   ],
      //   attributes: [
      //     "id",
      //     "product_name",
      //     "description",
      //     "quantity_in_stock",
      //     "price",
      //   ],
      // });

      const options = {
        include: [
          {
            model: Productline,
            attributes: ["productline_name"],
            include: [
              {
                model: Category,
                attributes: ["category_name"],
              },
            ],
          },
          {
            model: ProductClassify,
            attributes: ["classify_name"],
            include: [
              {
                model: ClassifyOption,
                attributes: ["option_name"],
                include: [
                  {
                    model: ProductImage,
                    attributes: ["image_link"],
                  },
                ],
              },
            ],
          },
        ],
        attributes: [
          "id",
          "product_name",
          "description",
          "quantity_in_stock",
          "price",
        ],
      };

      if (Number.isInteger(+limit) && Number.isInteger(+page)) {
        const offset = (page - 1) * limit;
        options.limit = +limit;
        options.offset = offset;
      }

      const { count } = await Product.findAndCountAll();

      const { rows: product } = await Product.findAndCountAll(options);
      const totalPage = Math.ceil(count / limit);

      const data = {
        product,
        totalPage: totalPage,
      };

      if (!product) {
        return errorResponse(res, 404, "Not Found");
      } else {
        return successResponse(res, 200, "success", data);
      }
    } catch (e) {
      console.log(e);
      return errorResponse(res, 500, "Đã có lỗi xảy ra");
    }
  },

  showCategories: async (req, res) => {
    try {
      const categories = await sequelize.query("SELECT * FROM categories");
      console.log("categories", categories);
      if (!categories) {
        return errorResponse(res, 404, "Not Found");
      } else {
        return successResponse(res, 200, "success", categories);
      }
    } catch (e) {
      console.log(e);
      return errorResponse(res, 500, "Đã có lỗi xảy ra");
    }
  },

  getOneCategory: async (req, res) => {
    try {
      const id = req.params.id;
      const category = await Category.findByPk(id);
      const categoryProductline = await category.getProductLines();
      if (!id || !category) {
        return errorResponse(res, 404, "Không tìm thấy danh mục");
      } else {
        return successResponse(res, 200, "success", categoryProductline);
      }
    } catch (e) {
      console.log(e);
      return errorResponse(res, 500, "Đã có lỗi xảy ra");
    }
  },
  
  getOneCategoryProducts: async (req, res) => {
    try {
      const id = req.params.id;
      const category = await Category.findByPk(id, { include: Productline }); // Include Productlines when fetching Category
      if (!category) {
        return errorResponse(res, 404, "Không tìm thấy danh mục");
      }

      let allProducts = [];
      for (const productline of category.Productlines) {
        const products = await productline.getProducts(); // Get products for each productline
        allProducts = allProducts.concat(products); // Concatenate products
      }

      return successResponse(res, 200, "success", allProducts);
    } catch (e) {
      console.log(e);
      return errorResponse(res, 500, "Đã có lỗi xảy ra");
    }
  },

  getProductById: async (req, res) => {
    try {
      const id = req.params.id;
      const product = await Product.findByPk(id, {
        include: [
          {
            model: Productline,
            attributes: ["productline_name"],
            include: [
              {
                model: Category,
                attributes: ["category_name"],
              },
            ],
          },
          {
            model: ProductClassify,
            attributes: ["classify_name"],
            include: [
              {
                model: ClassifyOption,
                attributes: ["option_name"],
                include: [
                  {
                    model: ProductImage,
                    attributes: ["image_link"],
                  },
                ],
              },
            ],
          },
        ],
        attributes: [
          "id",
          "product_name",
          "description",
          "quantity_in_stock",
          "price",
        ],
      });
      if (!id || !product) {
        return errorResponse(res, 404, "Không tìm thấy sản phẩm");
      } else {
        return successResponse(res, 200, "success", product);
      }
    } catch (e) {
      console.log(e);
      return errorResponse(res, 500, "Đã có lỗi xảy ra");
    }
  },
};
