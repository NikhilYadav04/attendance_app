require("dotenv").config();

const express = require("express");
const { mark, get_attend, get_attend_days } = require("../controllers/attendanceController.js");
const { authenticateTokenEmployee } = require("../middleware/tokenValidations.js");

const attendanceRouter = express.Router();
attendanceRouter.use(express.json());

//*  mark attendance
attendanceRouter.post("/mark",authenticateTokenEmployee, mark);

//* get attendance data
attendanceRouter.post("/get-attend",authenticateTokenEmployee, get_attend);

//* get attendance count of days
attendanceRouter.get("/get-attend-days",authenticateTokenEmployee, get_attend_days);

module.exports = {attendanceRouter};
