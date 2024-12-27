import 'package:attend_ease/providers/attendance/company_attendance_provider.dart';
import 'package:attend_ease/screens/company/staff_list_screen_2.dart';
import 'package:attend_ease/styling/colors.dart';
import 'package:attend_ease/styling/scale.dart';
import 'package:attend_ease/globalobjects/variables.dart';
import 'package:attend_ease/widgets/company/company_hr_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class StaffListScreen extends StatefulWidget {
  const StaffListScreen({super.key});

  @override
  State<StaffListScreen> createState() => _StaffListScreenState();
}

class _StaffListScreenState extends State<StaffListScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<CompanyAttendanceProvider>();
      provider.getIDs(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // ignore: deprecated_member_use
    final textScale = MediaQuery.of(context).textScaleFactor;
    return SingleChildScrollView(child: Consumer<CompanyAttendanceProvider>(
      builder: (context, provider, _) {
        return Container(
          padding: EdgeInsets.symmetric(
              horizontal: 3 * horizontalPaddingFactor(height)),
          child: Column(
            children: [
              SizedBox(
                height: responsiveContainerSize(15, width, height),
              ),
              staffText(width, height, textScale, "Staff Report"),
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
                                      width, height, textScale, "Employee"),
                                )),
                                TableCell(
                                    child: Container(
                                  height: 50,
                                  child: staffTextText(
                                      width, height, textScale, "See Report"),
                                )),
                              ])
                            ],
                          ),
                        ),
                        provider.attendanceIDList.isEmpty
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
                                itemCount: provider.attendanceIDList.length,
                                itemBuilder: (context, index) {
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
                                            child: staffTextText(width, height,
                                                textScale, provider.attendanceIDList[index]),
                                          )),
                                          TableCell(
                                              child: Container(
                                            height: 50,
                                            child: GestureDetector(
                                              onTap: (){
                                                Navigator.push(context, PageTransition(child: StaffListScreen2(employeeID: provider.attendanceIDList[index],), type: PageTransitionType.fade));
                                              },
                                              child: Center(
                                                child: Text(
                                                  "Check Report",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 35,
                                                      fontFamily: "Tansek"),
                                                ),
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
    ));
  }
}
