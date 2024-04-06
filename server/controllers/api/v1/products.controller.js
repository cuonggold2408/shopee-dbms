const { Product, Productline, ProductClassify } = require("../../../models/index");
const { Category } = require("../../../models/index");
const { errorResponse, successResponse } = require("../../../utils/response");

module.exports = {
  getProducts: async (req, res) => { 
    try {
      const product = await Product.findAll({
        include: [
          {
            model: Productline,
            include: [
              {
                model: Category,
              },
            ],
          },
        ],
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

//   const { Product, sequelize } = require("../../../models/index");
// const { Category } = require("../../../models/index");
// const { errorResponse, successResponse } = require("../../../utils/response");

// module.exports = {
//   showProducts: async (req, res) => {
//     try {
//       // const product = await sequelize.query('Select p.*, pl.productline_name, c.category_name from products p join productlines pl on p.productline_id = pl.id join categories c on pl.category_id = c.id');
//       const product = await Product.findAll({
//         include: [
//           { model: Productline, as: 'Productline' },
//           { model: Category }
//         ]
//       });
//       // const product_productline = await product.getProductLines();
//       if (!product) {
//         return errorResponse(res, 404, "Not Found");
//       } else {
//         return successResponse(res, 200, "success", product);
//       }
//     } catch (e) {
//       console.log(e);
//       return errorResponse(res, 500, "Đã có lỗi xảy ra");
//     }
//   },

//   showCategories: async(req, res) => {
//     try {
//         const category = await Category.findAll();
//         if (!category) {
//             return errorResponse(res, 404, "Not Found");
//         } else {
//             return successResponse(res, 200, "success", category);
//         }
//     } catch (e) {
//         console.log(e);
//         return errorResponse(res, 500, "Đã có lỗi xảy ra");
//     }
//   }
// };
// };

// module.exports = {
//   getProducts: async (req, res) => {
//     try {
//       const products = await Product.findAll({
//         include: [
//           {
//             model: Productline,
//             as: "productline_id", // Đảm bảo rằng giá trị này khớp với giá trị bạn đã dùng trong phương thức associate của Product
//             include: [
//               {
//                 model: Category,
//                 as: "category_id", // Đảm bảo rằng giá trị này khớp với giá trị bạn đã dùng trong phương thức associate của Productline
//               },
//             ],
//           },
//         ],
//       });
//       // return successResponse(res, 201, 'Đã lấy sản phẩm thành công', products);
//       if (!products) {
//         return errorResponse(res, 404, "Not Found");
//       } else {
//         return successResponse(res, 200, "success", products);
//       }
//     } catch (error) {
//       console.error("Error fetching products:", error);
//       // return errorResponse(res, 404, 'Lấy sản phẩm lỗi')
//       res.status(500).send("An error occurred while fetching products");
//     }
//   },
// };
