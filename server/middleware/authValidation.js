import Joi from "joi";

export const companyAddValidation = (req, res, next) => {
  const schema = Joi.object({
    companyName: Joi.string().min(1).max(10).required(),
    companyHR: Joi.string().min(1).max(10).required(),
    companyID: Joi.string().min(1).max(5).required(),
    companyCity : Joi.string().min(1).max(8).required(),
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

  const { error } = req.body;

  if (error) {
    return res.status(401).json({
      success: false,
      message: `Error Validating : ${error}`,
    });
  }
  next();
};
