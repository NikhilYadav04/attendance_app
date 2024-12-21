const express = require("express");
const { store_location, get_location } = require("../controllers/locationController.js");
const { default: authenticateToken } = require("../middleware/tokenValidations.js");
const locationRouter = express.Router();

locationRouter.use(express.json());

//* store location
locationRouter.post("/store-location",authenticateToken, store_location);

//*  get location
locationRouter.get("/get-location",authenticateToken, get_location);

module.exports = locationRouter;
