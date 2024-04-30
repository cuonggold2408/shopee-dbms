const { errorResponse, successResponse } = require("../../../utils/response");
const { User, Address, Cart, CartDetail } = require("../../../models/index");

module.exports = {
  getUserCart: async (req, res) => {
    try {
      const id = req.params.id;
      const user = await User.findByPk(id);
      if (!user) {
        return errorResponse(res, 404, "Người dùng không tồn tại");
      }

      const cart = await user.getCart();

      if (!cart) {
        return errorResponse(res, 404, "Người dùng chưa có giỏ hàng");
      }

      return successResponse(res, 201, "Lấy cart thành công", { cart });
    } catch (error) {
      console.error("Lỗi khi lấy giỏ hàng của người dùng:", error);
      return errorResponse(res, 500, "Lỗi khi lấy giỏ hàng của người dùng");
    }
  },
  addProductToCart: async (req, res) => {
    try {
      const {
        users_id,
        product_id,
        image_product,
        product_name,
        quantity,
        product_price,
        classify,
        total_price,
      } = req.body;

      if (
        !users_id ||
        !product_id ||
        !image_product ||
        !product_name ||
        !quantity ||
        !product_price ||
        !classify ||
        !total_price
      ) {
        return errorResponse(res, 400, "Thiếu thông tin");
      }

      const productALike = await CartDetail.findOne({
        where: {
          cart_id: users_id,
          product_id: product_id,
          classify: classify,
        },
      });

      if (productALike) {
        await CartDetail.update(
          {
            quantity: productALike.quantity + quantity,
            total_price: +productALike.total_price + +product_price * quantity,
          },
          {
            where: {
              cart_id: users_id,
              product_id: product_id,
              classify: classify,
            },
          }
        );
      } else {
        await CartDetail.create({
          cart_id: users_id,
          product_id: product_id,
          image_product: image_product,
          product_name: product_name,
          quantity: quantity,
          product_price: product_price,
          classify: classify,
          total_price: total_price,
        });
      }
      return successResponse(res, 201, "Thêm sản phẩm vào giỏ hàng thành công");
    } catch (e) {
      console.log(e);
    }
  },
  getProductToCart: async (req, res) => {
    const id = req.params.id;
    try {
      const { count, rows: cart } = await CartDetail.findAndCountAll({
        where: {
          cart_id: id,
        },
      });
      return successResponse(
        res,
        201,
        "Lấy sản phẩm trong giỏ hàng thành công",
        {
          cart,
          count,
        }
      );
    } catch (error) {
      console.error("Lỗi khi lấy sản phẩm trong giỏ hàng:", error);
      return errorResponse(res, 500, "Lỗi khi lấy sản phẩm trong giỏ hàng");
    }
  },
  deleteProductFromCart: async (req, res) => {
    const { id, product_id, classify } = req.params;

    try {
      const cart = await CartDetail.findOne({
        where: {
          cart_id: id,
          product_id: product_id,
          classify: classify,
        },
      });
      if (!cart) {
        return errorResponse(res, 404, "Sản phẩm không tồn tại");
      }
      await cart.destroy();
      return successResponse(res, 201, "Xóa sản phẩm khỏi giỏ hàng thành công");
    } catch (error) {
      console.error("Lỗi khi xóa sản phẩm khỏi giỏ hàng:", error);
      return errorResponse(res, 500, "Lỗi khi xóa sản phẩm khỏi giỏ hàng");
    }
  },
  updateProductToCart: async (req, res) => {
    const { id, product_id, classify, quantity } = req.body;
    try {
      const product = await CartDetail.findOne({
        where: {
          cart_id: id,
          product_id: product_id,
          classify: classify,
        },
      });
      if (!product) {
        return errorResponse(res, 404, "Sản phẩm không tồn tại");
      }
      await CartDetail.update(
        {
          quantity: quantity,
          total_price: quantity * product.product_price,
        },
        {
          where: {
            cart_id: id,
            product_id: product_id,
            classify: classify,
          },
        }
      );
      return successResponse(
        res,
        201,
        "Cập nhật sản phẩm trong giỏ hàng thành công",
        { product }
      );
    } catch (e) {
      console.log(e);
      return errorResponse(
        res,
        500,
        "Lỗi khi cập nhật sản phẩm trong giỏ hàng"
      );
    }
  },
  addSelectedProductToCart: async (req, res) => {
    const { id, product_id, classify, isChecked } = req.body;
    try {
      const product = await CartDetail.findOne({
        where: {
          cart_id: id,
          product_id: product_id,
          classify: classify,
        },
      });
      if (!product) {
        return errorResponse(res, 404, "Sản phẩm không tồn tại");
      }
      await CartDetail.update(
        {
          is_selected: isChecked,
        },
        {
          where: {
            cart_id: id,
            product_id: product_id,
            classify: classify,
          },
        }
      );
      return successResponse(
        res,
        201,
        "Cập nhật chọn sản phẩm trong giỏ hàng thành công",
        { product }
      );
    } catch (e) {
      console.log(e);
      return errorResponse(
        res,
        500,
        "Lỗi khi cập nhật sản phẩm trong giỏ hàng"
      );
    }
  },
  addSelectedProductToCartAll: async (req, res) => {
    const { id, isChecked } = req.body;
    try {
      await CartDetail.update(
        {
          is_selected: isChecked,
        },
        {
          where: {
            cart_id: id,
          },
        }
      );
      return successResponse(
        res,
        201,
        "Cập nhật chọn tất cả sản phẩm trong giỏ hàng thành công"
      );
    } catch (e) {
      console.log(e);
      return errorResponse(
        res,
        500,
        "Lỗi khi cập nhật sản phẩm trong giỏ hàng"
      );
    }
  },
  getCheckoutCart: async (req, res) => {
    const id = req.params.id;
    try {
      const { count, rows: cart } = await CartDetail.findAndCountAll({
        where: {
          cart_id: id,
          is_selected: true,
        },
      });
      return successResponse(
        res,
        201,
        "Lấy sản phẩm để thanh toán thành công",
        {
          cart,
          count,
        }
      );
    } catch (error) {
      console.error("Lỗi khi lấy sản phẩm trong giỏ hàng:", error);
      return errorResponse(res, 500, "Lỗi khi lấy sản phẩm trong giỏ hàng");
    }
  },
};
