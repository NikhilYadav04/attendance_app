const locationModel = require("../models/location");

const store_location = async (req, res) => {
  try {
    const {companyName} = req.user;
    const { latitude, longitude, radius } = req.body;

    const body = await locationModel.findOneAndUpdate(
      {
        latitude,
        longitude,
        companyName,
      },
      { radius },
      { upsert: true, new: true, setDefaultsOnInsert: true }
    );
    console.log(body);
    return res.status(200).json({
      success: true,
      message: body,
    });
  } catch (e) {
    return res.status(500).json({
      success: false,
      message: e.message,
    });
  }
};

const get_location = async (req, res) => {
  try {
    const {companyName} = req.user;
    console.log(companyName);

    const body = await locationModel.findOne({ companyName });

    console.log(body)

    return res.status(200).json({
      success: true,
      message: body,
    });
  } catch (e) {
    return res.status(500).json({
      success: false,
      message: e.message,
    });
  }
};

module.exports = {store_location,get_location}
