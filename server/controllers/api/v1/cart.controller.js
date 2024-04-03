const { errorResponse, successResponse } = require("../../../utils/response");
const { User, Address, Cart} = require("../../../models/index");


module.exports = {
    getUserCart: async (req, res) => {
        try{
            const id = req.params.id;
            const user = await User.findByPk(id);
    
            if (!user) {
                return errorResponse(res, 404, "Người dùng không tồn tại");
            }

            const cart = await user.getCart();

            if(!cart) {
                return errorResponse(res, 404, 'Người dùng chưa có giỏ hàng');
            }
            
            console.log(user, cart);
            return successResponse(res, 201, 'Lấy cart thành công', {cart});


        } catch (error) {
            console.error('Lỗi khi lấy giỏ hàng của người dùng:', error);
            return errorResponse(res, 500, "Lỗi khi lấy giỏ hàng của người dùng");
        }
    }
};