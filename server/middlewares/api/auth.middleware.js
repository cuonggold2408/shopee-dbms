const { errorResponse } = require("../../utils/response");
const { User, Blacklist } = require("../../models/index");
const { decodeToken } = require("../../utils/jwt");
const redis = require("../../utils/redis");

module.exports = async (req, res, next) => {
  const accessToken = req.get("Authorization")?.split(" ").slice(1).join();
  try {
    if (accessToken) {
      // const blacklist = await Blacklist.findOne({
      //   where: {
      //     token: accessToken,
      //   },
      // });
      // if (blacklist) {
      //   throw new Error("Token Blacklist");
      // }
      const blacklistKey = `blacklist:${accessToken}`;
      const client = await redis;
      const result = await client.get(blacklistKey);
      if (result) {
        throw new Error("Token Blacklist");
      }
    }

    const { userId, exp } = decodeToken(accessToken);
    const user = await User.findByPk(userId, {
      attributes: {
        exclude: ["password"],
      },
    });

    req.user = {
      ...user.dataValues,
      exp,
      accessToken,
    };
    return next();
  } catch (e) {
    return errorResponse(res, 401, e.message);
  }
};
