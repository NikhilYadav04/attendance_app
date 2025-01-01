const { HR_leave_model, employee_leave_model } = require("../models/leave");
const crypto = require("crypto");

const request_leave = async (req, res) => {
  try {
    const { companyName, employeeID } = req.user;

    const { Leave_Title, Start_Date, End_Date, Leave_Reason, Leave_Status } =
      req.body;

    const Leave_ID = crypto.randomBytes(3).toString("hex");

    const leave_body = {
      employeeID,
      Leave_Title,
      Start_Date,
      End_Date,
      Leave_Reason,
      Leave_Status,
      Leave_ID,
    };

    //* check if employee had already requested a leave
    const body = await HR_leave_model.findOne({
      companyName,
    });

    const check = body.Pending_Leaves.filter(
      (leave) => leave.employeeID === employeeID
    );

    if (check > 0) {
      return res.status(400).json({
        success: false,
        message: "You have already requested a leave",
      });
    }

    //* Promise to run two await which are independent
    await Promise.all([
      HR_leave_model.findOneAndUpdate(
        { companyName },
        { $push: { Pending_Leaves: leave_body } }
      ),
    ]);

    return res.status(200).json({
      success: true,
      message: "Leave Requested Successfully",
    });
  } catch (e) {
    return res.status(500).json({
      success: false,
      message: e.message,
    });
  }
};

const ar_leave = async (req, res) => {
  try {
    const { companyName } = req.user;
    const { Leave_Status, Leave_ID } = req.body;

    const body = await HR_leave_model.findOne({
      companyName,
    });

    const leave_index = await body.Pending_Leaves.findIndex(
      (leave) => leave.Leave_ID === Leave_ID
    );

    if (leave_index < 0) {
      return res.status(404).json({
        success: false,
        message: "No Leave Found",
      });
    }

    body.Pending_Leaves[leave_index].Leave_Status = Leave_Status;
    await body.save();

    const leave_body = body.Pending_Leaves[leave_index];
    console.log(leave_body);

    if (Leave_Status == "Approved") {
      await HR_leave_model.findOneAndUpdate(
        { companyName },
        {
          $pull: { Pending_Leaves: leave_body },
          $push: { Approved_Leaves: leave_body },
        }
      );

      return res.status(200).json({
        success: true,
        message: `Leave ${Leave_Status}`,
      });
    } else if (Leave_Status == "Rejected") {
      await HR_leave_model.findOneAndUpdate(
        { companyName },
        {
          $pull: { Pending_Leaves: leave_body },
          $push: { Rejected_Leaves: leave_body },
        }
      );

      return res.status(200).json({
        success: true,
        message: `Leave ${Leave_Status}`,
      });
    }
    return res.status(404).json({
      success: true,
      message: `Error`,
    });
  } catch (e) {
    return res.status(500).json({
      success: false,
      message: e.message,
    });
  }
};

const fetch_leaves_HR = async (req, res) => {
  try {
    const { companyName } = req.user;

    const body = await HR_leave_model.findOne({ companyName });
    const leave_list_pending = body.Pending_Leaves;
    const leave_list_approved = body.Approved_Leaves;
    const leave_list_rejected = body.Rejected_Leaves;

    return res.status(200).json({
      success: true,
      pending: leave_list_pending,
      approved: leave_list_approved,
      rejected: leave_list_rejected,
    });
  } catch (e) {
    return res.status(500).json({
      success: false,
      message: e.message,
    });
  }
};

const fetch_leaves_employee = async (req, res) => {
  try {
    const { companyName, employeeID } = req.user;

    let leave_list = [];

    body = await HR_leave_model.findOne({ companyName });

    for (const schema of body.Pending_Leaves) {
      if (schema.employeeID === employeeID) {
        leave_list.push(schema);
      }
    }

    for (const schema of body.Approved_Leaves) {
      if (schema.employeeID === employeeID) {
        leave_list.push(schema);
      }
    }

    for (const schema of body.Rejected_Leaves) {
      if (schema.employeeID === employeeID) {
        leave_list.push(schema);
      }
    }

    return res.status(200).json({
      success: true,
      message: leave_list,
    });
  } catch (e) {
    return res.status(500).json({
      success: false,
      message: e.message,
    });
  }
};

module.exports = {
  request_leave,
  ar_leave,
  fetch_leaves_HR,
  fetch_leaves_employee,
};
