var express = require("express");
const authController = require("../controllers/api/v1/auth.controller");
const authMiddleware = require("../middlewares/api/auth.middleware");

const productsController = require("../controllers/api/v1/products.controller");

const addressController = require("../controllers/api/v1/address.controller");
const cartController = require("../controllers/api/v1/cart.controller");
const verifyController = require("../controllers/api/v1/verify.controller");

var router = express.Router();

// Authenication
router.post("/v1/auth/register", authController.register);

router.post("/v1/auth/login", authController.login);

router.get("/v1/auth/profile", authMiddleware, authController.profile);

router.post("/v1/auth/logout", authMiddleware, authController.logout);

router.post("/v1/auth/refresh", authController.refresh);

// Verify Account
router.post("/v1/auth/get-expires-token", verifyController.getExpiresToken);
router.post("/v1/auth/verify", verifyController.verifyAccount);
router.post("/v1/auth/resend-otp", verifyController.resendOTP);

router.get("/v1/products/category/:id", productsController.getOneCategory);

router.get("/v1/products/category/:id", productsController.getOneCategory);

router.get("/v1/products", productsController.getProducts);

router.get("/v1/products/:id", productsController.getProductById);

router.get("/v1/products/category", productsController.showCategories);

router.get(
  "/v1/auth/users/get/address/:id",
  addressController.getAllAddressesByUserId
);

router.post("/v1/auth/user/add/address/:id", addressController.addAddress);

// Cart
router.get("/v1/auth/users/cart", cartController.getUserCart);
router.post("/v1/auth/products/cart", cartController.addProductToCart);
router.get("/v1/auth/products/cart/:id", cartController.getProductToCart);

module.exports = router;
