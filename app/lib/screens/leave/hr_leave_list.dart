import 'package:attend_ease/providers/leave/leave_provider.dart';
import 'package:attend_ease/screens/leave/detail_list_screen.dart';
import 'package:attend_ease/styling/colors.dart';
import 'package:attend_ease/styling/sizeconfig.dart';
import 'package:attend_ease/widgets/company/company_hr_widgets.dart';
import 'package:attend_ease/widgets/leave/leave_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class HrLeaveList extends StatefulWidget {
  const HrLeaveList({super.key});

  @override
  State<HrLeaveList> createState() => _HrLeaveListState();
}

class _HrLeaveListState extends State<HrLeaveList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final provider = context.read<LeaveProvider>();
      await provider.fetchLeavesHR(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Consumer<LeaveProvider>(
          builder: (context, provider, _) {
            return Column(
              children: [
                SizedBox(
                  height: 1.58006*SizeConfig.heightMultiplier,
                ),
                approveTextEmployee("All Leaves"),
                SizedBox(
                  height: 3.160113*SizeConfig.heightMultiplier,
                ),
                provider.isLoadingList
                    ? SpinKitRing(
                        color: Colours.DARK_BLUE,
                        size:6.32022*SizeConfig.heightMultiplier,
                      )
                    : Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.01788*SizeConfig.widthMultiplier),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                cards(
                                    "Leaves\nRejected",
                                    provider.Rejected_List.length.toString(),
                                    Colors.red,
                                    const Color.fromARGB(255, 247, 221, 223),
                                    () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          child: DetailListScreen(
                                              title: "Rejected",
                                              bgColor: const Color.fromARGB(
                                                  255, 247, 221, 223),
                                              borderColor: Colors.red,
                                              list: provider.Rejected_List),
                                          type:
                                              PageTransitionType.bottomToTop));
                                }),
                                cards(
                                    "Leaves\nApproved",
                                    provider.Approved_List.length.toString(),
                                    Colors.lightGreen,
                                    const Color.fromARGB(255, 231, 243, 218),
                                    () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          child: DetailListScreen(
                                              title: "Approved",
                                              bgColor: const Color.fromARGB(
                                                  255, 231, 243, 218),
                                              borderColor: Colors.lightGreen,
                                              list: provider.Approved_List),
                                          type:
                                              PageTransitionType.bottomToTop));
                                }),
                              ],
                            ),
                            SizedBox(
                              height: 1.5800*SizeConfig.heightMultiplier,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                cards(
                                    "Leaves\nPending",
                                    provider.Pending_List.length.toString(),
                                    Colors.blue,
                                    Color.fromARGB(255, 212, 229, 243), () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          child: DetailListScreen(
                                              title: "Pending",
                                              bgColor: Color.fromARGB(
                                                  255, 212, 229, 243),
                                              borderColor: Colors.blue,
                                              list: provider.Pending_List),
                                          type:
                                              PageTransitionType.bottomToTop));
                                }),
                              ],
                            ),
                          ],
                        )),
                SizedBox(
                  height: 2.106748*SizeConfig.heightMultiplier,
                ),
                approveTextEmployee(
                     "Pending Leaves"),
                SizedBox(
                  height: 1.053*SizeConfig.heightMultiplier,
                ),
                provider.isLoadingList
                    ? SpinKitCircle(
                        color: Colours.DARK_BLUE,
                        size: 6.3202468*SizeConfig.heightMultiplier,
                      )
                    : Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.0178*SizeConfig.widthMultiplier),
                        child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: provider.Pending_List.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return bottomCard(
                                            provider.Pending_List[index]
                                                ["employeeID"],
                                            "${provider.Pending_List[index]["Start_Date"]} - ${provider.Pending_List[index]["End_Date"]}",
                                            provider.Pending_List[index]
                                                ["Leave_Title"],
                                            provider.Pending_List[index]
                                                ["Leave_Reason"],
                                            provider.Pending_List[index]
                                                    ["Leave_Count"]
                                                .toString());
                                      });
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 1.0533*SizeConfig.heightMultiplier),
                                  height: 18.96074*SizeConfig.heightMultiplier,
                                  decoration: BoxDecoration(
                                    color: Colours.BUTTON_COLOR_2,
                                    borderRadius: BorderRadius.circular(1.053*SizeConfig.heightMultiplier),
                                    border: Border.all(
                                        color: Colours.BUTTON_COLOR_2,
                                        width: 3),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colours.BUTTON_COLOR_1,
                                          spreadRadius: 2,
                                          blurRadius: 2)
                                    ],
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 3.125*SizeConfig.widthMultiplier, vertical: 1.89607*SizeConfig.heightMultiplier),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        leaveCardPending(
                                            provider.Pending_List[index]
                                                ["employeeID"],
                                            "${provider.Pending_List[index]["Start_Date"]} - ${provider.Pending_List[index]["End_Date"]}"),
                                        provider.isLoadingApp
                                            ? SpinKitCircle(
                                                color: Colors.red,
                                                size: 2.52809*SizeConfig.heightMultiplier,
                                              )
                                            : Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  buttons(
                                                      "Reject",
                                                      Icons.cancel_outlined,
                                                      Colors.red, () {
                                                    provider.arLeave(
                                                        context,
                                                        "Rejected",
                                                        provider.Pending_List[
                                                            index]["Leave_ID"]);
                                                  }),
                                                  buttons(
                                                      "Approve",
                                                      Icons
                                                          .check_circle_outline,
                                                      Colors.green, () {
                                                    provider.arLeave(
                                                        context,
                                                        "Approved",
                                                        provider.Pending_List[
                                                            index]["Leave_ID"]);
                                                  }),
                                                ],
                                              )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                SizedBox(
                  height: 2.6334*SizeConfig.heightMultiplier,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

TextStyle style = TextStyle(
  fontFamily: "Kumbh-Med",
);
