const reportModel = require("../models/attendance");

require("dotenv").config();

const mark = async (req, res) => {
  try {
    const { employeeID } = req.user;

    const { InTime, OutTime, Date, isPresent, Month } = req.body;

    const report = await reportModel.findOne({
      employeeID: employeeID,
    });

    let attendanceBody = {
      InTime,
      OutTime,
      Date,
      isPresent,
    };

    const monthIndex = report.daysPresent.findIndex(
      (entry) => entry.Month === Month
    );

    if (monthIndex >= 0) {
      if (isPresent) {
        report.daysPresent[monthIndex].daysPresent += 1;
      }
    } else if (isPresent) {
      report.daysPresent.push({
        Month,
        daysPresent: 1,
      });
    }

    await report.attendance.push(attendanceBody);

    await report.save();

    return res.status(200).json({
      success: true,
      message: report.daysPresent,
    });
  } catch (e) {
    return res.status(500).json({
      success: false,
      message: e.message,
    });
  }
};

const get_attend = async (req, res) => {
  try {
    const { employeeID } = req.user;
    const { Date } = req.body;

    const report = await reportModel.findOne({ employeeID });

    if (!report) {
      return res.status(400).json({
        success: false,
        message: "Doesn't Exists",
      });
    }

    const attendanceRecord = report.attendance.find((attend) => {
      // Compare the date strings directly
      return attend.Date === Date;
    });

    if (!attendanceRecord) {
      return res.status(400).json({
        success: false,
        message: "Doesn't Exists",
      });
    }

    return res.status(200).json({
      success: false,
      message: attendanceRecord,
    });
  } catch (e) {
    return res.status(500).json({
      success: false,
      message: e.message,
    });
  }
};

const get_attend_days = async (req, res) => {
  try {
    const { employeeID } = req.user;
    const report = await reportModel.findOne({ employeeID });

    if (!report) {
      return res.status(400).json({
        success: false,
        message: "Doesn't Exists",
      });
    }

    const days = report["daysPresent"];

    return res.status(200).json({
      success: true,
      message: days,
    });
  } catch (e) {
    return res.status(500).json({
      success: false,
      message: e.message,
    });
  }
};

module.exports = { mark, get_attend, get_attend_days };
