require("dotenv").config();

const express = require("express");
const router = express.Router();

const otpGenerator = require("otp-generator");
const OtpModel = require("../models/otp");
const twilioClient = require("../services/twilio.js");
const {
  phoneValidation,
  otpValidation,
} = require("../middleware/authValidation.js");

const twilioNumber = process.env.TWILIO_PHONE_NUMBER;

router.use(express.json());

//* send otp
router.post("/send-otp", phoneValidation, async (req, res) => {
  try {
    const { phoneNumber } = req.body;

    const otp = otpGenerator.generate(6, {
      upperCaseAlphabets: false,
      lowerCaseAlphabets: false,
      specialChars: false,
    });

    await OtpModel.findOneAndUpdate(
      { phoneNumber },
      { otp },
      { upsert: true, new: true, setDefaultsOnInsert: true }
    );

    await twilioClient.messages.create({
      body: `Your Otp is : ${otp}`,
      to: phoneNumber,
      from: twilioNumber,
    });

    return res.status(200).json({
      success: true,
      message: otp,
    });
  } catch (e) {
    return res.status(500).json({
      success: false,
      message: e.message,
    });
  }
});

//* verify otp
router.post("/verify-otp", otpValidation, async (req, res) => {
  try {
    const { otp } = req.body;
    console.log(otp);
    const otpFOund = await OtpModel.findOne({ otp });

    if (!otpFOund) {
      return res.status(400).json({
        success: false,
        message: "OTP Not Verified",
      });
    }

    return res.status(200).json({
      success: true,
      message: "OTP Verified Successfully",
    });
  } catch (e) {
    return res.status(500).json({
      success: false,
      message: e.message,
    });
  }
});

module.exports = {router};
