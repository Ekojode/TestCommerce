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
    // validate: {
    //   validator: function (v) {
    //     return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(v);
    //   },
    //   message: (props) => `${props.value} is not a valid email address`,
    // },
    match: /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/,
  },
  password: {
    type: String,
    required: true,
    minlength: 6
  },
});

module.exports = mongoose.model("User", user);
