const mongoose = require("mongoose");

const productSchema = mongoose.Schema;
const ObjectId = productSchema.Types.ObjectId;

const Product = new productSchema({
   _id: ObjectId,
  name: String,
  price: Number,
  description: String,
  category: String,
  subCategory: String,
  image: String
});

module.exports = mongoose.model("Product", Product);
