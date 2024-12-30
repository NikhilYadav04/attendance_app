import 'package:attend_ease/providers/attendance/company_attendance_provider.dart';
import 'package:attend_ease/styling/colors.dart';
import 'package:attend_ease/styling/scale.dart';
import 'package:attend_ease/globalobjects/variables.dart';
import 'package:attend_ease/widgets/company/company_hr_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class ApprovalReqScreen extends StatefulWidget {
  const ApprovalReqScreen({super.key});

  @override
  State<ApprovalReqScreen> createState() => _ApprovalReqScreenState();
}

class _ApprovalReqScreenState extends State<ApprovalReqScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<CompanyAttendanceProvider>();
      provider.getCountList(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentHeight = MediaQuery.of(context).size.height;
    final currentWidth = MediaQuery.of(context).size.width;
    // ignore: deprecated_member_use
    final textScale = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      backgroundColor: Colours.BUTTON_COLOR_2,
      body: SingleChildScrollView(child: Consumer<CompanyAttendanceProvider>(
        builder: (context, provider, _) {
          return Column(
            children: [
              SizedBox(
                height:
                    responsiveContainerSize(15, currentWidth, currentHeight),
              ),
              approveTextEmployee(
                  currentWidth, currentHeight, textScale, "Staff Count List"),
              SizedBox(
                height:
                    responsiveContainerSize(15, currentWidth, currentHeight),
              ),
              provider.isLoadingCountList
                  ? SpinKitFadingCircle(
                      color: Colours.DARK_BLUE,
                      size: 85,
                    )
                  : provider.attendaneCountList.isEmpty
                      ? Center(
                          child: Text(
                            "No Record Available",
                            style: TextStyle(
                                color: Colours.DARK_BLUE,
                                fontFamily: "Tansek",
                                fontSize: 52),
                          ),
                        )
                      : listApproval(currentWidth, currentHeight, textScale,
                          context, provider.attendaneCountList)
            ],
          );
        },
      )),
    );
  }
}
