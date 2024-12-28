import 'package:attend_ease/helper/percentage_formatter.dart';
import 'package:attend_ease/providers/attendance/company_attendance_provider.dart';
import 'package:attend_ease/styling/colors.dart';
import 'package:attend_ease/styling/scale.dart';
import 'package:attend_ease/widgets/company/company_hr_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
        body: SingleChildScrollView(
          child: Consumer<CompanyAttendanceProvider>(
            builder: (context, provider, _) {
              return Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 3 * horizontalPaddingFactor(height)),
                child: Column(
                  children: [
                    SizedBox(
                      height: responsiveContainerSize(15, width, height),
                    ),
                    staffText(width, height, textScale, "Employee Report"),
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
                              Container(
                                color: Colours.BUTTON_COLOR_1,
                                child: Table(
                                  border: TableBorder.all(
                                    color: Colors.black,
                                    style: BorderStyle.solid,
                                    width: 1,
                                  ),
                                  children: [
                                    TableRow(children: [
                                      TableCell(
                                          child: Container(
                                        height: 50,
                                        child: staffTextText(
                                            width, height, textScale, "Month"),
                                      )),
                                      TableCell(
                                          child: Container(
                                        height: 50,
                                        child: staffTextText(
                                            width, height, textScale, "Year"),
                                      )),
                                      TableCell(
                                          child: Container(
                                        height: 50,
                                        child: staffTextText(width, height,
                                            textScale, "Percentage"),
                                      )),
                                    ])
                                  ],
                                ),
                              ),
                              provider.attendanceEmployeeList.isEmpty
                                  ? Center(
                                      child: Text(
                                        "No Record Available",
                                        style: TextStyle(
                                            color: Colours.DARK_BLUE,
                                            fontFamily: "Tansek",
                                            fontSize: 52),
                                      ),
                                    )
                                  : ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: provider
                                          .attendanceEmployeeList.length,
                                      itemBuilder: (context, index) {
                                        var Percentage = PercentageFormatter
                                            .calculateDayPercentage(
                                                provider.attendanceEmployeeList[
                                                    index]["Month"],
                                                provider.attendanceEmployeeList[
                                                    index]["daysPresent"]);
                                        return Container(
                                          child: Table(
                                            border: TableBorder.all(
                                              color: Colors.black,
                                              style: BorderStyle.solid,
                                              width: 1,
                                            ),
                                            children: [
                                              TableRow(children: [
                                                TableCell(
                                                    child: Container(
                                                  height: 50,
                                                  child: staffTextText(
                                                      width,
                                                      height,
                                                      textScale,
                                                      provider.attendanceEmployeeList[
                                                          index]["Month"]),
                                                )),
                                                TableCell(
                                                    child: Container(
                                                  height: 50,
                                                  child: Center(
                                                    child: Text(
                                                      provider.attendanceEmployeeList[
                                                          index]["Year"],
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 35,
                                                          fontFamily: "Tansek"),
                                                    ),
                                                  ),
                                                )),
                                                TableCell(
                                                    child: Container(
                                                  height: 50,
                                                  child: Center(
                                                    child: Text(
                                                      "${Percentage.toStringAsFixed(2)} %",
                                                      style: TextStyle(
                                                          color:
                                                              Percentage >= 75.0
                                                                  ? Colors.green
                                                                  : Colors.red,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 35,
                                                          fontFamily: "Tansek"),
                                                    ),
                                                  ),
                                                )),
                                              ])
                                            ],
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
