import 'package:attend_ease/providers/attendance/company_attendance_provider.dart';
import 'package:attend_ease/screens/company/approval_req_screen.dart';
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
                  height: 2.4 * SizeConfig.heightMultiplier,
                ),
                staffText("Staff Report"),
                SizedBox(
                  height: 2.2 * SizeConfig.heightMultiplier,
                ),

                //* Field For Searching Records
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 2 * SizeConfig.widthMultiplier),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FormField(builder: (context) {
                        return Container(
                          color: Colors.white,
                          child: TextField(
                            style: style,
                            onChanged: (value) {
                              provider.searchRecordID(value);
                            },
                            controller: provider.searchController1,
                            decoration: decoration("Search Employee Name"),
                          ),
                        );
                      })
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.2 * SizeConfig.heightMultiplier,
                ),
                provider.isLoadingID
                    ? SpinKitRing(
                        color: Colours.DARK_BLUE,
                        size: 8.9536 * SizeConfig.heightMultiplier,
                      )
                    : list(provider.filteredIDList)
              ],
            ),
          );
        },
      )),
    );
  }
}

Widget list(List<dynamic> list) {
  return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(
              horizontal: 2.5 * SizeConfig.widthMultiplier,
              vertical: 1 * SizeConfig.heightMultiplier),
          height: 10.5337 * SizeConfig.heightMultiplier,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.circular(1.053 * SizeConfig.heightMultiplier),
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
                  radius: 3.16012 * SizeConfig.heightMultiplier,
                  child: Icon(
                    Icons.person,
                    size: 3.3707 * SizeConfig.heightMultiplier,
                    color: Colors.white,
                  )),
              title: Text(
                list[index]["employeeID"],
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 2.47543 * SizeConfig.heightMultiplier,
                ),
              ),
              subtitle: Text(
                list[index]["employeePosition"],
                style: GoogleFonts.montserrat(
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.bold,
                  fontSize: 2.21208 * SizeConfig.heightMultiplier,
                ),
              ),
              trailing: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: StaffListScreen2(
                            employeeID: list[index]["employeeID"],
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
      });
}
