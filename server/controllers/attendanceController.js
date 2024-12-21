require("dotenv").config();
const reportModel = require("../models/attendance");

export const mark = async (req, res) => {
  try {
    const {employeeID} = req.user;
    const { InTime, OutTime, Date, isPresent, Month } = req.body;

    const report = await reportModel.findOneAndUpdate(
      { employeeID },
      { new: true }
    );

    let attendanceBody = {
      InTime,
      OutTime,
      Date,
      isPresent,
    };

    let daysPresentBody = {
      Month,
      $inc: { daysPresent: 1 },
    };

    await report.attendance.push(attendanceBody);
    await report.daysPresent.push(daysPresentBody);

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

export const get_attend = async (req, res) => {
  try {
    const {employeeID} = req.user;
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

export const get_attend_days = async (req, res) => {
  try {
    const {employeeID} = req.user;
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
