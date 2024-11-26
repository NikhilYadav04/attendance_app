require("dotenv").config();

const twilio = require("twilio");

const accountSid = process.env.TWILIO_ACCOUNT_SID;
const accountToken = process.env.TWILIO_ACCOUNT_TOKEN;

const twilioClient = new twilio(accountSid, accountToken);

module.exports = twilioClient;