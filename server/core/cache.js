const redis = require("../utils/redis");

module.exports = class {
  static async remember(key, expire, callback) {
    const client = await redis;
    const cached = await client.get(key);
    if (!cached) {
      const data = await callback();
      await client.set(key, JSON.stringify(data), "EX", expire);
      return data;
    }
    return JSON.parse(cached);
  }
  static async rememberForever(key, callback) {
    const client = await redis;
    const cached = await client.get(key);
    if (!cached) {
      const data = await callback();
      await client.set(key, JSON.stringify(data));
      return data;
    }
    return JSON.parse(cached);
  }
};
