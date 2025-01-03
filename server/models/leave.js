const { type } = require("express/lib/response");
const mongoose = require("mongoose");

const leave_schema = new mongoose.Schema({
  employeeID: {
    type: String,
    required: true,
  },
  Leave_Title: {
    type: String,
    required: true,
  },
  Start_Date: {
    type: String,
    required: true,
  },
  End_Date: {
    type: String,
    required: true,
  },
  Leave_Reason: {
    type: String,
    required: true,
  },
  Leave_Status: {
    type: String,
    required: true,
  },
  Leave_ID: {
    type: String,
    required: true,
  },
  Leave_Count : {
    type:Number,
    required:true
  }
});

const hr_leave_schema = new mongoose.Schema({
  companyName: {
    type: String,
    required: true,
  },
  Pending_Leaves: [leave_schema],
  Approved_Leaves: [leave_schema],
  Rejected_Leaves: [leave_schema],
});

const HR_leave_model = mongoose.model("HR_Leave", hr_leave_schema);
module.exports = { HR_leave_model };
