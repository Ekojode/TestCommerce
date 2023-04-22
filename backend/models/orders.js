const mongoose = require("mongoose");

const orderSchema = mongoose.Schema;
const productSchema = mongoose.Schema(
  {
    product: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "Product",
      required: true,
    },
    quantity: { type: Number, required: true },
  },
  { _id: false }
);
const ObjectId = orderSchema.Types.ObjectId;

const Order = new orderSchema(
  {
    _id: ObjectId,
    products: [productSchema],
    paymentRef: {
      amount: {
        type: Number,
        required: true,
      },
      referenceNumber: {
        type: String,
        required: true,
      },
    },
    total: {
      type: Number,
      required: true,
    },
  },
  { timestamps: true }
);

module.exports = mongoose.model("Order", Order);
