const { required } = require("joi");
const mongoose = require("mongoose");

const employeeSchema = new mongoose.Schema({
  employeeName: {
    required: true,
    type: String,
  },
  employeeNumber: {
    required: true,
    type: String,
  },
  employeePosition: {
    required: true,
    type: String,
  },
  employeeID: {
    required: true,
    type: String,
  },
  companyName: {
    required: true,
    type: String,
  },
  leaveCount: {
    required: true,
    type: Number,
  },
});

const employeeModel = mongoose.model("employees", employeeSchema);
module.exports = employeeModel;
