import 'package:attend_ease/providers/attendance/employee_attendance_provider.dart';
import 'package:attend_ease/screens/leave/leave_req_screen.dart';
import 'package:attend_ease/styling/colors.dart';
import 'package:attend_ease/styling/scale.dart';
import 'package:attend_ease/widgets/employee/employee_main_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class EmployeeMainScreen1 extends StatefulWidget {
  double width;
  double height;
  double textScaleFactor;

  EmployeeMainScreen1({
    Key? key,
    required this.width,
    required this.height,
    required this.textScaleFactor,
  }) : super(key: key);

  @override
  State<EmployeeMainScreen1> createState() => _EmployeeMainScreen1State();
}

class _EmployeeMainScreen1State extends State<EmployeeMainScreen1> {
  late String Date = "";
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<EmployeeAttendanceProvider>();
      Date = DateFormat('dd-MM-yyyy').format(DateTime.now());
      provider.fetchRecord(Date, context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentHeight = MediaQuery.of(context).size.height;
    final currentWidth = MediaQuery.of(context).size.width;
    // ignore: deprecated_member_use
    final textScale = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      body: SingleChildScrollView(child: Consumer<EmployeeAttendanceProvider>(
        builder: (context, provider, _) {
          return Container(
            padding: EdgeInsets.symmetric(
                horizontal: 5 ),
            child: Column(
              children: [
                SizedBox(
                  height:
                      17,
                ),
                provider.isLoading
                    ? SpinKitRotatingCircle(
                        color: Colours.DARK_BLUE,
                        size: 60,
                      )
                    : attendCountWidgetEmployee(
                        currentWidth,
                        currentHeight,
                        textScale,
                        provider.InTime,
                        provider.OutTime,
                        provider.isPresent ? "Present" : "Absent",Date),
                SizedBox(
                  height:
                      responsiveContainerSize(25, currentWidth, currentHeight),
                ),
                Divider(
                  color: Colors.grey.shade300,
                  height: 5,
                  thickness: 2,
                  indent: 10,
                  endIndent: 10,
                ),
                SizedBox(
                  height:
                      responsiveContainerSize(10, currentWidth, currentHeight),
                ),
                listWidgetEMployee(
                    currentWidth, currentHeight, textScale, context),
                SizedBox(height: 38,),
                Center(
                    child: companyButtonEmployee(
                        () {
                          Navigator.push(context, PageTransition(child: LeaveReqScreen(), type: PageTransitionType.fade));
                        }, currentWidth, currentHeight, textScale, context))
              ],
            ),
          );
        },
      )),
    );
  }
}
