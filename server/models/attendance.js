const mongoose = require("mongoose");

const attendanceSchema = new mongoose.Schema({
  InTime: {
    required: true,
    type: String,
  },
  OutTime: {
    required: true,
    type: String,
  },
  Date: {
    required: true,
    type: String,
  },
  isPresent: {
    required: true,
    type: Boolean,
  },
});

const daysPresentSchema = new mongoose.Schema({
  Month: {
    required: true,
    type: String,
  },
  daysPresent: {
    required: true,
    type: Number,
  },
});

const reportSchema = new mongoose.Schema({
  employeeID: {
    required: true,
    type: String,
  },
  employeeCompany: {
    required: true,
    type: String,
  },
  daysPresent: [daysPresentSchema],
  attendance: [attendanceSchema],
});

const reportModel = mongoose.model("Report", reportSchema);
module.exports = reportModel;
