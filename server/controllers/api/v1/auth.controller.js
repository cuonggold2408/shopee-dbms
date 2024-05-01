const { User, UserToken, Blacklist, Cart } = require("../../../models/index");
const bcrypt = require("bcrypt");
const {
  createAccessToken,
  createRefreshToken,
  decodeToken,
} = require("../../../utils/jwt");
const { errorResponse, successResponse } = require("../../../utils/response");
const otpGenerator = require("otp-generator");
const generator = require("generate-password");
const sendMail = require("../../../utils/mail");
const emailRegex = require("../../../utils/match_email");
const { Op, where } = require("sequelize");

module.exports = {
  register: async (req, res) => {
    try {
      const userAgent = req.useragent;
      const userAgentInfo = userAgent.browser;
      const { email, password, username, phone_number } = req.body;
      if (!email || !password || !username || !phone_number) {
        return errorResponse(res, 400, "Vui lòng nhập đầy đủ thông tin");
      }
      if (password.trim().length < 8) {
        return errorResponse(res, 400, "Mật khẩu phải có ít nhất 8 ký tự");
      }

      if (!emailRegex(email)) {
        return errorResponse(res, 400, "Email không hợp lệ");
      }

      const user = await User.findOne({ where: { email } });
      if (user) {
        return errorResponse(res, 400, "Tài khoản đã tồn tại");
      }
      const saltRounds = 10;
      const hashPassword = bcrypt.hashSync(password, saltRounds);
      const createUser = await User.create({
        email,
        password: hashPassword,
        username,
        phone_number,
      });
      await UserToken.create({
        user_id: createUser.users_id,
        device_name: userAgentInfo,
      });
      return successResponse(res, 201, "Đăng ký tài khoản thành công");
    } catch (e) {
      console.log(e);
      return errorResponse(res, 500, "Đã có lỗi xảy ra");
    }
  },

  login: async (req, res) => {
    try {
      const userAgent = req.useragent;
      const userAgentInfo = userAgent.browser;
      const { email, password } = req.body;

      if (!email || !password) {
        return errorResponse(res, 400, "Vui lòng nhập đầy đủ thông tin");
      }
      const user = await User.findOne({ where: { email } });
      if (!user) {
        return errorResponse(res, 400, "Tài khoản không tồn tại");
      }
      const checkPassword = bcrypt.compareSync(password, user.password);
      if (!checkPassword) {
        return errorResponse(
          res,
          400,
          "Tài khoản hoặc mật khẩu không chính xác"
        );
      }

      const accessToken = createAccessToken({ userId: user.users_id });
      const refreshToken = createRefreshToken();

      // User đăng ký mà chưa đăng nhập lần nào, token vẫn null
      const accessUserToRegister = await UserToken.findOne({
        where: {
          user_id: user.users_id,
          device_name: userAgentInfo,
          refresh_token: null,
        },
      });

      // User đã đăng ký , token đã được update, đã biết ở trình duyệt nào
      const accessUser = await UserToken.findOne({
        where: {
          user_id: user.users_id,
          device_name: userAgentInfo,
          refresh_token: {
            [Op.not]: null,
          },
        },
      });

      if (accessUserToRegister) {
        // Nếu đã verify email thì update token
        if (accessUserToRegister.status) {
          await UserToken.update(
            {
              refresh_token: refreshToken,
            },
            {
              where: {
                user_id: user.users_id,
              },
            }
          );
        } else {
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

          await accessUserToRegister.update(
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
        }
      } else {
        if (accessUser) {
          await UserToken.update(
            {
              refresh_token: refreshToken,
            },
            {
              where: {
                user_id: user.users_id,
                device_name: userAgentInfo,
              },
            }
          );

          await Cart.findOrCreate({
            where: {
              users_id: user.users_id,
            },
            defaults: {
              users_id: user.users_id,
            },
          });

          return successResponse(res, 200, "Đăng nhập thành công", {
            accessToken,
            refreshToken,
          });
        } else {
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
          await UserToken.create({
            user_id: user.users_id,
            device_name: userAgentInfo,
            otp: otp,
          });
        }
      }

      return successResponse(res, 202, "Vui lòng xác minh tài khoản");
    } catch (e) {
      console.log(e);
      return errorResponse(res, 500, "Đã có lỗi xảy ra");
    }
  },

  profile: async (req, res) => {
    return successResponse(res, 200, "Success", req.user);
  },
  logout: async (req, res) => {
    const { accessToken, exp } = req.user;
    try {
      const [blacklist] = await Blacklist.findOrCreate({
        where: {
          token: accessToken,
        },
        defaults: {
          token: accessToken,
          expired: exp,
        },
      });

      if (blacklist) {
        return successResponse(res, 200, "Đăng xuất thành công");
      }
    } catch (e) {
      return errorResponse(res, 500, "Server Error");
    }
  },
  refresh: async (req, res) => {
    // Cap lai access token moi
    const { refresh_token: refreshToken } = req.body;
    console.log(refreshToken);
    if (!refreshToken) {
      return errorResponse(
        res,
        400,
        "Bad Request",
        "Vui lòng cung cấp refresh token"
      );
    }
    try {
      const decode = decodeToken(refreshToken);
      const userToken = await UserToken.findOne({
        where: {
          refresh_token: refreshToken,
        },
      });
      if (!userToken) {
        throw new Error("Token not exists");
      }

      // Khởi tạo accessToken mới
      const accessToken = createAccessToken({ userId: userToken.user_id });
      const newRefreshToken = createRefreshToken();
      console.log(newRefreshToken);
      await UserToken.update(
        {
          refresh_token: newRefreshToken,
        },
        {
          where: {
            refresh_token: refreshToken,
          },
        }
      );
      const decodedAccess = decodeToken(accessToken);
      return successResponse(res, 200, "Success", {
        accessToken,
        refreshToken: newRefreshToken,
        expAccess: decodedAccess.exp,
      });
    } catch (e) {
      console.log(e);
      return errorResponse(res, 401, "Unauthorized");
    }
  },
};
