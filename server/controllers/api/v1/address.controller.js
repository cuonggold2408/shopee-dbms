const { User, Address} = require("../../../models/index");

const { errorResponse, successResponse } = require("../../../utils/response");

module.exports = {
    getUserAddresses: async (req, res) => {
        try {
          const userId = 1; //req.params.userId; // giả sử nhận id là 1;
          const userWithAddresses = await User.findByPk(userId, {
            include: [{
              model: Address,
              through: {
                attributes: [], // không lấy thuộc tính nào từ bảng trung gian
              },
            }],
          });
      
          if (!userWithAddresses) {
            console.log(userWithAddresses)
            // return res.status(404).send({ message: 'User not found' });
            return errorResponse(res, 404, "Tài khoản chưa đăng ký address");

          }
      
        //   res.send(userWithAddresses.Addresses);
        console.log(userWithAddresses.Address);
        return successResponse(res, 201, 'Lấy address thành công');
          
        } catch (error) {
          console.error('Error getting user addresses:', error);
          return errorResponse(res, 500, "Đã có lỗi xảy ra");
        }
    }
} 