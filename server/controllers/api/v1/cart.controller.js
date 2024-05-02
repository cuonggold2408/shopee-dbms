const { errorResponse, successResponse } = require("../../../utils/response");
const {
  User,
  Address,
  Cart,
  CartDetail,
  Transaction,
} = require("../../../models/index");

const { sequelize } = require("../../../models/index");

const Cache = require("../../../core/cache");

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
      // Check bộ nhớ cache có product trong cart chưa. Key là product_cart-cache
      // let resultCache = await (await client).get("product_cart");
      // if (!resultCache) {
      //   resultCache = await CartDetail.findAndCountAll({
      //     where: {
      //       cart_id: id,
      //     },
      //   });
      //   await (
      //     await client
      //   ).set("product_cart", JSON.stringify(resultCache), "EX", 60 * 60 * 24);
      // } else {
      //   resultCache = JSON.parse(resultCache);
      // }
      const { count, rows: cart } = await Cache.remember(
        "product_cart",
        60 * 60 * 24,
        () => {
          return CartDetail.findAndCountAll({
            where: {
              cart_id: id,
            },
          });
        }
      );
      // const { count, rows: cart } = await CartDetail.findAndCountAll({
      //         where: {
      //           cart_id: id,
      //         },
      //       });
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
  postClickBuy: async (req, res) => {
    try {
      // Thực hiện xóa các mục có is_selected là true
      const user_id = req.params.user_id;
      await CartDetail.destroy({
        where: {
          cart_id: user_id,
          is_selected: true,
        },
      });

      // Tạo trigger
      // const triggerQuery = `
      //     CREATE OR REPLACE FUNCTION update_quantity_stock()
      //     RETURNS TRIGGER AS $$
      //     BEGIN
      //         IF OLD.is_selected THEN
      //             UPDATE products
      //             SET quantity_in_stock = quantity_in_stock - OLD.quantity
      //             WHERE id = OLD.product_id;
      //         END IF;
      //         RETURN NULL;
      //     END;
      //     $$ LANGUAGE plpgsql;

      //     CREATE TRIGGER upd_quantityStock_123
      //     AFTER DELETE ON cart_detail
      //     FOR EACH ROW
      //     EXECUTE FUNCTION update_quantity_stock();
      // `;
      // await sequelize.query(triggerQuery);

      return errorResponse(res, 200, "Mua hàng thành công");
    } catch (error) {
      // Xử lý lỗi nếu có
      console.error("Error:", error);
      return errorResponse(res, 500, "Lỗi khi mua hàng");
    }
  },
  updateClickBuy: async (req, res) => {
    try {
      const checkExist = ` SELECT EXISTS (
        SELECT 1
        FROM information_schema.triggers
        WHERE trigger_name = 'upd_quantitystock_123' AND event_object_table = 'cart_detail'
    ); `;
      const checkExistinsert = ` SELECT EXISTS (
      SELECT 1
      FROM information_schema.triggers
      WHERE trigger_name = 'ins_orderdetail' AND event_object_table = 'cart_detail'
  ); `;
      const triggerQuery = `
            CREATE OR REPLACE FUNCTION update_quantity_stock()
            RETURNS TRIGGER AS $$
            BEGIN
                IF OLD.is_selected THEN
                    UPDATE products
                    SET quantity_in_stock = quantity_in_stock - OLD.quantity
                    WHERE id = OLD.product_id;
                END IF;
                RETURN NULL;
            END;
            $$ LANGUAGE plpgsql;

            CREATE TRIGGER upd_quantityStock_123 
            AFTER DELETE ON cart_detail
            FOR EACH ROW
            EXECUTE FUNCTION update_quantity_stock();
        `;
      const insertOrderDetail = `CREATE OR REPLACE FUNCTION insert_order_detail()
        RETURNS TRIGGER AS $$
        BEGIN
            INSERT INTO transactions (id, cart_id, product_id, image_product, product_name, 
            product_price, quantity, classify, total_price, created_at, updated_at)
            VALUES (OLD.id, OLD.cart_id, OLD.product_id, OLD.image_product, OLD.product_name, 
            OLD.product_price, OLD.quantity, OLD.classify, OLD.total_price, 
            NOW(), NOW());
            RETURN OLD;
        END;
        $$ LANGUAGE plpgsql;
        
        CREATE TRIGGER ins_orderdetail
        AFTER DELETE ON cart_detail
        FOR EACH ROW
        EXECUTE FUNCTION insert_order_detail();
        `;
      const [result, metadata] = await sequelize.query(checkExist);
      const exists = result[0].exists;
      console.log(exists);
      const [resultins, metadatains] = await sequelize.query(checkExistinsert);
      const existsins = resultins[0].exists;
      console.log(existsins);

      if (!exists) {
        await sequelize.query(triggerQuery);
      }
      if (!existsins) {
        await sequelize.query(insertOrderDetail);
      }
      const user_id = req.params.user_id;
      await CartDetail.destroy({
        where: {
          cart_id: user_id,
          is_selected: true,
        },
      });
      // Tạo trigger
      return errorResponse(res, 200, "Mua hàng thành công");
    } catch (error) {
      console.error("Error:", error);
      return errorResponse(res, 500, "Lỗi khi mua hàng");
    }
  },
  getTransaction: async (req, res) => {
    try {
      const user_id = req.params.user_id;

      const transaction = await Transaction.findAll({
        where: {
          cart_id: user_id,
        },
      });
      return errorResponse(
        res,
        200,
        "Lấy đơn hàng đã mua thành công ",
        transaction
      );
    } catch (error) {
      console.log(error);
      return errorResponse(res, 500, "Lỗi khi lấy đơn đã mua");
    }
  },
};
