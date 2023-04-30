const express = require("express");

const OrderController = require("../controllers/orders");
const verifyAuth = require("../middlewares/verify_auth")

const router = express.Router();

router.post(
  "/",
  verifyAuth,
  OrderController.validateProductsExist,
  OrderController.validateQuantityLimit,
  OrderController.createNewOrder
);

router.get("/",  verifyAuth, OrderController.getAllOrders);

router.get("/:orderId",   verifyAuth,OrderController.getSingleOrder);

router.delete("/:orderId",  verifyAuth, (req, res) => {
  const orderId = req.params.orderId;
  res.status(201).json({
    message: "order deleted successfully",
    data: `${orderId} deleted successfully`,
  });
});

module.exports = router;
