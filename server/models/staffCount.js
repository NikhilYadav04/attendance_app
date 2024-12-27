const mongoose = require("mongoose");

const countSchema = new mongoose.Schema({
  Date: {
    required: true,
    type: String,
  },
  In: {
    required: true,
    type: Number,
  },
  Out: {
    required: true,
    type: Number,
  },
  Total: {
    required: true,
    type: Number,
  },
  submit: {
    required: true,
    type: Boolean,
  },
});

const staffSchema = new mongoose.Schema({
  companyName: {
    required: true,
    type: String,
  },
  counts: [countSchema],
});

const staffCountModel = mongoose.model("staffCount", staffSchema);
module.exports = staffCountModel;
