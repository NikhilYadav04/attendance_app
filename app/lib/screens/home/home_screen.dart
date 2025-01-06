import 'package:attend_ease/styling/scale.dart';
import 'package:attend_ease/screens/company/company_setup_screen.dart';
import 'package:attend_ease/screens/employee/employee_setup_screen.dart';
import 'package:attend_ease/widgets/home/home_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController textCOntroller;
  late Animation<double> textAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textCOntroller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    textAnimation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: textCOntroller, curve: Curves.easeIn));
    textCOntroller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final currentHeight = MediaQuery.of(context).size.height;
    final currentWidth = MediaQuery.of(context).size.width;
    // ignore: deprecated_member_use
    final textScale = MediaQuery.of(context).textScaleFactor;

    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          backgroundContainer(currentWidth, currentHeight),
          Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 12 * horizontalPaddingFactor(currentWidth),
                    vertical: 10 * verticalPaddingFactor(currentHeight)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    titleWidget(currentWidth, currentHeight, textScale),
                    SizedBox(
                      height: 15,
                    ),
                    welcomeText(currentWidth, currentHeight, textScale),
                    SizedBox(
                      height: responsiveContainerSize(
                          60, currentWidth, currentHeight),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 13),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        dashboardContainer("assets/login_screen/data.png", "Real Time Data"),
                        dashboardContainer("assets/login_screen/location.png", "GPS Attendance")
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        dashboardContainer("assets/login_screen/leave.png", "Manage Leaves"),
                        dashboardContainer("assets/login_screen/detail.png", "Detailed Report")
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  top: 680 * verticalPaddingFactor(currentHeight)),
              child: Column(
                children: [
                SizedBox(height: 05,),
                  companyButton(() {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: CompanySetupScreen(),
                            type: PageTransitionType.bottomToTop));
                  }, currentWidth, currentHeight, textScale, context),
                  SizedBox(
                    height: 10 * verticalPaddingFactor(currentHeight),
                  ),
                  widgetDivider(currentWidth, currentHeight),
                  SizedBox(
                    height: 8 * verticalPaddingFactor(currentHeight),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: EmployeeSetupScreen(),
                                type: PageTransitionType.bottomToTop));
                      },
                      child: existText(currentWidth, currentHeight, textScale))
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
