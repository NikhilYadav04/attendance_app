import 'dart:math';

import 'package:attend_ease/providers/leave/leave_provider.dart';
import 'package:attend_ease/styling/colors.dart';
import 'package:attend_ease/widgets/company/company_hr_widgets.dart';
import 'package:attend_ease/widgets/leave/leave_widgets.dart';
import 'package:attend_ease/widgets/leave/leave_widgets_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class EmployeeLeaveList extends StatefulWidget {
  const EmployeeLeaveList({super.key});

  @override
  State<EmployeeLeaveList> createState() => _EmployeeLeaveListState();
}

class _EmployeeLeaveListState extends State<EmployeeLeaveList> {

  final PageController _pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     WidgetsBinding.instance.addPostFrameCallback((_) async {
      final provider = context.read<LeaveProvider>();
      await provider.fetchLeavesEmployee(context);
     provider.dynamic_length = await setLength(provider.Approved_List_Employee, provider.Pending_List_Employee, provider.Rejected_List_Employee);
    });
  }

   int setLength(List<dynamic> list1, List<dynamic> list2, List<dynamic> list3) {
      int max_length  = max(list1.length, max(list2.length,list3.length));
      return max_length;
   }

  @override
  Widget build(BuildContext context) {
    final currentHeight = MediaQuery.of(context).size.height;
    final currentWidth = MediaQuery.of(context).size.width;
    // ignore: deprecated_member_use
    final textScale = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Consumer<LeaveProvider>(
          builder: (context, provider, _) {
            return Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                approveTextEmployee(currentWidth, currentHeight, textScale, "Your Leaves"),
                SizedBox(
                  height: 30,
                ),
                provider.isLoadingList
                    ? SpinKitCircle(
                        color: Colours.DARK_BLUE,
                        size: 60,
                      )
                    : Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                cards(
                                    "Leaves\nRejected",
                                    provider.Rejected_List_Employee.length
                                        .toString(),
                                    Colors.red,
                                    const Color.fromARGB(255, 247, 221, 223),
                                    () {}),
                                cards(
                                    "Leaves\nApproved",
                                    provider.Approved_List_Employee.length
                                        .toString(),
                                    Colors.lightGreen,
                                    const Color.fromARGB(255, 231, 243, 218),
                                    () {}),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                cards(
                                    "Leaves\nPending",
                                    provider.Pending_List_Employee.length
                                        .toString(),
                                    Colors.blue,
                                    Color.fromARGB(255, 212, 229, 243),
                                    () {}),
                                 cards(
                                    "Leaves\nRemaining",
                                    provider.count.toString()
                                        .toString(),
                                    Colours.BUTTON_COLOR_1,
                                    Colours.BUTTON_COLOR_2,
                                    () {}),
                              ],
                            ),
                          ],
                        )),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      button(
                          "Rejected",
                          provider.buttonState == "rejected"
                              ? Colours.BUTTON_COLOR_1
                              : Colours.BUTTON_COLOR_2, () {
                        provider.changeSTate("rejected");
                        _pageController.animateToPage(0,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.linear);
                      }),
                      button(
                          "Pending",
                          provider.buttonState == "pending"
                              ? Colours.BUTTON_COLOR_1
                              : Colours.BUTTON_COLOR_2, () {
                        provider.changeSTate("pending");
                        _pageController.animateToPage(1,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.linear);
                      }),
                      button(
                          "Approved",
                          provider.buttonState == "approved"
                              ? Colours.BUTTON_COLOR_1
                              : Colours.BUTTON_COLOR_2, () {
                        provider.changeSTate("approved");
                        _pageController.animateToPage(2,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.linear);
                      })
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                provider.isLoadingList
                    ? SpinKitCircle(
                        color: Colours.DARK_BLUE,
                        size: 60,
                      )
                    : Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        child: SizedBox(
                          height: 160 * provider.dynamic_length + provider.dynamic_length*15,
                          child: PageView(
                            physics: NeverScrollableScrollPhysics(),
                            controller: _pageController,
                            children: [
                              leaveCardList(
                                  context,
                                  Colors.red,
                                  Color.fromARGB(255, 247, 221, 223),
                                  provider.Rejected_List_Employee),
                              leaveCardList(
                                  context,
                                  Colors.blue,
                                  Color.fromARGB(255, 212, 229, 243),
                                  provider.Pending_List_Employee),
                              leaveCardList(
                                  context,
                                  Colors.lightGreen,
                                  const Color.fromARGB(255, 231, 243, 218),
                                  provider.Approved_List_Employee),
                            ],
                          ),
                        ))
              ],
            );
          },
        ),
      ),
    );
  }
}
