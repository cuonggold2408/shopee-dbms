var express = require("express");
// eport table from mongoose
const authController = require("../controllers/api/v1/auth.controller");
const authMiddleware = require("../middlewares/api/auth.middleware");

const productsController = require("../controllers/api/v1/products.controller");
const productsControllerMongo = require("../controllers/api/v1/product_mongo.controller");
const addressController = require("../controllers/api/v1/address.controller");
const cartController = require("../controllers/api/v1/cart.controller");
const verifyController = require("../controllers/api/v1/verify.controller");
const esClient = require("../elasticsearch/server");
const { Client: ElasticsearchClient } = require("@elastic/elasticsearch");
const { Pool } = require("pg");
const client = require("../utils/redis");
const { successResponse, errorResponse } = require("../utils/response");

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

router.get("/v1/products/search/list", productsController.searchProducts);
router.get(
  "/v1/products/search/list/:id",
  productsController.searchProductsHaveUser
);

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
  await client.del("product_cart");
  const searchHistoryKey = "search-not-have-user";
  await client.del(searchHistoryKey);
  res.json({ message: "Clear cache successfully" });
});

// trả về lịch sử tìm kiếm của user không có userId
router.get("/v1/users/search", async (req, res) => {
  try {
    const searchHistoryKey = "search-not-have-user";
    const data = await client.lRange(searchHistoryKey, 0, -1);

    return successResponse(res, 200, "Success", { data });
  } catch (e) {
    return errorResponse(res, 500, e.message);
  }
});

// trả về lịch sử tìm kiếm của user có userId
router.get("/v1/users/search/:id", async (req, res) => {
  try {
    const searchHistoryKey = `search-${req.params.id}`;
    const data = await client.lRange(searchHistoryKey, 0, -1);

    return successResponse(res, 200, "Success", { data });
  } catch (e) {
    return errorResponse(res, 500, e.message);
  }
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

// click thanh toán
router.post("/v1/cart/click/buy/:user_id", cartController.updateClickBuy);
// lấy đơn hàng đã mua
router.get("/v1/transactions/get/one/:user_id", cartController.getTransaction);

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

const pool = new Pool({
  user: "postgres",
  host: "localhost",
  database: "shopee_dbms",
  password: "123456789",
  port: 5432,
});

// Route để đồng bộ hóa dữ liệu từ PostgreSQL lên Elasticsearch
router.get("/v1/sync-products", async (req, res) => {
  try {
    const productList = await fetchProductsFromPostgreSQL();
    await insertProductsIntoElasticsearch(productList);
    res.json({
      success: true,
      message: "Data synchronization completed successfully.",
    });
  } catch (error) {
    console.error("An error occurred:", error);
    res.status(500).json({
      success: false,
      error: "An error occurred while synchronizing data.",
    });
  }
});

// Route để tìm kiếm sản phẩm trong Elasticsearch
router.get("/v1/search-products", async (req, res) => {
  const { query } = req.query; // Extract query from query string
  try {
    const searchResults = await searchProductsInElasticsearch(query);
    res.json({ success: true, data: searchResults });
  } catch (error) {
    console.error("An error occurred:", error);
    res.status(500).json({
      success: false,
      error: "An error occurred while searching products.",
    });
  }
});

// Truy vấn dữ liệu từ PostgreSQL
async function fetchProductsFromPostgreSQL() {
  try {
    const client = await pool.connect();
    const query = `
          SELECT
              p.id AS product_id,
              p.product_name,
              p.productline_id,
              pl.productline_name,
              c.category_name,
              pc.id AS classify_id,
              array_agg(co.id) AS option_ids,
              array_agg(co.option_name) AS option_names,
              array_agg(pi.image_link) AS image_urls
          FROM
              products p
          JOIN
              productlines pl ON p.productline_id = pl.id
          JOIN
              categories c ON pl.category_id = c.id
          JOIN
              productclassifies pc ON p.id = pc.product_id
          JOIN
              classifyoptions co ON pc.id = co.classify_id
          LEFT JOIN
              productimages pi ON co.id = pi.option_id
          GROUP BY
              p.id, p.product_name, p.productline_id, pl.productline_name, c.category_name, pc.id;
      `;
    const { rows } = await client.query(query);
    client.release();

    const productsMap = {};
    rows.forEach((row) => {
      const productId = row.product_id;

      if (!productsMap[productId]) {
        productsMap[productId] = {
          id: productId,
          product_name: row.product_name,
          productline_id: row.productline_id,
          productline_name: row.productline_name,
          category_name: row.category_name,
          classifies: [],
        };
      }

      productsMap[productId].classifies.push({
        classify_id: row.classify_id,
        options: row.option_ids.map((id, index) => ({
          id: id,
          option_name: row.option_names[index],
          image_urls: row.image_urls[index],
        })),
      });
    });

    return Object.values(productsMap);
  } catch (error) {
    console.error("Error fetching data from PostgreSQL:", error);
    throw error;
  }
}

// Chèn danh sách vào Elasticsearch
async function insertProductsIntoElasticsearch(productList) {
  try {
    const body = productList.flatMap((product) => [
      { index: { _index: "products_index6" } },
      {
        id: product.id,
        product_name: product.product_name,
        productline_id: product.productline_id,
        productline_name: product.productline_name,
        category_name: product.category_name,
        classifies: product.classifies, // Nested structure
      },
    ]);

    console.log("Generated bulk body:", JSON.stringify(body, null, 2));

    await esClient.bulk({ refresh: true, body });
    console.log(
      "Data synchronization into Elasticsearch completed successfully."
    );
  } catch (error) {
    console.error("Error synchronizing data into Elasticsearch:", error);
    throw error;
  }
}

// Tìm kiếm sản phẩm trong Elasticsearch
async function searchProductsInElasticsearch(query) {
  try {
    // Tạo truy vấn tìm kiếm
    const searchQuery = {
      index: "products_index6", // Thay thế bằng tên index thực tế của bạn
      body: {
        size: 100,
        query: {
          match: {
            product_name: {
              query: query, // Từ khóa tìm kiếm
              // fuzziness: "AUTO" // Điều chỉnh mức độ tương tự
            },
          },
        },
      },
    };

    // Gửi truy vấn tìm kiếm đến Elasticsearch
    const response = await esClient.search(searchQuery);

    // Trích xuất và trả về các kết quả tìm kiếm
    const hits = response.hits.hits.map((hit) => hit._source);
    const uniqueHits = hits.filter(
      (value, index, self) =>
        index === self.findIndex((t) => t.product_name === value.product_name)
    );
    return uniqueHits;
  } catch (error) {
    console.error("Lỗi khi tìm kiếm sản phẩm trong Elasticsearch:", error);
    throw error;
  }
}

module.exports = router;
