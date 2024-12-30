import 'package:attend_ease/providers/attendance/company_attendance_provider.dart';
import 'package:attend_ease/screens/company/staff_list_screen_2.dart';
import 'package:attend_ease/styling/colors.dart';
import 'package:attend_ease/styling/scale.dart';
import 'package:attend_ease/widgets/company/company_hr_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
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
    return Scaffold(
      backgroundColor: Colours.BUTTON_COLOR_2,
      body: SingleChildScrollView(child: Consumer<CompanyAttendanceProvider>(
        builder: (context, provider, _) {
          return Container(
            color: Colours.BUTTON_COLOR_2,
            padding: EdgeInsets.symmetric(
                horizontal: 3 * horizontalPaddingFactor(height)),
            child: Column(
              children: [
                SizedBox(
                  height: responsiveContainerSize(15, width, height),
                ),
                staffText(width, height, textScale, "Staff Report"),
                SizedBox(
                  height: responsiveContainerSize(25, width, height),
                ),
                // staffReport(
                //     currentWidth, currentHeight, textScale, context,reportStaff)
                provider.isLoadingID
                    ? SpinKitFadingCircle(
                        color: Colours.DARK_BLUE,
                        size: 85,
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: provider.attendanceIDList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            height: 100,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade700,
                                      spreadRadius: 1.5,
                                      blurRadius: 2)
                                ]),
                            child: Center(
                              child: ListTile(
                                leading: CircleAvatar(
                                    backgroundColor: Colours.BUTTON_COLOR_1,
                                    radius: 30,
                                    child: Icon(
                                      Icons.person,
                                      size: 32,
                                      color: Colors.white,
                                    )),
                                title: Text(
                                  provider.attendanceIDList[index]
                                      ["employeeID"],
                                  style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 23.5,
                                  ),
                                ),
                                subtitle: Text(
                                  provider.attendanceIDList[index]
                                      ["employeePosition"],
                                  style: GoogleFonts.montserrat(
                                    color: Colors.grey.shade700,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 21,
                                  ),
                                ),
                                trailing: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            child: StaffListScreen2(
                                              employeeID: provider
                                                      .attendanceIDList[index]
                                                  ["employeeID"],
                                            ),
                                            type: PageTransitionType.fade));
                                  },
                                  child: Icon(
                                    Icons.login,
                                    size: 42,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          );
                        })
              ],
            ),
          );
        },
      )),
    );
  }
}
