const mongoose = require("mongoose");

const userSchema = mongoose.Schema;
const ObjectId = userSchema.Types.ObjectId;

const user = new userSchema({
  _id: ObjectId,
  email: {
    type: String,
    required: true,
    trim: true,
    lowercase: true,
    unique: true,
    match: /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/,
  },
  password: {
    type: String,
    required: true,
  },
});

module.exports = mongoose.model("User", user);
