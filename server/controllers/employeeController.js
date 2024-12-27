require("dotenv").config();

const employeeModel = require("../models/employee");
const companyModel = require("../models/company");
const reportModel = require("../models/attendance");
const staffCountModel = require("../models/staffCount");
const jwt = require("jsonwebtoken");

const add_staff = async (req, res) => {
  try {
    const { companyName, companyID } = req.user;
    const { employeeName, employeeNumber, employeePosition } = req.body;

    const employeeID = `${employeeName}_${Math.floor(
      1000 + Math.random() * 9000
    )}`;

    // we take details of employee and his company name and update employee list
    const body = await employeeModel.findOneAndUpdate(
      { employeeName, employeeNumber, employeePosition, companyName },
      {
        employeeID: employeeID,
      },
      { upsert: true, new: true, setDefaultsOnInsert: true }
    );

    // then we update members list of specific company
    const updateMember = await companyModel.updateOne(
      { companyID },
      {
        $push: {
          companyMembers: employeeID,
        },
      }
    );

    if (!updateMember) {
      return res.status(400).json({
        success: false,
        message: "Failed TO Join",
      });
    }

    // then we make attendance field of that employee
    let attendanceBody = new reportModel({
      employeeID,
      companyName,
      daysPresent: [
        // {
        //   Month: "April",
        //   Year: "2024",
        //   daysPresent: 25,
        // },
      ],
      attendance: [
        // {
        //   InTime: "16:00",
        //   OutTime: "17:00",
        //   Date: "12/04/2024",
        //   isPresent: true,
        // },
      ],
    });

    await attendanceBody.save();

    //then we create employees

    return res.status(200).json({
      success: true,
      message: attendanceBody,
    });
  } catch (e) {
    return res.status(500).json({
      success: false,
      message: e.message,
    });
  }
};

const join_employee = async (req, res) => {
  try {
    const { companyName, employeeName, employeeID } = req.body;

    const employee = await employeeModel.findOne({
      companyName,
      employeeName,
      employeeID,
    });

    if (!employee) {
      return res.status(401).json({
        success: false,
        message: "Invalid Details Found",
      });
    }

    const token = await jwt.sign(
      {
        companyName,
        employeeName,
        employeeID,
      },
      process.env.EMPLOYEE_TOKEN,
      { expiresIn: "50m" }
    );

    return res.status(200).json({
      success: true,
      message: token,
    });
  } catch (e) {
    return res.status(500).json({
      success: false,
      message: e.message,
    });
  }
};

const get_history = async (req, res) => {
  try {
    const { employeeID } = req.user;

    const body = await reportModel.findOne({ employeeID });

    const list = body.attendance;

    if (!list) {
      return res.status(401).json({
        success: false,
        message: "Doesn't Exists",
      });
    }

    return res.status(200).json({
      success: true,
      message: list,
    });
  } catch (e) {
    return res.status(500).json({
      success: false,
      message: e.message,
    });
  }
};

const change_count = async (req, res) => {
  try {
    const { companyName } = req.user;
    const { inCount, outCount, TotalCount } = req.body;

    //* Fetch The Current Date
    let currentDate = new Date();
    let formattedDate = `${currentDate
      .getDate()
      .toString()
      .padStart(2, "0")}-${(currentDate.getMonth() + 1)
      .toString()
      .padStart(2, "0")}-${currentDate.getFullYear()}`;

    const updatedEmployee = await staffCountModel.findOneAndUpdate(
      { companyName: companyName },
      { new: true }
    );

    const CountIndex = await updatedEmployee.counts.findIndex(
      (count) => count.Date === formattedDate
    );

    if (CountIndex >= 0) {
      if (updatedEmployee.counts[CountIndex].submit) {
        return res.status(400).json({
          success: false,
          message: "Submitted",
        });
      } else {
        updatedEmployee.counts[CountIndex].In += inCount;
        updatedEmployee.counts[CountIndex].Out += outCount;
        updatedEmployee.counts[CountIndex].Total += TotalCount;

        return res.status(200).json({
          success: true,
          message: "Updated",
        });
      }
    } else {
      updatedEmployee.counts.push({
        Date: formattedDate,
        In: inCount,
        Out: outCount,
        Total: TotalCount,
        submit: false,
      });

      return res.status(200).json({
        success: true,
        message: "Updated",
      });
    }
  } catch (e) {
    return res.status(500).json({
      success: false,
      message: e.message,
    });
  }
};

const get_count = async (req, res) => {
  try {
    const { companyName } = req.user;

    const body = await staffCountModel.findOne({ companyName });

    let currentDate = new Date();
    let Date1 = `${currentDate.getDate().toString().padStart(2, "0")}-${(
      currentDate.getMonth() + 1
    )
      .toString()
      .padStart(2, "0")}-${currentDate.getFullYear()}`;

    const countIndex = await body.counts.findIndex(
      (count) => count.Date === Date1
    );

    if (countIndex >= 0) {
      const countBody = body.counts[countIndex];
      return res.status(200).json({
        success: true,
        message: countBody,
      });
    } else {
      return res.status(404).json({
        success: true,
        message: "No Records",
      });
    }
  } catch (e) {
    return res.status(500).json({
      success: false,
      message: e.message,
    });
  }
};

module.exports = {
  add_staff,
  join_employee,
  get_history,
  change_count,
  get_count,
};
