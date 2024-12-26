require("dotenv").config();

const express = require("express");
const { get_attend, get_attend_days, mark_out, mark_in } = require("../controllers/attendanceController.js");
const { authenticateTokenEmployee } = require("../middleware/tokenValidations.js");

const attendanceRouter = express.Router();
attendanceRouter.use(express.json());

//*  mark attendance in and out

attendanceRouter.post("/mark-in",authenticateTokenEmployee,mark_in);

attendanceRouter.post("/mark-out",authenticateTokenEmployee, mark_out);

//* get attendance data
attendanceRouter.post("/get-attend",authenticateTokenEmployee, get_attend);

//* get attendance count of days
attendanceRouter.get("/get-attend-days",authenticateTokenEmployee, get_attend_days);

module.exports = {attendanceRouter};
