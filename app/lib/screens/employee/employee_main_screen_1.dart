import 'package:attend_ease/providers/attendance/employee_attendance_provider.dart';
import 'package:attend_ease/screens/leave/leave_req_screen.dart';
import 'package:attend_ease/styling/sizeconfig.dart';
import 'package:attend_ease/widgets/employee/employee_main_widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

// ignore: must_be_immutable
class EmployeeMainScreen1 extends StatefulWidget {
  EmployeeMainScreen1({
    Key? key,
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
    return Scaffold(
      body: SingleChildScrollView(child: Consumer<EmployeeAttendanceProvider>(
        builder: (context, provider, _) {
          return Container(
            padding: EdgeInsets.symmetric(
                horizontal: 1.11607 * SizeConfig.widthMultiplier),
            child: Column(
              children: [
                SizedBox(
                  height: 1.79073 * SizeConfig.heightMultiplier,
                ),
                // provider.isLoading
                //     ? SpinKitRotatingCircle(
                //         color: Colours.DARK_BLUE,
                //         size: 6.3202 * SizeConfig.heightMultiplier,
                //       )
                Skeletonizer(
                  enabled: provider.isLoading,
                  child: attendCountWidgetEmployee(
                      provider.InTime,
                      provider.OutTime,
                      provider.isPresent ? "Present" : "Absent",
                      Date),
                ),
                SizedBox(
                  height: 2.844 * SizeConfig.heightMultiplier,
                ),
                Divider(
                  color: Colors.grey.shade300,
                  height: 5,
                  thickness: 2,
                  indent: 10,
                  endIndent: 10,
                ),
                SizedBox(
                  height: 1.2640 * SizeConfig.heightMultiplier,
                ),
                listWidgetEMployee(context),
                SizedBox(
                  height: 4.00282 * SizeConfig.heightMultiplier,
                ),
                Center(
                    child: companyButtonEmployee(() {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: LeaveReqScreen(),
                          type: PageTransitionType.fade));
                }, context))
              ],
            ),
          );
        },
      )),
    );
  }
}
