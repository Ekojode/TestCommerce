const express = require("express");


const verifyAuth = require("../middlewares/verify_auth");
const ProductController = require("../controllers/products");

const router = express.Router();

router.get("/", ProductController.getAllProducts);

router.get("/:productId", ProductController.getSingleProduct);

router.get("/category/:category", ProductController.getProductsInACategory);

router.patch("/:productId", verifyAuth, ProductController.editAProduct);

router.post("/", verifyAuth, ProductController.createNewProduct);

module.exports = router;
