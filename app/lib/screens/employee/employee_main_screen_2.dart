import 'package:attend_ease/providers/attendance/employee_attendance_provider.dart';
import 'package:attend_ease/styling/colors.dart';
import 'package:attend_ease/styling/scale.dart';
import 'package:attend_ease/screens/auth/biom_auth.dart';
import 'package:attend_ease/widgets/company/company_setup_screen_widgets.dart';
import 'package:attend_ease/widgets/employee/employee_main_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class EmployeeMainScreen2 extends StatefulWidget {
  double width;
  double height;
  double textScaleFactor;

  EmployeeMainScreen2({
    Key? key,
    required this.width,
    required this.height,
    required this.textScaleFactor,
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
              SizedBox(
                height: responsiveContainerSize(0, widget.width, widget.height),
              ),

              //* To Display Date And Status
              upperBar(
                  widget.width,
                  widget.height,
                  widget.textScaleFactor,
                  context,
                  currentDate,
                  provider.isPresent ? "Present" : "Absent"),

              //* Biometric Authenticate
              cameraAuthenticate(
                () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: BiomAuth(
                            isBiometric: provider.isBiometric,
                          ),
                          type: PageTransitionType.fade));
                },
                widget.width,
                widget.height,
                widget.textScaleFactor,
                context,
                provider.isBiometric,
                Text(
                  provider.isBiometric
                      ? "Your Biometric ID Is Verified"
                      : "Click Here For Biometric Authentication",
                  style: GoogleFonts.notoSansOldHungarian(
                      fontSize: responsiveFontSize(21.5, widget.width,
                          widget.height, widget.textScaleFactor),
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),

              //* Attendance Buttons And Location Verification Widget
              provider.isPresent
                  ? attendCompleteText(
                      widget.width, widget.height, widget.textScaleFactor)
                  : provider.inRadius
                      ? provider.isLoading
                          ? SpinKitCircle(
                              color: Colours.BUTTON_COLOR_2,
                              size: 35,
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                attendButtonIn(() {
                                  provider.submitAttendanceIn(context, currentDate, month, Year);
                                }, widget.width, widget.height,
                                    widget.textScaleFactor),
                                attendButtonOut(() {
                                  provider.submitAttendanceOut(
                                      context, currentDate, month, Year);
                                }, widget.width, widget.height,
                                    widget.textScaleFactor),
                              ],
                            )
                      : LoadingAnimationWidget(
                          widget.width, widget.height, widget.textScaleFactor),
              provider.isPresent
                  ? locationWidget(widget.width, widget.height,
                      widget.textScaleFactor, "See You The Next Day....")
                  : provider.inRadius
                      ? locationWidget(
                          widget.width,
                          widget.height,
                          widget.textScaleFactor,
                          "Your Location is Verified...")
                      : locationWidget(
                          widget.width,
                          widget.height,
                          widget.textScaleFactor,
                          "Verifying Your Location Radius..."),
            ],
          );
        },
      )),
    );
  }
}
