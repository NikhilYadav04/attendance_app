import 'package:attend_ease/globalobjects/variables.dart';
import 'package:attend_ease/providers/leave/leave_provider.dart';
import 'package:attend_ease/styling/colors.dart';
import 'package:attend_ease/styling/sizeconfig.dart';
import 'package:attend_ease/widgets/company/add_staff_widgets.dart';
import 'package:attend_ease/widgets/leave/leave_widgets.dart';
import 'package:attend_ease/widgets/leave/leave_widgets_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class LeaveReqScreen extends StatefulWidget {
  const LeaveReqScreen({super.key});

  @override
  State<LeaveReqScreen> createState() => _LeaveReqScreenState();
}

class _LeaveReqScreenState extends State<LeaveReqScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: appBLeave(context),
      body: Consumer<LeaveProvider>(
        builder: (context, provider, _) {
          return Container(
            padding: EdgeInsets.symmetric(
                horizontal: 3.5714 * SizeConfig.widthMultiplier),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 2.8441 * SizeConfig.heightMultiplier,
                  ),
                  descWidget(),
                  SizedBox(
                    height: 2.3174 * SizeConfig.heightMultiplier,
                  ),
                  textFieldStaff("Enter Title In Max. 1 Line", "Leave Title",
                      provider.LeaveTitleController, addEmployeeName),
                  SizedBox(
                    height: 2.3174 * SizeConfig.heightMultiplier,
                  ),
                  dateField(
                      "April 15, 2023",
                      "Start Date",
                      provider.StartDateController,
                      provider.Start_Date,
                      context),
                  SizedBox(
                    height: 2.3174 * SizeConfig.heightMultiplier,
                  ),
                  dateField("March 23, 2023", "End Date",
                      provider.EndDateController, provider.End_Date, context),
                  SizedBox(
                    height: 2.3174 * SizeConfig.heightMultiplier,
                  ),
                  textFieldStaff("Enter Reason In 2-3 Lines", "Leave Reason",
                      provider.LeaveReasonController, addEmployeeName),
                  SizedBox(
                    height: 188,
                  ),
                  provider.isLoadingReq
                      ? SpinKitCircle(
                          color: Colours.BUTTON_COLOR_1,
                          size: 3.1601 * SizeConfig.heightMultiplier,
                        )
                      : addEmployeeButton(() {
                          provider.reqLeave(context);
                        }, context, "Request Leave")
                ],
              ),
            ),
          );
        },
      ),
    ));
  }
}

Widget descWidget() {
  return Container(
    height: 6.846 * SizeConfig.heightMultiplier,
    decoration: BoxDecoration(
        color: Colours.BUTTON_COLOR_2,
        borderRadius:
            BorderRadius.circular(0.6320 * SizeConfig.heightMultiplier)),
    child: Center(
      child: Text(
        "Fill The Details Below To Request A Leave",
        style: TextStyle(
            color: Colours.BUTTON_COLOR_1,
            fontSize: 2.0014 * SizeConfig.heightMultiplier,
            fontWeight: FontWeight.bold),
      ),
    ),
  );
}
