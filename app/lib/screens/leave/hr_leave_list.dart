import 'package:attend_ease/providers/leave/leave_provider.dart';
import 'package:attend_ease/screens/leave/detail_list_screen.dart';
import 'package:attend_ease/styling/colors.dart';
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
                approveTextEmployee(
                    currentWidth, currentHeight, textScale, "All Leaves"),
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
                                cards("Leaves\nRejected", "20", Colors.red,
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
                                              list: []),
                                          type:
                                              PageTransitionType.bottomToTop));
                                }),
                                cards(
                                    "Leaves\nApproved",
                                    "10",
                                    Colors.lightGreen,
                                    const Color.fromARGB(255, 231, 243, 218),
                                    () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          child: DetailListScreen(
                                              title: "",
                                              bgColor: const Color.fromARGB(
                                                  255, 231, 243, 218),
                                              borderColor: Colors.lightGreen,
                                              list: []),
                                          type:
                                              PageTransitionType.bottomToTop));
                                }),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                cards("Leaves\nPending", "05", Colors.blue,
                                    Color.fromARGB(255, 212, 229, 243), () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          child: DetailListScreen(
                                              title: "",
                                              bgColor: Color.fromARGB(
                                                  255, 212, 229, 243),
                                              borderColor: Colors.blue,
                                              list: []),
                                          type:
                                              PageTransitionType.bottomToTop));
                                }),
                              ],
                            ),
                          ],
                        )),
                SizedBox(
                  height: 20,
                ),
                approveTextEmployee(
                    currentWidth, currentHeight, textScale, "Pending Leaves"),
                SizedBox(
                  height: 10,
                ),
                provider.isLoadingList
                    ? SpinKitCircle(
                        color: Colours.DARK_BLUE,
                        size: 60,
                      )
                    : Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return leaveCardPending(context, "Kaushik_7508",
                                  "April 15, 2023 - April 18, 2024", "", "");
                            }),
                      ),
                SizedBox(
                  height: 25,
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


