const express = require("express");

const UserController = require("../controllers/users");
const verifyAuth = require("../middlewares/verify_auth");

const router = express.Router();

router.post("/signup", UserController.signUp);

router.post("/login", UserController.login);

router.delete("/delete-user", verifyAuth, UserController.deleteUser);

module.exports = router;
