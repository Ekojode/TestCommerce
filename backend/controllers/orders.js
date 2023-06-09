const mongoose = require("mongoose");

const Order = require("../models/orders");
const Product = require("../models/products");

module.exports.validateProductsExist = async (req, res, next) => {
  const productIds = req.body.products.map((product) => product.product);
  try {
    const products = await Product.find({ _id: { $in: productIds } });
    if (products.length !== productIds.length) {
      return res.status(400).json({
        isSuccessful: false,
        message: "Invalid product IDs",
      });
    }
    next();
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: "Server error" });
  }
};

module.exports.validateQuantityLimit = async (req, res, next) => {
  const productIds = req.body.products.map((product) => product.product);
  const productQuantities = req.body.products.map(
    (product) => product.quantity
  );
  try {
    const products = await Product.find({ _id: { $in: productIds } });
    for (let i = 0; i < products.length; i++) {
      if (productQuantities[i] > products[i].quantity) {
        return res.status(400).json({
          isSuccessful: false,
          message: "Quantity ordered greated than products available",
        });
      }
    }
    next();
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: "Server error" });
  }
};

module.exports.createNewOrder = (req, res) => {
  const orderData = req.body;

  const newOrder = new Order({
    _id: new mongoose.Types.ObjectId(),
    products: req.body.products,
    total: req.body.total,
    paymentRef: req.body.paymentRef,
  });

  newOrder
    .save()
    .then((order) => {
      if (!order) {
        return res.status(404).json({
          isSuccessful: false,
          message: "An error occurred",
        });
      }
      for (let i = 0; i < orderData.products.length; i++) {
        const orderedProduct = orderData.products[i];
        const productId = orderedProduct.product;
        const orderedQuantity = orderedProduct.quantity;

        Product.findById(productId)
          .then((product) => {
            if (!product) {
              return res.status(404).json({
                isSuccessful: false,
                message: "Product not found",
              });
            }

            product.quantity = product.quantity - orderedQuantity;
            product.save();
          })
          .catch((error) => {
            console.error(error);
            res.status(500).json({
              isSuccessful: false,
              message: "Internal server error",
              error: error,
            });
          });
      }
      res.status(200).json({
        isSuccessful: true,
        message: "Order created successfully",
        data: order,
      });
    })
    .catch((err) => {
      res.status(500).json({
        isSuccessful: false,
        message: err.message,
        error: err,
      });
    });
};

module.exports.getAllOrders = (req, res) => {
  Order.find()
    .populate({
      path: "products.product",
    })
    .then((orders) => {
      if (!orders) {
        return res.status(404).json({
          isSuccessful: false,
          message: "Error retrieving Orders",
        });
      }
      res.status(200).json({
        isSuccessful: true,
        message: "Orders retrieved successfully",
        data: orders,
      });
    })
    .catch((err) => {
      res.status(500).json({
        isSuccessful: false,
        message: err.message,
        error: err,
      });
    });
};

module.exports.getSingleOrder = (req, res, next) => {
  const orderId = req.params.orderId;
  Order.findById(orderId)
    .populate({
      path: "products.product",
    })
    .then((order) => {
      if (!order) {
        return res.status(404).json({
          isSuccessful: false,
          message: "Error finding order",
        });
      }

      res.status(200).json({
        isSuccessful: true,
        message: "Order retrieved successfully",
        data: order,
      });
    })
    .catch((err) => {
      res.status(500).json({
        isSuccessful: false,
        message: err.message,
        errror: err,
      });
    });
};
