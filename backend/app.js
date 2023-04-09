const express = require("express");
const productRoutes = require("./routes/products");
const orderRoutes = require("./routes/orders");

const app = express();

function delayMiddleware(req, res, next) {
  setTimeout(() => {
    next();
  }, 2500);
}

app.use(delayMiddleware)

app.use("/products", productRoutes);

app.use("/orders", orderRoutes);

app.use((req, res, next) => {
  res.status(200).json({
    message: "It works",
  });
});

module.exports = app;
