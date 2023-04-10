const express = require("express");
const mongoose = require("mongoose");

const ProductModel = require("../models/products");
const products = require("../models/products");

const router = express.Router();

router.get("/", (req, res, next) => {
  ProductModel.find()
    .then((products) => {
      res.status(200).json({
        message: true,
        products: products,
      });
    })
    .catch((err) => {
      res.status(500).json({
        message: err,
      });
    });
});

router.get("/:productId", async (req, res, next) => {
  const prodId = req.params.productId;

  try {
    const product = await ProductModel.findById(prodId);
    if (!product) {
      return res.status(404).json({ message: "Product not found" });
    }
    res.status(200).json(product);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

router.get("/category/:category", (req, res) => {
  const category = req.params.category;

  ProductModel.find({ category: category })
    .then((products) => {
      if (products.length === 0) {
        res.status(404).json({ message: "No products found in this category" });
      }
      res.status(200).json({
        message: "Successful",
        products: products,
      });
    })
    .catch((err) => {
      res.status(500).json({
        message: err.message,
      });
    });
});

router.patch("/:productId", (req, res, next) => {
  const prodId = req.params.productId;

  res.status(200).json({
    message: "Products updated successfull",
    data: `you found ${prodId} and it has been updated successfully`,
  });
});

router.post("", (req, res, next) => {
  const newProdData = req.body;
  const newProduct = new ProductModel({
    _id: new mongoose.Types.ObjectId(),
    name: newProdData.name,
    price: newProdData.price,
    description: newProdData.description,
    category: newProdData.category,
    subCategory: newProdData.subCategory,
  });

  newProduct
    .save()
    .then((result) => {
      console.log(result);
    })
    .catch((error) => {
      console.log(error);
    });

  res.status(201).json({
    message: "Products created successfully",
    products: newProduct,
  });
});

module.exports = router;
