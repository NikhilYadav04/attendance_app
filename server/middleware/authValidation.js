import Joi from "joi";

export const companyAddValidation = (req, res, next) => {
  const schema = Joi.object({
    companyName: Joi.string().min(1).max(10).required(),
    companyHR: Joi.string().min(1).max(10).required(),
    companyID: Joi.string().min(1).max(5).required(),
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

export const staffAddValidation = (req, res, next) => {
  const schema = Joi.object({
    employeeName: Joi.string().min(1).max(10).required(),
    employeeNumber: Joi.string().min(1).max(10).required(),
    employeePosition: Joi.string().min(1).max(10).required(),
    employeeCompany: Joi.string().min(1).max(10).required(),
    companyID: Joi.string().min(1).max(5).required(),
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

export const phoneValidation = (req, res, next) => {
  const schema = Joi.object({
    phoneNumber : Joi.string()
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

export const otpValidation = (req, res, next) => {
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
