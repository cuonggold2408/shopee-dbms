const { where } = require("../../../modelMongo/evaluate");
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
      const {
        users_id,
        address_line,
        phone_receiver,
        name_receiver,
        default_address,
      } = req.body;

      if (
        !address_line ||
        !phone_receiver ||
        !name_receiver ||
        !default_address ||
        !users_id
      ) {
        return errorResponse(res, 400, "Vui lòng nhập đầy đủ thông tin.");
      }

      const addressAll = await Address.findAll({
        attributes: ["default_address"],
        where: {
          users_id: users_id,
        },
      });

      // Kiểm tra xem default_address trong addressAll có bằng true không
      const checkDefaultAddress = addressAll.filter(
        (item) => item.default_address === true
      );

      // Set default_address = false cho tất cả các address
      if (checkDefaultAddress.length > 0 && default_address === true) {
        await Address.update(
          { default_address: false },
          {
            where: {
              users_id: users_id,
            },
          }
        );
      }

      // Check sự trùng lặp của địa chỉ
      const checkAddress = await Address.findOne({
        where: {
          users_id,
          address_line,
          phone_receiver,
          name_receiver,
        },
      });

      if (checkAddress) {
        return errorResponse(res, 400, "Địa chỉ đã tồn tại");
      }

      // Set default_address = true cho address mới
      const newAddress = await Address.create({
        users_id,
        address_line,
        phone_receiver,
        name_receiver,
        default_address,
      });

      return successResponse(res, 201, "Thêm địa chỉ mới thành công", {
        newAddress,
      });
    } catch (error) {
      console.log("Lỗi khi thêm address:", error);
      return errorResponse(res, 500, "Lỗi khi thêm address");
    }
  },
  getAddress: async (req, res) => {
    const id = req.params.id;
    try {
      const address = await Address.findAll({
        where: {
          users_id: id,
        },
      });

      if (!address) {
        return errorResponse(res, 404, "Không tìm thấy địa chỉ");
      }

      return successResponse(res, 200, "Lấy địa chỉ thành công", { address });
    } catch (error) {
      console.error("Lỗi khi lấy địa chỉ:", error);
      return errorResponse(res, 500, "Lỗi khi lấy địa chỉ");
    }
  },
  updateSelectedAddress: async (req, res) => {
    try {
      const { users_id, is_selected, address_id } = req.body;

      const address = await Address.findOne({
        where: {
          address_id: address_id,
          users_id: users_id,
        },
      });

      const addressAll = await Address.findAll({
        attributes: ["is_selected"],
        where: {
          users_id: users_id,
        },
      });

      if (addressAll) {
        addressAll.map(async (item) => {
          if (item.is_selected === true) {
            await Address.update(
              { is_selected: false },
              {
                where: {
                  users_id: users_id,
                },
              }
            );
          }
        });
      }

      if (!address) {
        return errorResponse(res, 404, "Địa chỉ không tồn tại");
      }

      await Address.update(
        { is_selected: is_selected },
        {
          where: {
            users_id: users_id,
            address_id: address_id,
          },
        }
      );
      return successResponse(res, 200, "Cập nhật địa chỉ thành công", {
        address,
      });
    } catch (e) {
      console.log(e);
      return errorResponse(res, 500, "Lỗi khi cập nhật địa chỉ");
    }
  },
  getOneAddress: async (req, res) => {
    const { id, address_id } = req.params;
    try {
      const addressId = await Address.findOne({
        where: {
          users_id: id,
          address_id: address_id,
        },
      });
      if (!addressId) {
        return errorResponse(res, 404, "Không tìm thấy địa chỉ");
      }
      return successResponse(res, 200, "Lấy địa chỉ thành công", { addressId });
    } catch (e) {
      console.log(e);
    }
  },
  updateAddress: async (req, res) => {
    try {
      const {
        users_id,
        address_id,
        address_line,
        phone_receiver,
        name_receiver,
        default_address,
      } = req.body;

      console.log(req.body);

      if (!address_line || !phone_receiver || !name_receiver) {
        return errorResponse(res, 400, "Vui lòng nhập đầy đủ thông tin.");
      }

      const addressAll = await Address.findAll({
        attributes: ["default_address"],
        where: {
          users_id: users_id,
        },
      });

      // Kiểm tra xem default_address trong addressAll có bằng true không
      const checkDefaultAddress = addressAll.filter(
        (item) => item.default_address === true
      );

      // Set default_address = false cho tất cả các address
      if (checkDefaultAddress.length > 0 && default_address === true) {
        await Address.update(
          { default_address: false },
          {
            where: {
              users_id: users_id,
            },
          }
        );
      }

      // Check sự trùng lặp của địa chỉ
      const checkAddress = await Address.findOne({
        where: {
          users_id,
          address_line,
          phone_receiver,
          name_receiver,
          default_address,
        },
      });

      if (checkAddress) {
        return errorResponse(res, 400, "Địa chỉ đã tồn tại");
      }

      await Address.update(
        {
          address_line,
          phone_receiver,
          name_receiver,
          default_address,
        },
        {
          where: {
            users_id,
            address_id,
          },
        }
      );

      return successResponse(res, 200, "Cập nhật địa chỉ thành công");
    } catch (e) {
      console.log(e);
      return errorResponse(res, 500, "Lỗi khi cập nhật địa chỉ");
    }
  },
};
