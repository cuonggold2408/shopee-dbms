// const { createClient } = require("redis");

// module.exports = createClient()
//   .on("error", (err) => console.log("Redis Client Error", err))
//   .connect();

const { createClient } = require("redis");

const client = createClient();

client.on("error", (err) => console.log("Redis Client Error", err));

// Đảm bảo client được kết nối trước khi trả về
(async () => {
  await client.connect();
})();

module.exports = client;
