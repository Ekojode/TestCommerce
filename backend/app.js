const express = require("express");
const logger = require("morgan");
const bodyParser = require("body-parser");
const mongoose = require("mongoose");
const cors = require("cors");

const productRoutes = require("./routes/products");
const orderRoutes = require("./routes/orders");
const categoryRoute = require("./routes/categories");
const uploadRoute = require("./routes/upload");
const userRoutes = require("./routes/users");
const mongoConnection = require("./password");

const app = express();

mongoose.connect(mongoConnection).then(() => console.log("Connected!"));

app.use(cors());
app.use(logger("dev"));
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

app.use("/products", productRoutes);
app.use("/categories", categoryRoute);
app.use("/orders", orderRoutes);
app.use("/upload", uploadRoute);
app.use("/users", userRoutes);

app.use((req, res, next) => {
  const error = new Error("Test Commerce route doesn't exist");
  error.status = 404;
  next(error);
});

app.use((err, req, res, next) => {
  res.status(err.status || 500);
  res.json({
    isSucessful: false,
    message: err.message,
    error: err,
  });
});

module.exports = app;
