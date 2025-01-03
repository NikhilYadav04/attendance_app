import 'package:attend_ease/globalobjects/variables.dart';
import 'package:attend_ease/providers/leave/leave_provider.dart';
import 'package:attend_ease/styling/colors.dart';
import 'package:attend_ease/styling/scale.dart';
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
    final currentHeight = MediaQuery.of(context).size.height;
    final currentWidth = MediaQuery.of(context).size.width;
    // ignore: deprecated_member_use
    final textScale = MediaQuery.of(context).textScaleFactor;
    return SafeArea(
        child: Scaffold(
      appBar: appBLeave(currentWidth, currentHeight, textScale, context),
      body: Consumer<LeaveProvider>(
        builder: (context, provider, _) {
          return Container(
            padding: EdgeInsets.symmetric(
                horizontal: 15 * horizontalPaddingFactor(currentWidth)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: responsiveContainerSize(
                        25, currentWidth, currentHeight),
                  ),
                  descWidget(currentWidth, currentHeight, textScale),
                  SizedBox(
                    height: responsiveContainerSize(
                        20, currentWidth, currentHeight),
                  ),
                  textFieldStaff(
                      currentWidth,
                      currentHeight,
                      textScale,
                      "Enter Title In Max. 1 Line",
                      "Leave Title",
                      provider.LeaveTitleController,
                      addEmployeeName),
                  SizedBox(
                    height: responsiveContainerSize(
                        20, currentWidth, currentHeight),
                  ),
                  dateField(
                      currentWidth,
                      currentHeight,
                      textScale,
                      "April 15, 2023",
                      "Start Date",
                      provider.StartDateController,
                      provider.Start_Date,
                      context),
                  SizedBox(
                    height: responsiveContainerSize(
                        20, currentWidth, currentHeight),
                  ),
                  dateField(
                      currentWidth,
                      currentHeight,
                      textScale,
                      "March 23, 2023",
                      "End Date",
                      provider.EndDateController,
                      provider.End_Date,
                      context),
                  SizedBox(
                    height: responsiveContainerSize(
                        20, currentWidth, currentHeight),
                  ),
                  textFieldStaff(
                      currentWidth,
                      currentHeight,
                      textScale,
                      "Enter Reason In 2-3 Lines",
                      "Leave Reason",
                      provider.LeaveReasonController,
                      addEmployeeName),
                  SizedBox(
                    height: responsiveContainerSize(
                        170, currentWidth, currentHeight),
                  ),
                  provider.isLoadingReq
                      ? SpinKitCircle(
                          color: Colours.BUTTON_COLOR_1,
                          size: 30,
                        )
                      : addEmployeeButton(() {
                        provider.reqLeave(context);
                      }, currentWidth, currentHeight,
                          textScale, context, "Request Leave")
                ],
              ),
            ),
          );
        },
      ),
    ));
  }
}

Widget descWidget(double currentWidth, double currentHeight, double textScale) {
  return Container(
    height: responsiveContainerSize(60, currentWidth, currentHeight),
    decoration: BoxDecoration(
        color: Colours.BUTTON_COLOR_2, borderRadius: BorderRadius.circular(6)),
    child: Center(
      child: Text(
        "Fill The Details Below To Request A Leave",
        style: TextStyle(
            color: Colours.BUTTON_COLOR_1,
            fontSize:
                responsiveFontSize(17, currentWidth, currentHeight, textScale),
            fontWeight: FontWeight.bold),
      ),
    ),
  );
}
