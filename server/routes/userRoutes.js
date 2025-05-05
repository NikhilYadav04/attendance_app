require("dotenv").config();
const express = require("express");
const router = express.Router();
const twilio = require('twilio');

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
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_ACCOUNT_TOKEN;
const verifyServiceSid = process.env.TWILIO_VERIFY_SERVICE_SID;
const client = twilio(accountSid, authToken);

router.use(express.json());

//* send otp via Twilio Verify
router.post("/send-otp", phoneValidation, async (req, res) => {
  const { phoneNumber } = req.body;
  try {
    const verification = await client.verify
      .services(verifyServiceSid)
      .verifications.create({
        to: `+91${phoneNumber}`,
        channel: "sms",
      });

    return res.status(200).json({
      success: true,
      sid: verification.sid,
      message: "OTP sent",
    });
  } catch (err) {
    console.error("Twilio Verify Error:", err);
    return res.status(500).json({
      success: false,
      message: err.message,
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

module.exports = { router };
