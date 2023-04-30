const jwt = require("jsonwebtoken");

const verifyToken = (req, res, next) => {
  const token = req.headers.authorization;
  if (!token) {
    return res.status(401).json({
      isSuccessful: false,
      message: "Access denied",
    });
  }
  jwt.verify(token, process.env.JWT_KEY, (err, decoded) => {
    if (err) {
      return res
        .status(401)
        .json({ isSuccessful: false, message: "Invalid token" });
    }
    req.userId = decoded._id;
    next();
  });
};

module.exports = verifyToken;
