require("dotenv").config();

const express = require("express");
const {
  add_staff,
  join_employee,
  get_history,
  change_count,
  get_count,
} = require("../controllers/employeeController.js");
const { staffAddValidation } = require("../middleware/authValidation.js");
const { default: authenticateToken } = require("../middleware/tokenValidations.js");
const employeeRouter = express.Router();

employeeRouter.use(express.json());

//* add staff
employeeRouter.post("/add-employee", staffAddValidation, add_staff);

//* join company
employeeRouter.post("/join-employee", join_employee);

//* get attedance history
employeeRouter.get("/get-history",authenticateToken, get_history);

//* change the in and out count
employeeRouter.post("/change-count", authenticateToken, change_count);

//* get the in and out count
employeeRouter.get("/get-count", authenticateToken, get_count);

module.exports = employeeRouter;
