import 'package:attend_ease/providers/attendance/company_attendance_provider.dart';
import 'package:attend_ease/styling/colors.dart';
import 'package:attend_ease/styling/sizeconfig.dart';
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
    return Scaffold(
      backgroundColor: Colours.BUTTON_COLOR_2,
      body: SingleChildScrollView(child: Consumer<CompanyAttendanceProvider>(
        builder: (context, provider, _) {
          return Column(
            children: [
              SizedBox(
                height: 1.7907 * SizeConfig.heightMultiplier,
              ),
              approveTextEmployee("Staff Count List"),
              SizedBox(
                height: 1.7907 * SizeConfig.heightMultiplier,
              ),
              provider.isLoadingCountList
                  ? SpinKitRing(
                      color: Colours.DARK_BLUE,
                      size: 8.95368 * SizeConfig.heightMultiplier,
                    )
                  : provider.attendaneCountList.isEmpty
                      ? Center(
                          child: Text(
                            "No Record Available",
                            style: TextStyle(
                                color: Colours.DARK_BLUE,
                                fontFamily: "Tansek",
                                fontSize: 5.4775 * SizeConfig.heightMultiplier),
                          ),
                        )
                      : listApproval(context, provider.attendaneCountList)
            ],
          );
        },
      )),
    );
  }
}
