require("dotenv").config();
const express = require("express");
const { request_leave, ar_leave, fetch_leaves_HR, fetch_leaves_employee } = require("../controllers/leaveController.js");
const { authenticateTokenEmployee, authenticateTokenCompany } = require("../middleware/tokenValidations.js");
const { leaveValidation } = require("../middleware/authValidation.js");

const leaveRouter = express.Router();
leaveRouter.use(express.json());

//* request a leave
leaveRouter.post("/request-leave",leaveValidation,authenticateTokenEmployee,request_leave);

//* approve or reject a leave
leaveRouter.post("/ar_leave",authenticateTokenCompany,ar_leave);

//* fetch leaves HR
leaveRouter.get("/fetch-leaves-HR",authenticateTokenCompany,fetch_leaves_HR);

//*fetch leaves Employee
leaveRouter.get("/fetch-leaves-employee",authenticateTokenEmployee,fetch_leaves_employee);


module.exports = { leaveRouter };
