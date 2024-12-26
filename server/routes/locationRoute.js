const express = require("express");
const { store_location, get_location } = require("../controllers/locationController.js");
const { authenticateToken, authenticateTokenCompany, authenticateTokenEmployee } = require("../middleware/tokenValidations.js");

const locationRouter = express.Router();

locationRouter.use(express.json());

//* store location
locationRouter.post("/store-location",authenticateTokenCompany, store_location);

//*  get location
locationRouter.get("/get-location",authenticateTokenEmployee, get_location);

module.exports = {locationRouter};
