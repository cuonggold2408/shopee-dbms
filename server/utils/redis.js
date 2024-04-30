const { createClient } = require("redis");

module.exports = createClient()
  .on("error", (err) => console.log("Redis Client Error", err))
  .connect();
