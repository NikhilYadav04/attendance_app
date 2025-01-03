const Joi = require("joi");
const { Start } = require("twilio/lib/twiml/VoiceResponse");

const companyAddValidation = (req, res, next) => {
  const schema = Joi.object({
    companyName: Joi.string().min(1).max(10).required(),
    companyHR: Joi.string().min(1).max(10).required(),
    companyID: Joi.string().min(1).max(5).required(),
    HRNumber: Joi.string().max(10).required(),
    companyCity: Joi.string().min(1).max(8).required(),
  });

  const { error } = schema.validate(req.body);

  if (error) {
    return res.status(401).json({
      success: false,
      message: `Error Validating : ${error}`,
    });
  }
  next();
};

const staffAddValidation = (req, res, next) => {
  const schema = Joi.object({
    employeeName: Joi.string().min(1).max(10).required(),
    employeeNumber: Joi.string().min(1).max(10).required(),
    employeePosition: Joi.string().min(1).max(10).required(),
  });

  const { error } = schema.validate(req.body);

  if (error) {
    return res.status(401).json({
      success: false,
      message: `Error Validating : ${error}`,
    });
  }
  next();
};

const HRloginValidation = (req, res, next) => {
  const schema = Joi.object({
    companyName: Joi.string().min(1).max(10).required().messages({
      "string.empty": "Company Name cannot be empty.",
    }),
    companyID: Joi.string().min(1).max(10).required().messages({
      "string.empty": "Company ID cannot be empty.",
    }),
  });

  const { error } = schema.validate(req.body);

  if (error) {
    return res.status(401).json({
      success: false,
      message: `Error Validating : ${error}`,
    });
  }
  next();
};

const EmployeeJoinValidation = (req, res, next) => {
  const schema = Joi.object({
    companyName: Joi.string().min(1).max(10).required().messages({
      "string.empty": "Company Name cannot be empty.",
    }),
    employeeName: Joi.string().min(1).max(10).required().messages({
      "string.empty": "Employee Name cannot be empty.",
    }),
    employeeID: Joi.string().min(1).max(20).required().messages({
      "string.empty": "Employee ID cannot be empty.",
    }),
  });

  const { error } = schema.validate(req.body);

  if (error) {
    return res.status(401).json({
      success: false,
      message: `Error Validating : ${error}`,
    });
  }
  next();
};

const phoneValidation = (req, res, next) => {
  const schema = Joi.object({
    phoneNumber: Joi.string()
      .pattern(/^[0-9]{10}$/)
      .required()
      .messages({
        "string.empty": "Phone number cannot be empty.",
        "string.pattern.base": "Phone number must be exactly 10 digits.",
        "any.required": "Phone number is required.",
      }),
  });

  const { error } = schema.validate(req.body);

  if (error) {
    return res.status(401).json({
      success: false,
      message: `${error.details[0].message}`,
    });
  }
  next();
};

const otpValidation = (req, res, next) => {
  const schema = Joi.object({
    otp: Joi.string()
      .pattern(/^[0-9]{6}$/)
      .required()
      .messages({
        "string.empty": "OTP cannot be empty.",
        "string.pattern.base": "OTP must be exactly 6 digits.",
        "any.required": "OTP is required.",
      }),
  });

  const { error } = schema.validate(req.body);

  if (error) {
    return res.status(401).json({
      success: false,
      message: `${error.details[0].message}`,
    });
  }
  next();
};

const leaveValidation = (req, res, next) => {
  const schema = Joi.object({
    Leave_Title : Joi.string().min(1).max(100).required(),
    Start_Date:Joi.string().min(1).max(100).required(),
    End_Date:Joi.string().min(1).max(100).required(),
    Leave_Reason: Joi.string().min(1).max(180).required().messages({
      "string.empty": "Leave Reason cannot be empty.",
      "string.pattern.base": "Leave Reason must be less than 180 characters",
      "any.required": "Leave Reason is required.",
    }),
    Leave_Status : Joi.string().min(1).max(100).required()
  });

  const { error } = schema.validate(req.body);

  if (error) {
    return res.status(401).json({
      success: false,
      message: `${error.details[0].message}`,
    });
  }
  next();
};

module.exports = {
  companyAddValidation,
  staffAddValidation,
  HRloginValidation,
  EmployeeJoinValidation,
  phoneValidation,
  otpValidation,leaveValidation
};
