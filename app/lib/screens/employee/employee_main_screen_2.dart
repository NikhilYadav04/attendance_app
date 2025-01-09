import 'package:attend_ease/providers/attendance/employee_attendance_provider.dart';
import 'package:attend_ease/styling/colors.dart';
import 'package:attend_ease/screens/auth/biom_auth.dart';
import 'package:attend_ease/styling/sizeconfig.dart';
import 'package:attend_ease/widgets/company/company_setup_screen_widgets.dart';
import 'package:attend_ease/widgets/employee/employee_main_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class EmployeeMainScreen2 extends StatefulWidget {
  EmployeeMainScreen2({
    Key? key,
  }) : super(key: key);

  @override
  State<EmployeeMainScreen2> createState() => _EmployeeMainScreen2State();
}

class _EmployeeMainScreen2State extends State<EmployeeMainScreen2> {
  late String currentDate;
  late String month;
  late String Year;

  @override
  void initState() {
    // TODO: implement initState
    currentDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
    month = DateFormat('MMMM').format(DateTime.now());
    Year = DateFormat('yyyy').format(DateTime.now());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<EmployeeAttendanceProvider>().checkRadius(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colours.BUTTON_COLOR_2,
      child: SingleChildScrollView(child: Consumer<EmployeeAttendanceProvider>(
        builder: (context, provider, _) {
          return Column(
            children: [
              //* To Display Date And Status
              upperBar(context, currentDate,
                  provider.isPresent ? "Present" : "Absent"),

              //* Biometric Authenticate
              cameraAuthenticate(
                () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: BiomAuth(), type: PageTransitionType.fade));
                },
                context,
                provider.isBiometric,
                FittedBox(
                  child: Text(
                    provider.isBiometric
                        ? "Your Biometric ID Is Verified"
                        : "Click Here For Biometric Authentication",
                    style: TextStyle(
                        fontSize: 2.2647 * SizeConfig.heightMultiplier,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Kumbh-Med"),
                  ),
                ),
              ),

              //* Attendance Buttons And Location Verification Widget
              provider.isPresent
                  ? attendCompleteText()
                  : provider.inRadius
                      ? provider.isLoading
                          ? SpinKitCircle(
                              color: Colours.BUTTON_COLOR_2,
                              size: 3.686 * SizeConfig.heightMultiplier,
                            )
                          : Container(
                              color: Colors.black,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: attendButtonIn(
                                      () {
                                        provider.submitAttendanceIn(
                                            context, currentDate, month, Year);
                                      },
                                    ),
                                  ),
                                  Container(
                                    height: 90,
                                    width: 6,
                                    color: Colors.white,
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: attendButtonOut(
                                      () {
                                        provider.submitAttendanceOut(
                                            context, currentDate, month, Year);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            )
                      : LoadingAnimationWidget(),
              provider.isPresent
                  ? locationWidget("See You The Next Day....")
                  : provider.inRadius
                      ? locationWidget("Your Location is Verified...")
                      : locationWidget("Verifying Your Location Radius..."),
            ],
          );
        },
      )),
    );
  }
}
