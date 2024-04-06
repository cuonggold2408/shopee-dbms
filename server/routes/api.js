var express = require("express");
const authController = require("../controllers/api/v1/auth.controller");
const authMiddleware = require("../middlewares/api/auth.middleware");
const productsController = require("../controllers/api/v1/products.controller");
var router = express.Router();

router.post("/v1/auth/register", authController.register);

router.post("/v1/auth/login", authController.login);

router.get("/v1/auth/profile", authMiddleware, authController.profile);

router.post("/v1/auth/logout", authMiddleware, authController.logout);

router.post("/v1/auth/refresh", authController.refresh);

router.get("/v1/products", productsController.getProducts);

router.get("/v1/products/category", productsController.showCategories);


module.exports = router;
