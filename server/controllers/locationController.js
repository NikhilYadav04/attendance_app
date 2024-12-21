const locationModel = require("../models/location");

export const store_location = async (req, res) => {
  try {
    const { latitude, longitude, companyName, radius } = req.body;

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

export const get_location = async (req, res) => {
  try {
    const { companyName } = req.body;

    const body = await locationModel.findOne({ companyName });

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
