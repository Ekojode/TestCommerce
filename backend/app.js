const express = require("express");
const logger = require("morgan");
const bodyParser = require("body-parser");
const mongoose = require("mongoose");

const productRoutes = require("./routes/products");
const orderRoutes = require("./routes/orders");
const mongoConnection = require("./password");

const app = express();

mongoose.connect(mongoConnection).then(() => console.log("Connected!"));

function delayMiddleware(req, res, next) {
  setTimeout(() => {
    next();
  }, 2500);
}

app.use(logger("dev"));
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(delayMiddleware);

app.use("/products", productRoutes);

app.use("/orders", orderRoutes);

app.use((req, res, next) => {
  const error = new Error("Test commerce ");
  error.status = 404;
  next(error);
});

app.use((err, req, res, next) => {
  res.status(err.status || 500);
  res.json({
    error: {
      message: err.message,
    },
  });
});

module.exports = app;
