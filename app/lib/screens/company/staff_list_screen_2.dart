import 'package:attend_ease/helper/percentage_formatter.dart';
import 'package:attend_ease/providers/attendance/company_attendance_provider.dart';
import 'package:attend_ease/styling/colors.dart';
import 'package:attend_ease/styling/scale.dart';
import 'package:attend_ease/widgets/company/company_hr_widgets.dart';
import 'package:attend_ease/widgets/employee/employee_main_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // ignore: deprecated_member_use
    final textScale = MediaQuery.of(context).textScaleFactor;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colours.BUTTON_COLOR_2,
        body: SingleChildScrollView(
          child: Consumer<CompanyAttendanceProvider>(
            builder: (context, provider, _) {
              return Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 3 * horizontalPaddingFactor(height)),
                child: Column(
                  children: [
                    SizedBox(
                      height: responsiveContainerSize(20, width, height),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          staffText(width, height, textScale, "Employee Report"),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Icon(
                              Icons.logout,
                              size: 36,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: responsiveContainerSize(20, width, height),
                    ),
                    // staffReport(
                    //     currentWidth, currentHeight, textScale, context,reportStaff)
                    provider.isLoadingID
                        ? SpinKitFadingCircle(
                            color: Colours.DARK_BLUE,
                            size: 85,
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
                                          horizontal: 10, vertical: 12),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 13),
                                        height: 140,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
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
                                                fontSize: 24,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 18,
                                            ),
                                            Row(
                                              children: [
                                                Row(
                                                  children: [
                                                    boxIcon(Icons.percent),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text("Percentage : ",
                                                        style: GoogleFonts
                                                            .montserrat(
                                                          color: Colors
                                                              .grey.shade800,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 23,
                                                        )),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                        "${PercentageFormatter.calculateDayPercentage(provider.attendanceEmployeeList[index]["Month"], provider.attendanceEmployeeList[index]["daysPresent"]).floorToDouble()} %",
                                                        style: GoogleFonts
                                                            .montserrat(
                                                          color: Colors
                                                              .grey.shade800,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 23,
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
