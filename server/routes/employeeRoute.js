require("dotenv").config();

const express = require("express");
const {
  add_staff,
  join_employee,
  get_history,
  change_count,
  get_count,
  remove_staff,
  upload_photo,
  get_profile,
} = require("../controllers/employeeController.js");
const { staffAddValidation, EmployeeJoinValidation } = require("../middleware/authValidation.js");
const {  authenticateTokenEmployee, authenticateTokenCompany } = require("../middleware/tokenValidations.js");
const upload = require("../services/multer.js");
const employeeRouter = express.Router();

employeeRouter.use(express.json());

//* add staff
employeeRouter.post("/add-employee", staffAddValidation, authenticateTokenCompany, add_staff);

//*remove staff
employeeRouter.post("/remove-employee",authenticateTokenCompany,remove_staff);

//* join company
employeeRouter.post("/join-employee", EmployeeJoinValidation, join_employee);

//* get attedance history
employeeRouter.get("/get-history",authenticateTokenEmployee, get_history);

//* change the in and out count
employeeRouter.post("/change-count",authenticateTokenEmployee, change_count);

//* get the in and out count
employeeRouter.get("/get-count", authenticateTokenCompany, get_count);

//*add profile picture
employeeRouter.post('/upload',authenticateTokenEmployee,upload.single('photo'),upload_photo);

//* get progiile picture
employeeRouter.get('/get-profile',authenticateTokenEmployee,get_profile)

module.exports = {employeeRouter};
