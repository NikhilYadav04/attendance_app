import Joi from "joi";

export const signupValidation = (req, res, next) => {
  const schema = Joi.object({
    name: Joi.string().min(1).max(10).required(),
    phone: Joi.string().max(10).required(),
    email: Joi.string().email().required(),
    password: Joi.string().min(3).max(6).required(),
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

export const signinvalidation = (req, res, next) => {
  const schema = Joi.object({
    email: Joi.string().email().required(),
    password: Joi.string().min(3).max(6).required(),
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
