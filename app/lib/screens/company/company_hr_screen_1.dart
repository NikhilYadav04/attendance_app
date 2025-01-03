import 'dart:async';

import 'package:attend_ease/providers/attendance/company_attendance_provider.dart';
import 'package:attend_ease/screens/company/add_staff_screen.dart';
import 'package:attend_ease/screens/company/remove_staff_screen.dart';
import 'package:attend_ease/styling/colors.dart';
import 'package:attend_ease/styling/scale.dart';
import 'package:attend_ease/services/companyService.dart';
import 'package:attend_ease/widgets/company/company_hr_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class CompanyHrScreen1 extends StatefulWidget {
  const CompanyHrScreen1({super.key});

  @override
  State<CompanyHrScreen1> createState() => _CompanyHrScreen1State();
}

class _CompanyHrScreen1State extends State<CompanyHrScreen1> {
  final companyService CompanyService = companyService();
  DateTime now = DateTime.now();
  Timer? _timer;
  bool await = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<CompanyAttendanceProvider>();
      provider.fetchRecords(context);

      String Date = DateFormat('dd-MM-yyyy').format(DateTime.now());
      setState(() {
        provider.Date = Date;
      });

      //* For periodic fetching of data
      // _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      //   provider.fetchRecords(context);
      //   String date = DateFormat('dd-MM-yyyy').format(DateTime.now());
      //   setState(() {
      //     provider.Date = date;
      //   });
      // });
    });
  }

  int index = 0;
  @override
  Widget build(BuildContext context) {
    final currentHeight = MediaQuery.of(context).size.height;
    final currentWidth = MediaQuery.of(context).size.width;
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(child: Consumer<CompanyAttendanceProvider>(
        builder: (context, provider, _) {
          return Container(
            padding: EdgeInsets.symmetric(
                horizontal: 5 * horizontalPaddingFactor(currentWidth)),
            child: Column(
              children: [
                SizedBox(
                  height:
                      responsiveContainerSize(15, currentWidth, currentHeight),
                ),
                provider.isLoading
                    ? SpinKitFadingCircle(
                        color: Colours.DARK_BLUE,
                        size: 75,
                      )
                    : attendCountWidget(currentWidth, currentHeight, textScale,
                        () {
                        provider.submit(context);
                      }, provider.In, provider.Out, provider.Total,
                        provider.Date, provider.isSubmit),
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
                listWidget(currentWidth, currentHeight, textScale, context)
              ],
            ),
          );
        },
      )),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Tooltip(
              margin: EdgeInsets.only(bottom: 5),
              textStyle: TextStyle(
                  color: Colors.black, fontSize: 32, fontFamily: "Tansek"),
              decoration: BoxDecoration(color: Colors.transparent),
              message: "Add Staff",
              child: floatButton(
                  currentWidth, currentHeight, textScale, context, Icons.add,
                  () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: AddStaffScreen(),
                        type: PageTransitionType.fade));
              }),
            ),
            Tooltip(
              margin: EdgeInsets.only(bottom: 5, left: 10),
              textStyle: TextStyle(
                  color: Colors.black, fontSize: 32, fontFamily: "Tansek"),
              decoration: BoxDecoration(color: Colors.transparent),
              message: "Remove Staff",
              child: floatButton(
                  currentWidth, currentHeight, textScale, context, Icons.delete,
                  () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: RemoveStaffScreen(),
                        type: PageTransitionType.fade));
              }),
            ),
          ],
        ),
      ),
    );
  }
}
