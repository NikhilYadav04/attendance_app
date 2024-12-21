const jwt = require('jsonwebtoken')
const dotenv = require('dotenv')
dotenv.config();

const authenticateTokenCompany = (req, res, next) => {
  const auth = req.headers.authorization;

  if (!auth || !auth.startsWith("Bearer ")) {
    return res.status(401).json({
      success: false,
      message: "Unauthorized, JWT Token is required",
    });
  }

  const token = auth.split(" ")[1];
  try {
    const decoded = jwt.verify(token, process.env.COMPANY_TOKEN);
    req.user = decoded;
    console.log(decoded);
    next();
  } catch (e) {
    return res.status(500).json({
      success: false,
      message: e.message,
    });
  }
};

const authenticateTokenEmployee = (req, res, next) => {
  const auth = req.headers.authorization;

  if (!auth || !auth.startsWith("Bearer ")) {
    return res.status(401).json({
      success: false,
      message: "Unauthorized, JWT Token is required",
    });
  }

  const token = auth.split(" ")[1];
  try {
    const decoded = jwt.verify(token, process.env.EMPLOYEE_TOKEN);
    req.user = decoded;
    console.log(decoded);
    next();
  } catch (e) {
    return res.status(500).json({
      success: false,
      message: e.message,
    });
  }
};

module.exports = {authenticateTokenCompany, authenticateTokenEmployee};