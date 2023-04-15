const express = require("express");
const mongoose = require("mongoose");

const ProductModel = require("../models/products");

const router = express.Router();

router.get("/", (req, res, next) => {
  ProductModel.find()
    .then((products) => {
      res.status(200).json({
        isSuccessful: true,
        message: "Products retrieved successfully",
        data: products,
      });
    })
    .catch((err) => {
      res.status(500).json({
        isSuccessful: false,
        message: err.message,
      });
    });
});

router.get("/:productId", async (req, res, next) => {
  const prodId = req.params.productId;

  try {
    const product = await ProductModel.findById(prodId);
    if (!product) {
      return res.status(404).json({
        isSuccessful: false,

        message: "Product not found",
      });
    }
    res.status(200).json({
      isSuccessful: true,
      message: "Product retrieved successfuly",
      data: product,
    });
  } catch (err) {
    res.status(500).json({
      isSuccessful: false,
      message: err.message,
    });
  }
});

router.get("/category/:category", (req, res) => {
  const category = req.params.category;

  ProductModel.find({ category: category })
    .then((products) => {
      if (products.length === 0) {
        res.status(404).json({
          isSuccessful: false,
          message: "No products found in this category",
        });
      }
      res.status(200).json({
        isSuccessful: true,
        message: "Successful",
        products: products,
      });
    })
    .catch((err) => {
      res.status(500).json({
        isSuccessful: false,
        message: err.message,
      });
    });
});

router.patch("/:productId", (req, res, next) => {
  const prodId = req.params.productId;
  const newProdData = req.body;

  ProductModel.findByIdAndUpdate(prodId, newProdData, {
    new: true,
    runValidators: true,
  })
    .then((product) => {
      if (!product) {
        res.status(404).json({
          isSuccessful: false,
          message: "No product found",
        });
      }
      res.json({
        isSuccessful: true,
        message: "Product updated successfully",
        data: product,
      });
    })
    .catch((error) => {
      res.status(500).json({
        isSuccessful: false,
        message: error.message,
        data: error,
      });
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
    image: newProdData.image,
  });

  newProduct
    .save()
    .then((result) => {
      if (!result) {
        res.status(404).json({
          isSuccessful: false,
          message: "An error occurred",
        });
      }
      console.log(result);
      res.status(201).json({
        isSuccessful: true,
        message: "Products created successfully",
        data: result,
      });
    })
    .catch((error) => {
      res.status(500).json({
        isSuccessful: false,
        message: error.message,
      });
    });
});

module.exports = router;
