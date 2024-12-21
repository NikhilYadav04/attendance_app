require("dotenv").config();

const express = require("express");
const reportModel = require("../models/attendance.js");
const { mark, get_attend, get_attend_days } = require("../controllers/attendanceController.js");
const { default: authenticateToken } = require("../middleware/tokenValidations.js");
const attendanceRouter = express.Router();
attendanceRouter.use(express.json());

//*  mark attendance
attendanceRouter.post("/mark",authenticateToken, mark);

//* get attendance data
attendanceRouter.post("/get-attend",authenticateToken, get_attend);

//* get attendance count of days
attendanceRouter.get("/get-attend-days",authenticateToken, get_attend_days);

module.exports = attendanceRouter;
