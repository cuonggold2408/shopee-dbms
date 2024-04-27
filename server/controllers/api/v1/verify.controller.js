const { errorResponse, successResponse } = require("../../../utils/response");
const { User, UserToken } = require("../../../models/index");

const {
  decodeToken,
  createAccessToken,
  createRefreshToken,
} = require("../../../utils/jwt");
const sendMail = require("../../../utils/mail");
const otpGenerator = require("otp-generator");

module.exports = {
  getExpiresToken: async (req, res) => {
    try {
      const { access_token: accessToken, refresh_token: refreshToken } =
        req.body;
      // console.log("accessToken ở dòng 10: ", accessToken);
      // console.log("refreshToken ở dòng 11: ", refreshToken);
      const decodedAccess = decodeToken(accessToken);
      const decodedRefresh = decodeToken(refreshToken);
      if (!decodedAccess || !decodedRefresh) {
        return errorResponse(res, 400, "Token không hợp lệ");
      }
      const expAccess = decodedAccess.exp;
      const expRefresh = decodedRefresh.exp;
      return successResponse(res, 200, "Thời gian hết hạn của token", {
        expAccess,
        expRefresh,
        id: decodedAccess.userId,
      });
    } catch (e) {
      console.log(e);
      return errorResponse(res, 500, "Đã có lỗi xảy ra");
    }
  },
  verifyAccount: async (req, res) => {
    try {
      const { data } = req.body;
      const { email } = data;
      const userAgent = req.useragent;
      const userAgentInfo = userAgent.browser;
      const user = await User.findOne({ where: { email } });

      const accessUser = await UserToken.findOne({
        where: {
          user_id: user.users_id,
          device_name: userAgentInfo,
        },
      });

      const accessToken = createAccessToken({ userId: user.users_id });
      const refreshToken = createRefreshToken();

      const { box_1, box_2, box_3, box_4 } = data;

      if (!box_1 || !box_2 || !box_3 || !box_4) {
        return errorResponse(res, 400, "Vui lòng nhập đầy đủ mã OTP");
      }
      const otpClient = `${box_1}${box_2}${box_3}${box_4}`;
      if (otpClient !== accessUser.otp) {
        return errorResponse(res, 400, "Mã OTP không chính xác");
      }
      const expiredOTP = new Date(accessUser.expired_otp);
      const now = new Date();
      if (now.getTime() - expiredOTP.getTime() > 60 * 1000) {
        return errorResponse(res, 400, "Mã OTP đã hết hạn");
      }

      await UserToken.update(
        { status: true, refresh_token: refreshToken },
        { where: { user_id: user.users_id, device_name: userAgentInfo } }
      );
      return successResponse(res, 200, "Xác minh tài khoản thành công", {
        accessToken,
        refreshToken,
      });
    } catch (e) {
      console.log(e);
      return errorResponse(res, 500, "Đã có lỗi xảy ra");
    }
  },
  resendOTP: async (req, res) => {
    try {
      const { email } = req.body;
      const userAgent = req.useragent;
      const userAgentInfo = userAgent.browser;
      const user = await User.findOne({ where: { email } });

      const otp = otpGenerator.generate(4, {
        upperCaseAlphabets: false,
        specialChars: false,
        lowerCaseAlphabets: false,
      });

      await sendMail(
        email,
        "Xác minh tài khoản",
        `<h1>Mã xác minh là: ${otp}</h1>`
      );

      await UserToken.update(
        {
          otp: otp,
          expired_otp: new Date(),
        },
        {
          where: {
            user_id: user.users_id,
            device_name: userAgentInfo,
          },
        }
      );
      return successResponse(res, 200, "Đã gửi lại mã OTP");
    } catch (e) {
      console.log(e);
      return errorResponse(res, 500, "Đã có lỗi xảy ra");
    }
  },
};
