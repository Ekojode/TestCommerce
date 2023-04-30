const express = require("express");

const UploadController = require("../controllers/upload");
const multer = require("../middlewares/multer");

const router = express.Router();

router.post("/", multer.array("images"), UploadController.uploadImages);

module.exports = router;
