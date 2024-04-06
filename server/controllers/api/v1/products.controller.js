const { Product, Productline, ProductClassify, Category } = require("../../../models/index");
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
          },
        ],
        attributes: ['product_name', 'description', 'quantity_in_stock', 'price'],
      });
      
      const classify = await ProductClassify.findAll();
      const updatedProducts = product.map(item => {
        const classifyItem = classify.find(c_item => item.id === c_item.product_id);
        if (classifyItem) {
          // Kiểm tra xem item có trường Classify hay không
          if (!item.Classify) {
            // Nếu không có, tạo một đối tượng mới
            item.Classify = classifyItem;
          } else {
            // Nếu đã tồn tại, gán giá trị cho trường này
            Object.assign(item.Classify, classifyItem);
          }
          console.log("item: ", item);
          console.log("item.Classify: ", item.Classify);
        }
        return item;
      });
      if (!updatedProducts) {
        return errorResponse(res, 404, "Not Found");
      } else {
        return successResponse(res, 200, "success", updatedProducts);
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
