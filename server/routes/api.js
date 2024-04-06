var express = require("express");
const authController = require("../controllers/api/v1/auth.controller");
const authMiddleware = require("../middlewares/api/auth.middleware");
const addressController = require("../controllers/api/v1/address.controller");
const cartController = require("../controllers/api/v1/cart.controller");
var router = express.Router();

router.post("/v1/auth/register", authController.register);

router.post("/v1/auth/login", authController.login);

router.get("/v1/auth/profile", authMiddleware, authController.profile);

router.post("/v1/auth/logout", authMiddleware, authController.logout);

router.post("/v1/auth/refresh", authController.refresh);

router.get("/v1/auth/users/get/address/:id", addressController.getAllAddressesByUserId);

router.post("/v1/auth/user/add/address/:id", addressController.addAddress);

router.post("/v1/auth/users/cart/:id", cartController.getUserCart);


module.exports = router;
