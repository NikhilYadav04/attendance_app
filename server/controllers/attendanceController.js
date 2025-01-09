const reportModel = require("../models/attendance");

require("dotenv").config();

const mark_in = async (req, res) => {
  try {
    const { employeeID } = req.user;

    const { InTime, Date, isPresent, Month, Year } = req.body;
    const OutTime = "00:00";

    const report = await reportModel.findOne({
      employeeID: employeeID,
    });

    let attendanceBody = {
      InTime,
      OutTime,
      Date,
      isPresent,
    };

    const index = await report.attendance.findIndex(
      (attendance) => attendance.Date === Date
    );

    if(index>=0){
      return res.status(400).json({
        success: false,
        message: "InTime Marked Already",
      });
    }

    console.log(attendanceBody);

    await report.attendance.push(attendanceBody);

    await report.save();

    return res.status(200).json({
      success: true,
      message: "InTime Marked",
    });
  } catch (e) {
    return res.status(500).json({
      success: false,
      message: e.message,
    });
  }
};

const mark_out = async (req, res) => {
  try {
    const { employeeID } = req.user;
    const { InTime, OutTime, Date, isPresent, Month, Year } = req.body;

    const report = await reportModel.findOne({ employeeID: employeeID });

    if (!report) {
      return res.status(404).json({
        success: false,
        message: "Doesn't Exists",
      });
    }

    const attendanceBody = {
      InTime,
      OutTime,
      Date,
      isPresent,
    };

    //* to calculate between InTime and OutTime
    // const [hours1, minutes1] = InTime.split(":").map(Number);
    // const [hours2, minutes2] = OutTime.split(":").map(Number);

    // const totalMinutes1 = hours1 * 60 + minutes1;
    // const totalMinutes2 = hours2 * 60 + minutes2;

    // const differenceInMinutes = Math.abs(totalMinutes1 - totalMinutes2);

    // if (differenceInMinutes < 480) {
    //   return res.status(400).json({
    //     success: false,
    //     message:
    //       "Time interval between In-Time and Out-Time must be at least 8 hour",
    //   });
    // }

    const attendanceIndex = report.attendance.findIndex(
      (entry) => entry.Date === Date
    );

    if (attendanceIndex >= 0) {
      report.attendance[attendanceIndex] = attendanceBody;
    }

    const monthIndex = report.daysPresent.findIndex(
      (entry) => entry.Month === Month && entry.Year === Year
    );

    if (monthIndex >= 0) {
      if (isPresent) {
        report.daysPresent[monthIndex].daysPresent += 1;
      }
    } else if (isPresent) {
      report.daysPresent.push({
        Month,
        Year,
        daysPresent: 1,
      });
    }

    await report.save();

    return res.status(200).json({
      success: true,
      message: 2,
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
    const { employeeID, employeeName } = req.user;
    const { Date } = req.body;

    console.log(employeeID, employeeName);
    console.log(`Date is ${Date}`);

    const report = await reportModel.findOne({ employeeID });

    if (!report) {
      return res.status(404).json({
        success: false,
        message: "Doesn't Exists",
      });
    }

    const attendanceRecord = report.attendance.find((attend) => {
      // Compare the date strings directly
      return attend.Date === Date;
    });

    if (!attendanceRecord) {
      return res.status(404).json({
        success: false,
        message: "Doesn't Exists",
      });
    }

    console.log(attendanceRecord);

    return res.status(200).json({
      success: false,
      message: attendanceRecord,
      name: employeeName,
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
      return res.status(404).json({
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

module.exports = { mark_in, mark_out, get_attend, get_attend_days };
