import 'package:attend_ease/screens/company/company_setup_screen.dart';
import 'package:attend_ease/screens/employee/employee_setup_screen.dart';
import 'package:attend_ease/styling/sizeconfig.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        fit: StackFit.expand,
        children: [
          //* Blue Containner
          FractionallySizedBox(
              alignment: Alignment.topCenter,
              heightFactor: 0.775,
              child: backgroundContainer()),

          //* Content Of Blue Card
          FractionallySizedBox(
            alignment: Alignment.topCenter,
            heightFactor: .7,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 2.678 * SizeConfig.widthMultiplier,
                      vertical: 1.053 * SizeConfig.heightMultiplier),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 2.1067 * SizeConfig.heightMultiplier,
                      ),
                      titleWidget(),
                      SizedBox(
                        height: 1.5800 * SizeConfig.heightMultiplier,
                      ),
                      welcomeText(),
                      SizedBox(
                        height: 6.3202 * SizeConfig.heightMultiplier,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 2.9017 * SizeConfig.widthMultiplier),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          dashboardContainer(
                              "assets/login_screen/data.png", "Real Time Data"),
                          dashboardContainer("assets/login_screen/location.png",
                              "GPS Attendance")
                        ],
                      ),
                      SizedBox(
                        height: 2.1067 * SizeConfig.heightMultiplier,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          dashboardContainer(
                              "assets/login_screen/leave.png", "Manage Leaves"),
                          dashboardContainer("assets/login_screen/detail.png",
                              "Detailed Report")
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          //* Buttons
          FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: 0.998,
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    EdgeInsets.only(top: 76.685 * SizeConfig.heightMultiplier),
                child: Column(
                  children: [
                    SizedBox(
                      height: 0.1 * SizeConfig.heightMultiplier,
                    ),
                    companyButton(() {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: CompanySetupScreen(),
                              type: PageTransitionType.bottomToTop));
                    }, context),
                    SizedBox(
                      height: 1.3 * SizeConfig.heightMultiplier,
                    ),
                    widgetDivider(),
                    SizedBox(
                      height: 0.842 * SizeConfig.heightMultiplier,
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: EmployeeSetupScreen(),
                                  type: PageTransitionType.bottomToTop));
                        },
                        child: existText())
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
