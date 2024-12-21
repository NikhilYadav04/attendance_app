require("dotenv").config();

const express = require("express");
const reportModel = require("../models/attendance.js");
const { mark, get_attend, get_attend_days } = require("../controllers/attendanceController.js");
const attendanceRouter = express.Router();
attendanceRouter.use(express.json());

// mark attendance
attendanceRouter.post("/mark",mark);

//get attendance data
attendanceRouter.post("/get-attend", get_attend);

//get attendance count of days
attendanceRouter.post("/get-attend-days",get_attend_days);

module.exports = attendanceRouter;
