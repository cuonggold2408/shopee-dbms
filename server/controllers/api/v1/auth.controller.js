const { User, UserToken, Blacklist } = require("../../../models/index");
const bcrypt = require("bcrypt");
const {
  createAccessToken,
  createRefreshToken,
  decodeToken,
} = require("../../../utils/jwt");
const { errorResponse, successResponse } = require("../../../utils/response");

module.exports = {
  register: async (req, res) => {
    try {
      const { email, password, username, phone_number } = req.body;
      if (!email || !password || !username || !phone_number) {
        return errorResponse(res, 400, "Bad Request");
      }
      const user = await User.findOne({ where: { email } });
      // console.log(user);
      if (user) {
        return errorResponse(res, 400, "Email đã tồn tại");
      }
      const hashPassword = bcrypt.hashSync(password, 10);
      const createUser = await User.create({
        email,
        password: hashPassword,
        username,
        phone_number,
      });
      return successResponse(res, 201, "Tạo tài khoản thành công");
    } catch (e) {
      console.log(e);
      return errorResponse(res, 400, "Bad Request");
    }
  },

  login: async (req, res) => {
    const { email, password } = req.body;

    if (!email || !password) {
      return errorResponse(res, 400, "Bad Request");
    }

    const user = await User.findOne({
      where: {
        email,
      },
    });
    if (!user) {
      return errorResponse(res, 404, "User not found");
    }
    const passwordHash = user.password;
    if (!bcrypt.compareSync(password, passwordHash)) {
      return errorResponse(res, 400, "Bad Request", {
        password: "Password is incorrect",
      });
    }

    // Tạo token
    const accessToken = createAccessToken({ userId: user.users_id });
    const refreshToken = createRefreshToken();
    await UserToken.create({
      user_id: user.users_id,
      refresh_token: refreshToken,
    });
    return successResponse(res, 200, "Success", {
      accessToken,
      refreshToken,
    });
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
    if (!refreshToken) {
      return errorResponse(
        res,
        400,
        "Bad Request",
        "Vui lòng cung cấp refresh token"
      );
    }
    try {
      decodeToken(refreshToken);
      const userToken = await UserToken.findOne({
        where: {
          refresh_token: refreshToken,
        },
      });
      if (!userToken) {
        throw new Error("Token not exists");
      }
      const { user_id: userId } = userToken;

      // Khởi tạo accessToken mới
      const accessToken = createAccessToken({ userId: userId });
      return successResponse(res, 200, "success", {
        accessToken,
        refreshToken,
      });
    } catch (e) {
      return errorResponse(res, 401, "Unauthorized");
    }
  },
};
