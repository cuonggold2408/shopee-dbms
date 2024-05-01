var express = require("express");
// eport table from mongoose
const authController = require("../controllers/api/v1/auth.controller");
const authMiddleware = require("../middlewares/api/auth.middleware");

const productsController = require("../controllers/api/v1/products.controller");
const productsControllerMongo = require("../controllers/api/v1/product_mongo.controller");
const addressController = require("../controllers/api/v1/address.controller");
const cartController = require("../controllers/api/v1/cart.controller");
const verifyController = require("../controllers/api/v1/verify.controller");

const redis = require("../utils/redis");

var router = express.Router();

// Authenication

// api for myqsl
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

router.get("/v1/products", productsController.getProducts);

router.get("/v1/products/category", productsController.showCategories);

router.get("/v1/products/:id", productsController.getProductById);

router.get(
  "/v1/category/show/products/:categoryName",
  productsController.getOneCategoryProducts
);

router.get(
  "/v1/auth/users/get/address/:id",
  addressController.getAllAddressesByUserId
);

router.post("/v1/user/add/address", addressController.addAddress);
router.get("/v1/user/get/address/:id", addressController.getAddress);
router.post(
  "/v1/user/update/selected/address",
  addressController.updateSelectedAddress
);
router.post("/v1/user/update/address", addressController.updateAddress);
router.get(
  "/v1/user/get/address/:id/:address_id",
  addressController.getOneAddress
);

// Cart
router.get("/v1/auth/users/cart", cartController.getUserCart);
router.post("/v1/auth/products/cart", cartController.addProductToCart);
router.get("/v1/auth/products/cart/:id", cartController.getProductToCart);
router.post("/v1/auth/users/cart/:id", cartController.getUserCart);
router.delete(
  "/v1/auth/products/cart/:id/:product_id/:classify",
  cartController.deleteProductFromCart
);
router.post("/v1/products/cart", cartController.updateProductToCart);
router.post(
  "/v1/products/selected/cart",
  cartController.addSelectedProductToCart
);

// clear cache
router.post("/v1/clear-cache", async (req, res) => {
  const client = await redis;
  await client.del("product_cart");
  res.json({ message: "Clear cache successfully" });
});

// api for mongoose
router.get(
  "/v1/products/get/all/evaluate/:user_id",
  productsControllerMongo.getAllEvaluated
);

router.get(
  "/v1/products/get/one/evaluate/:user_id/:id",
  productsControllerMongo.getOneEvaluated
);

// post
router.post(
  "/v1/products/post/one/new/evaluate/:user_id/:id",
  productsControllerMongo.pushOneEvaluate
);

router.put(
  "/v1/products/update/one/evaluated/:user_id/:id",
  productsControllerMongo.updateOneEvaluated
);
router.delete(
  "/v1/products/delete/one/evaluated/:user_id/:id",
  productsControllerMongo.deleteOneEvaluated
);

router.get("/v1/testinsert", productsControllerMongo.testInsert);
router.post(
  "/v1/carts/post/one/carted/:user_id/:id",
  productsControllerMongo.pushOneCart
);
router.delete(
  "/v1/carts/delete/one/carted/:user_id/:id",
  productsControllerMongo.deleteOneCart
);

// api for mongoose and mysql

// get one commt ví dụ khi xm lịch sử mua hàng của mình
router.get(
  "/v1/user/get/one/:user_id/:id",
  productsControllerMongo.getOneDetailUser
);

// hin tất cả commnt của 1 sản phẩm
router.get(
  "/v1/user/get/all/commented/:id",
  productsControllerMongo.getAllCommented
);

router.post(
  "/v1/products/selected-all/cart",
  cartController.addSelectedProductToCartAll
);
router.get("/v1/products/checkout/cart/:id", cartController.getCheckoutCart);
router.get("/v1/testinsert", productsControllerMongo.testInsert);


router.post("/v1/cart/click/buy/:user_id", cartController.updateClickBuy)


// router.get('/testinsert', (req, res) => {
//   const sp = new Evaluates({
//     product_id: 6,
//     commented: "xin chào2",
//   });

//   sp.save().then(() => {
//     console.log("Saved successfully");
//     res.status(200).send("Thêm dữ liệu thành công");
//   }).catch((err) => {throw err})
// });
// router.get('/test1/:id', async (req, res) => {
//   const query = evaluate.find({
//     product_id: req.params.id
//   });
//   query.getFilter();
//   const doc = await query.exec();
//   res.send(doc);
// });
// insert data
// const sp = new evaluate({
//   product_id: 2,
//   commented: "hi",
// });

// sp.save().then(() => {
//   console.log("Thêm dữ liệu thành công")
// }).catch((err) => {throw err})
module.exports = router;
