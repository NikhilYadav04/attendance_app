const { type } = require("express/lib/response");
const { required } = require("joi");
const mongoose = require("mongoose");

const photo_schema = new mongoose.Schema({
  employeeID: {
    type: String,
    required: true,
  },
  imageURL: {
    type: String,
    required: true,
  },
});

const PhotoModel = mongoose.model("Profile_Pic",photo_schema);
module.exports = PhotoModel;
