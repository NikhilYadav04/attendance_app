import 'package:attend_ease/helper/percentage_formatter.dart';
import 'package:attend_ease/providers/attendance/company_attendance_provider.dart';
import 'package:attend_ease/styling/colors.dart';
import 'package:attend_ease/styling/sizeconfig.dart';
import 'package:attend_ease/widgets/company/company_hr_widgets.dart';
import 'package:attend_ease/widgets/employee/employee_main_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class StaffListScreen2 extends StatefulWidget {
  StaffListScreen2({super.key, required this.employeeID});
  String employeeID;

  @override
  State<StaffListScreen2> createState() => _StaffListScreen2State();
}

class _StaffListScreen2State extends State<StaffListScreen2> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<CompanyAttendanceProvider>();
      provider.getIDReport(context, widget.employeeID);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colours.BUTTON_COLOR_2,
        body: SingleChildScrollView(
          child: Consumer<CompanyAttendanceProvider>(
            builder: (context, provider, _) {
              return Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 0.6696 * SizeConfig.widthMultiplier),
                child: Column(
                  children: [
                    SizedBox(
                      height: 2.31742 * SizeConfig.heightMultiplier,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 2.6785 * SizeConfig.widthMultiplier),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          staffText("Employee Report"),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Icon(
                              Icons.logout,
                              size: 3.7921 * SizeConfig.heightMultiplier,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2.317428 * SizeConfig.heightMultiplier,
                    ),
                    // staffReport(
                    //     currentWidth, currentHeight, textScale, context,reportStaff)
                    provider.isLoadingID
                        ? SpinKitFadingCircle(
                            color: Colours.DARK_BLUE,
                            size: 8.9536 * SizeConfig.heightMultiplier,
                          )
                        : Column(
                            children: [
                              ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount:
                                      provider.attendanceEmployeeList.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 2.2321 *
                                              SizeConfig.widthMultiplier,
                                          vertical: 1.26408 *
                                              SizeConfig.heightMultiplier),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 3.3482 *
                                                SizeConfig.widthMultiplier,
                                            vertical: 1.36938 *
                                                SizeConfig.heightMultiplier),
                                        height: 14.7472 *
                                            SizeConfig.heightMultiplier,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                                1.053 *
                                                    SizeConfig
                                                        .heightMultiplier),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey.shade700,
                                                  spreadRadius: 1.5,
                                                  blurRadius: 2)
                                            ]),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              " ${provider.attendanceEmployeeList[index]["Month"]}, ${provider.attendanceEmployeeList[index]["Year"]}",
                                              style: GoogleFonts.montserrat(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 2.5280 *
                                                    SizeConfig.heightMultiplier,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 1.8960 *
                                                  SizeConfig.heightMultiplier,
                                            ),
                                            Row(
                                              children: [
                                                Row(
                                                  children: [
                                                    boxIcon(Icons.percent),
                                                    SizedBox(
                                                      width: 2.2321 *
                                                          SizeConfig
                                                              .widthMultiplier,
                                                    ),
                                                    Text("Percentage : ",
                                                        style: GoogleFonts
                                                            .montserrat(
                                                          color: Colors
                                                              .grey.shade800,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 2.42276 *
                                                              SizeConfig
                                                                  .heightMultiplier,
                                                        )),
                                                    SizedBox(
                                                      width: 2.2321 *
                                                          SizeConfig
                                                              .widthMultiplier,
                                                    ),
                                                    Text(
                                                        "${PercentageFormatter.calculateDayPercentage(provider.attendanceEmployeeList[index]["Month"], provider.attendanceEmployeeList[index]["daysPresent"]).floorToDouble()} %",
                                                        style: GoogleFonts
                                                            .montserrat(
                                                          color: PercentageFormatter.calculateDayPercentage(
                                                                          provider.attendanceEmployeeList[index]
                                                                              [
                                                                              "Month"],
                                                                          provider.attendanceEmployeeList[index]
                                                                              [
                                                                              "daysPresent"])
                                                                      .floorToDouble() >
                                                                  75.0
                                                              ? Colors.green
                                                              : Colors.red,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 2.422768 *
                                                              SizeConfig
                                                                  .heightMultiplier,
                                                        )),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  })
                            ],
                          )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
