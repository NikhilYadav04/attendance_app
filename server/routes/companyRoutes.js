require("dotenv").config();

const express = require("express");
const employeeModel = require("../models/employee");
const twilioClient = require("../services/twilio.js");
const {
  add_company,
  login_as_hr,
  get_report,
  store_history,
  get_history,
  history_list,
} = require("../controllers/companyController.js");
const { companyAddValidation } = require("../middleware/authValidation.js");
const {
  default: authenticateToken,
} = require("../middleware/tokenValidations.js");

const twilioNumber = process.env.TWILIO_PHONE_NUMBER;

const companyRouter = express.Router();

companyRouter.use(express.json());

//*  add company
companyRouter.post("/add-company", companyAddValidation, add_company);

//*  login as HR
companyRouter.post("/login-company", login_as_hr);

//* get staff report
companyRouter.get("/get-report", authenticateToken, get_report);

//*  store staff count history
companyRouter.post("/store-history", authenticateToken, store_history);

//*  get staff count history
companyRouter.get("/get-history", authenticateToken, get_history);

//* get staff count history in form of list
companyRouter.get("/history-list", authenticateToken, history_list);

//* get all the employee id's
companyRouter.get("/get/-ids",authenticateToken,get_ids)

//* send whatsapp notification
companyRouter.post("/send-notifications", async (req, res) => {
  try {
    const { employeeName } = req.body;

    const body = await employeeModel.findOne({ employeeName });
    const number = body["employeeNumber"];
    console.log(number);

    // await twilioClient.messages.create({
    //   body: "Your attendance is very less,meet HR tomorrow in the office",
    //   from: "whatsapp:+14155238886",
    //   to: `whatsapp:+91${number}`,
    // });

    return res.status(200).json({
      success: true,
      message: number,
    });
  } catch (e) {
    return res.status(500).json({
      success: false,
      message: e.message,
    });
  }
});

module.exports = companyRouter;
