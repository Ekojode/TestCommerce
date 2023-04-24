const express = require("express");

const cloudinary = require("../middlewares/cloudinary");
const multer = require("../middlewares/multer");

const router = express.Router();

router.post("/", multer.array("images"), async (req, res) => {
  var imageUrlList = [];

  for (var i = 0; i < req.files.length; i++) {
    var locaFilePath = req.files[i].path;
    await cloudinary.uploader
      .upload(locaFilePath, {
        quality: 'auto',
        
        use_filename: true,
        unique_filename: false,
        overwrite: true,
      })
      .then((res) => {
        imageUrlList.push(res.secure_url);
      });
  }

  var response = imageUrlList;

  return res.send(response);
});

module.exports = router;
