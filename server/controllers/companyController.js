const companyModel = require("../models/company");
const reportModel = require("../models/attendance");
const staffCountModel = require("../models/staffCount");
const staffReportModel = require("../models/staffReport");
const jwt = require("jsonwebtoken");

require("dotenv").config();

const add_company = async (req, res) => {
  try {
    const { companyName, companyHR, companyID, companyCity } = req.body;

    const companyFOund = await companyModel.findOne({ companyName, companyID });

    if (companyFOund) {
      return res.status(401).json({
        success: true,
        message: "Company Already Exists",
      });
    }

    const body = await companyModel.findOneAndUpdate(
      { companyName, companyHR, companyID, companyCity },
      { $push: { companyMembers: `${companyHR}_HR` } },
      { upsert: true, new: true, setDefaultsOnInsert: true }
    );

    //create staffcount model
    let staffCountBody = new staffCountModel({
      companyName,
      In: 0,
      Out: 0,
      Total: 0,
    });

    await staffCountBody.save();

    return res.status(200).json({
      success: true,
      message: "Company Created",
    });
  } catch (e) {
    return res.status(500).json({
      success: false,
      message: e.message,
    });
  }
};

const login_as_hr = async (req, res) => {
  try {
    const { companyName, companyID } = req.body;

    const company = await companyModel.findOne({ companyName, companyID });

    if (!company) {
      return res.status(401).json({
        success: true,
        message: "Company Details Invalid",
      });
    }

    const token = await jwt.sign(
      {
        companyName: companyName,
        companyID,
      },
      process.env.COMPANY_TOKEN,
      { expiresIn: "50m" }
    );

    return res.status(200).json({
      success: true,
      message: token,
    });
  } catch (e) {
    return res.status(500).json({
      success: true,
      message: e.message,
    });
  }
};

const get_report = async (req, res) => {
  try {
    const { companyID } = req.user;

    const body = await reportModel.find({ companyID });

    return res.status(200).json({
      success: true,
      message: body,
    });
  } catch (e) {
    return res.status(500).json({
      success: true,
      message: e.message,
    });
  }
};

const store_history = async (req, res) => {
  try {
    const { companyName } = req.user;
    const { totalCount, currentDate } = req.body;

    let historyBody = await staffReportModel.findOneAndUpdate(
      { companyName },
      {
        $push: {
          list: {
            isSubmit: true,
            totalCount,
            currentDate,
          },
        },
      },
      { new: true, upsert: true }
    );

    const body = await staffReportModel.findOne({ companyName });

    //reset the counts of in and out after submission
    const countBody = await staffCountModel.findOne({ companyName });
    if (countBody) {
      countBody["In"] = 0;
      countBody["Out"] = 0;
      countBody["Total"] = 0;

      await countBody.save(); // Save the changes to the database
    }

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

const get_history = async (req, res) => {
  try {
    const { companyName } = req.user;

    const body = await staffReportModel.findOne({ companyName });
    const countList = body.list;

    return res.status(200).json({
      success: true,
      message: countList,
    });
  } catch (e) {
    return res.status(500).json({
      success: false,
      message: e.message,
    });
  }
};

const history_list = async (req, res) => {
  try {
    const { companyName } = req.user;

    const body = await staffReportModel.findOne({ companyName });
    const countList = await body.list;

    return res.status(200).json({
      success: true,
      message: countList,
    });
  } catch (e) {
    return res.status(500).json({
      success: false,
      message: e.message,
    });
  }
};

const get_ids = async (req, res) => {
  try {
    const { companyName } = req.user;

    const body = await companyModel.findOne({ companyName });

    if (!body) {
      return res.status(401).json({
        success: false,
        message: "No Employees Found",
      });
    }
    const id_list = body.companyMembers;

    return res.status(200).json({
      success: true,
      message: id_list,
    });
  } catch (e) {
    return res.status(500).json({
      success: false,
      message: `Error is : ${e.message}`,
    });
  }
};

module.exports = {
  add_company,
  login_as_hr,
  get_report,
  store_history,
  get_history,
  history_list,
  get_ids,
};
