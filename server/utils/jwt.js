const jwt = require("jsonwebtoken");

module.exports = {
  // Hàm tạo access token
  createAccessToken: (data) => {
    const { JWT_SECRET, JWT_ACCESS_TOKEN_EXPIRE } = process.env;
    const token = jwt.sign(data, JWT_SECRET, {
      expiresIn: JWT_ACCESS_TOKEN_EXPIRE,
    });
    return token;
  },

  // Hàm tạo refresh token
  createRefreshToken: () => {
    const { JWT_SECRET, JWT_REFRESH_TOKEN_EXPIRE } = process.env;
    const data = Math.random() + new Date().getTime(); // chuoi ngau nhien
    const token = jwt.sign({ data }, JWT_SECRET, {
      expiresIn: JWT_REFRESH_TOKEN_EXPIRE,
    });
    return token;
  },

  // Hàm giúp verify access token --> Trả về payload
  decodeToken: (token) => {
    const { JWT_SECRET } = process.env;
    const decoded = jwt.verify(token, JWT_SECRET);
    return decoded;
  },
};
