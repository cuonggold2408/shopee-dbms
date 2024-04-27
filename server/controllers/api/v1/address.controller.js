const { User, Address } = require("../../../models/index");
const { errorResponse, successResponse } = require("../../../utils/response");

module.exports = {
  getAllAddressesByUserId: async (req, res) => {
    try {
      const id = req.params.id; // Lấy userId từ URL hoặc từ request body, phụ thuộc vào cách bạn thiết lập routing trong ứng dụng của mình

      // Tìm người dùng trong cơ sở dữ liệu
      const user = await User.findByPk(id);

      if (!user) {
        return errorResponse(res, 404, "Người dùng không tồn tại");
      }

      const addresses = await user.getAddresses();

      if (!addresses || addresses.length === 0) {
        return errorResponse(res, 404, "Người dùng chưa đăng ký địa chỉ");
      }

      return successResponse(res, 201, "Lấy address thành công", { addresses });
    } catch (error) {
      console.error("Lỗi khi lấy danh sách địa chỉ của người dùng:", error);
      // res.status(500).json({ error: 'Lỗi khi lấy danh sách địa chỉ của người dùng' });
      return errorResponse(
        res,
        500,
        "Lỗi khi lấy địa chỉ danh sách người dùng"
      );
    }
  },
  addAddress: async (req, res) => {
    try {
      const id = req.params.id;

      const {
        address_line,
        phone_receiver,
        name_receiver,
        province,
        default_address,
      } = req.body;

      if (
        !address_line ||
        !phone_receiver ||
        !name_receiver ||
        !province ||
        !default_address
      ) {
        return errorResponse(res, 400, "Vui lòng nhập đầy đủ thông tin.");
      }

      const userExists = await User.findByPk(id);

      if (!userExists) {
        return errorResponse(res, 404, "Người dùng không tồn tại.");
      }

      const newAddress = await userExists.createAddress({
        address_line,
        phone_receiver,
        name_receiver,
        province,
        default_address,
      });

      return successResponse(res, 201, "thêm địa chỉ mới thành công !", {
        newAddress,
      });
    } catch (error) {
      console.log("Lỗi khi thêm address:", error);
      return errorResponse(res, 500, "Lỗi khi thêm address");
    }
  },
};
