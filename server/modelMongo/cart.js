const mongoose = require('mongoose');

// Tạo Schema một cách linh hoạt mà không cần định nghĩa cấu trúc cụ thể
const cart = new mongoose.Schema({}, { strict: false });

// Tạo model từ Schema và xuất nó
module.exports = mongoose.model("Cart", cart);
