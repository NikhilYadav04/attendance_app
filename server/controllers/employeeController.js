require("dotenv").config();

const employeeModel = require("../models/employee");
const companyModel = require("../models/company");
const reportModel = require("../models/attendance");
const staffCountModel = require("../models/staffCount");
const jwt = require("jsonwebtoken");

const add_staff = async (req, res) => {
  try {
    const {
      employeeName,
      employeeNumber,
      employeePosition,
      employeeCompany,
      companyID,
    } = req.body;

    // we take details of employee and his company name and update employee list
    const body = await employeeModel.findOneAndUpdate(
      { employeeName, employeeNumber, employeePosition, employeeCompany },
      { employeeID: `${employeeName}_${employeeNumber.slice(1, 4)}` },
      { upsert: true, new: true, setDefaultsOnInsert: true }
    );

    // then we update members list of specific company
    const updateMember = await companyModel.updateOne(
      { companyID },
      {
        $push: {
          companyMembers: `${employeeName}_${employeeNumber.slice(1, 4)}`,
        },
      }
    );

    employeeID = `${employeeName}_${employeeNumber.slice(1, 4)}`;

    if (!updateMember) {
      return res.status(400).json({
        success: false,
        message: "Failed TO Join",
      });
    }

    // then we make attendance field of that employee
    let attendanceBody = new reportModel({
      employeeID,
      employeeCompany,
      daysPresent: [
        {
          Month: "April",
          daysPresent: 25,
        },
      ],
      attendance: [
        {
          InTime: "16:00",
          OutTime: "17:00",
          Date: "12/04/2024",
          isPresent: true,
        },
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
    const { companyName, companyID, employeeName, employeeID } = req.body;

    const company = await companyModel.findOne({ companyName, companyID });
    const employee = await employeeModel.findOne({ employeeName, employeeID });

    // check if company with id and name exists
    if (!company) {
      return res.status(401).json({
        success: false,
        message: "Invalid Details Found",
      });
    }

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
        companyID,
        employeeID
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

    const updatedEmployee = await staffCountModel.findOneAndUpdate(
      { companyName: companyName },
      {
        $inc: {
          In: inCount,
          Out: outCount,
          Total: TotalCount,
        },
      },
      { new: true }
    );

    return res.status(200).json({
      success: true,
      message: updatedEmployee,
    });
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
    // console.log(body)

    return res.status(200).json({
      success: true,
      message: body,
    });
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
