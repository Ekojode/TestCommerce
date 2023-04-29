const mongoose = require("mongoose");

const productSchema = mongoose.Schema;
const ObjectId = productSchema.Types.ObjectId;



const Product = new productSchema({
  _id: ObjectId,
  name: { type: String, required: true },
  price: { type: Number, required: true },
  description: { type: String, required: true, minlength: 24 },
  category: { type: String, required: true },
  subCategory: { type: String, required: true },
  images: {
    type: [String],
    required: true
  },
  quantity: {
    type: Number,
    required: true,
  }
});

module.exports = mongoose.model("Product", Product);
