const express = require("express");

const router = express.Router();

router.post("/", (req, res) => {
  const order = req.body;
  console.log(order);
  res.status(201).json({
    message: "order created successfully",
    data: order,
  });
});

router.get("/", (req, res) => {
  res.status(201).json({
    message: "Successful",
    data: "All orders returned",
  });
});

router.get("/:orderId", (req, res) => {
  const orderId = req.params.orderId;
  res.status(201).json({
    message: "order returned successfully",
    data: `${orderId} returned successfully`,
  });
});

router.delete("/:orderId", (req, res) => {
  const orderId = req.params.orderId;
  res.status(201).json({
    message: "order deleted successfully",
    data: `${orderId} deleted successfully`,
  });
});

module.exports = router;
