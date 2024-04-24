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

      console.log(user, cart);
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
        product_price,
      } = req.body;

      console.log(req.body);

      if (
        !users_id ||
        !product_id ||
        !image_product ||
        !product_name ||
        !product_price
      ) {
        return errorResponse(res, 400, "Thiếu thông tin");
      }
      await CartDetail.create({
        cart_id: users_id,
        product_id: product_id,
        image_product: image_product,
        product_name: product_name,
        product_price: product_price,
      });
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
};
