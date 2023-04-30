const bcrypt = require("bcrypt");
const mongoose = require("mongoose");
const jwt = require("jsonwebtoken");

const User = require("../models/users");

module.exports.signUp = (req, res, next) => {
    const email = req.body.email;
    const password = req.body.password;
  
    if (password.length < 6) {
      return res.status(404).json({
        isSuccessful: false,
        message: "Password is too short",
      });
    }
  
    User.findOne({ email: email })
      .exec()
      .then((user) => {
        if (user) {
          return res.status(404).json({
            isSuccessful: false,
            message: "User already exists",
          });
        } else {
          console.log("hashing started");
          bcrypt.hash(password, 10, (err, hash) => {
            if (err) {
              return res.status(500).json({
                isSuccessful: false,
                message: err.message,
                error: err,
              });
            } else {
              console.log(`This is the password: ${hash}`);
              const newUser = new User({
                _id: new mongoose.Types.ObjectId(),
                email: email,
                password: hash,
              });
              newUser
                .save()
                .then((user) => {
                  if (!user) {
                    return res.status(404).json({
                      isSuccessful: false,
                      message: "An error occurred",
                    });
                  }
                  res.status(201).json({
                    isSuccessful: true,
                    message: "User account created cuccessfully",
                    data: user,
                  });
                })
                .catch((err) => {
                  res.status(500).json({
                    isSuccessful: false,
                    message: err.message,
                    error: err,
                  });
                });
            }
          });
        }
      })
      .catch((err) => {
        res.status(500).json({
          isSuccessful: false,
          message: err.message,
          error: err,
        });
      });
  }

module.exports.login = async (req, res, next) => {
    User.findOne({
      email: req.body.email,
    })
      .exec()
      .then((user) => {
        if (!user) {
          return res.status(401).json({
            isSuccessful: false,
            message: "Invalid username or password",
          });
        }
        bcrypt.compare(req.body.password, user.password, (err, result) => {
          if (err) {
            return res.status(500).json({
              isSuccessful: false,
              message: "Server Error",
              error: err,
            });
          }
          if (!result) {
            return res.status(401).json({
              isSuccessful: false,
              message: "Invalid username or password",
            });
          }
          const token = jwt.sign({ _id: user._id }, process.env.JWT_KEY, {
            expiresIn: "8h",
          });
          res.status(200).json({
            isSuccessful: true,
            message: "User logged in successfully",
            data: user,
            token: token,
          });
        });
      })
      .catch((err) => {
        res.status(500).json({
          isSuccessful: false,
          message: "Server Error",
          error: err,
        });
      });
  }

module.exports.deleteUser =  (req, res, next) => {
    User.findOneAndDelete({ email: req.body.email })
      .exec()
      .then((user) => {
        if (!user) {
          return res.status(404).json({
            isSuccessful: false,
            message: "User doesn't exist",
          });
        }
        res.status(200).json({
          isSuccessful: true,
          message: "User deleted successfully",
          data: user,
        });
      })
      .catch((err) => {
        res.status(500).json({
          isSuccessful: false,
          message: err.message,
          error: err,
        });
      });
  }