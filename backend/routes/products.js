const express = require("express");

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
    message: "Products gotten successfull",
    data: `you found ${prodId} and it has been updated successfully`,
  });
});

module.exports = router;
