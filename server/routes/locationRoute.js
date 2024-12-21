const express = require("express");
const { store_location, get_location } = require("../controllers/locationController.js");
const locationRouter = express.Router();

locationRouter.use(express.json());

//* store location
locationRouter.post("/store-location", store_location);

//*  get location
locationRouter.post("/get-location", get_location);

module.exports = locationRouter;
