import 'package:attend_ease/providers/attendance/company_attendance_provider.dart';
import 'package:attend_ease/screens/company/staff_list_screen_2.dart';
import 'package:attend_ease/styling/colors.dart';
import 'package:attend_ease/styling/sizeconfig.dart';
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
    ;
    return Scaffold(
      backgroundColor: Colours.BUTTON_COLOR_2,
      body: SingleChildScrollView(child: Consumer<CompanyAttendanceProvider>(
        builder: (context, provider, _) {
          return Container(
            color: Colours.BUTTON_COLOR_2,
            padding: EdgeInsets.symmetric(
                horizontal: 0.6696 * SizeConfig.widthMultiplier),
            child: Column(
              children: [
                SizedBox(
                  height: 1.7907 * SizeConfig.heightMultiplier,
                ),
                staffText("Staff Report"),
                SizedBox(
                  height: 2.8441 * SizeConfig.heightMultiplier,
                ),
                // staffReport(
                //     currentWidth, currentHeight, textScale, context,reportStaff)
                provider.isLoadingID
                    ? SpinKitFadingCircle(
                        color: Colours.DARK_BLUE,
                        size: 8.9536 * SizeConfig.heightMultiplier,
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: provider.attendanceIDList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(
                                horizontal:
                                    0.8928 * SizeConfig.widthMultiplier),
                            height: 10.5337 * SizeConfig.heightMultiplier,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                    1.053 * SizeConfig.heightMultiplier),
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
                                    radius:
                                        3.16012 * SizeConfig.heightMultiplier,
                                    child: Icon(
                                      Icons.person,
                                      size:
                                          3.3707 * SizeConfig.heightMultiplier,
                                      color: Colors.white,
                                    )),
                                title: Text(
                                  provider.attendanceIDList[index]
                                      ["employeeID"],
                                  style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        2.47543 * SizeConfig.heightMultiplier,
                                  ),
                                ),
                                subtitle: Text(
                                  provider.attendanceIDList[index]
                                      ["employeePosition"],
                                  style: GoogleFonts.montserrat(
                                    color: Colors.grey.shade700,
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        2.21208 * SizeConfig.heightMultiplier,
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
                                    size: 4.42417 * SizeConfig.heightMultiplier,
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
