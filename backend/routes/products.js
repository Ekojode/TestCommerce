const express = require("express");

const ProductModel = require("../models/products");

const router = express.Router();

router.get("/", (req, res, next) => {
  res.status(200).json({
    message: "Products gotten successfull",
    data: ["product 1", "product 2", "product 3"],
  });
});

router.get("/:productId", (req, res, next) => {
  const prodId = req.params.productId;

  res.status(200).json({
    message: "Products gotten successfull",
    data: `you found ${prodId}`,
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
  // const newProdData = req.body;
  // const newProduct = new ProductModel(
  //   _id : 
  // );

  res.status(201).json({
    message: "Products created successfully",
  });
});

module.exports = router;
