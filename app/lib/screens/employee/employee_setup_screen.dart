import 'package:attend_ease/providers/employee/employee_login_provider.dart';
import 'package:attend_ease/styling/colors.dart';
import 'package:attend_ease/styling/scale.dart';
import 'package:attend_ease/screens/auth/company_login_screen.dart';
import 'package:attend_ease/widgets/company/company_setup_screen_widgets.dart';
import 'package:attend_ease/widgets/employee/employee_setup_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class EmployeeSetupScreen extends StatefulWidget {
  const EmployeeSetupScreen({super.key});

  @override
  State<EmployeeSetupScreen> createState() => _EmployeeSetupScreenState();
}

class _EmployeeSetupScreenState extends State<EmployeeSetupScreen> {
  void HRButtonPressed() async {
    Navigator.push(
        context,
        PageTransition(
            child: CompanyLoginScreen(), type: PageTransitionType.rightToLeft));
  }

  @override
  Widget build(BuildContext context) {
    final currentHeight = MediaQuery.of(context).size.height;
    final currentWidth = MediaQuery.of(context).size.width;
    // ignore: deprecated_member_use
    final textScale = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
        appBar: appBEmployee(currentWidth, currentHeight, textScale, context),
        body: Consumer<EmployeeLoginProvider>(
          builder: (context, provider, _) {
            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: 11 * horizontalPaddingFactor(currentWidth),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: responsiveContainerSize(
                          20, currentWidth, currentHeight),
                    ),
                    tileWidgetEmployee(currentWidth, currentHeight, textScale),
                    SizedBox(
                      height: responsiveContainerSize(
                          30, currentWidth, currentHeight),
                    ),
                    textFieldEmployee(
                      currentWidth,
                      currentHeight,
                      textScale,
                      " ABC pvt. ltd.",
                      "Company Name",
                      provider.companyNameController,
                    ),
                    SizedBox(
                      height: responsiveContainerSize(
                          30, currentWidth, currentHeight),
                    ),
                    textFieldEmployee(
                      currentWidth,
                      currentHeight,
                      textScale,
                      "Rakesh",
                      "Employee Name",
                      provider.employeeNameController,
                    ),
                    SizedBox(
                      height: responsiveContainerSize(
                          30, currentWidth, currentHeight),
                    ),
                    textFieldEmployee(
                      currentWidth,
                      currentHeight,
                      textScale,
                      "XXX_123",
                      "Employee ID",
                      provider.employeeIDController,
                    ),
                    SizedBox(
                      height: responsiveContainerSize(
                          80, currentWidth, currentHeight),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Receive free Whatsapp alerts",
                          style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: responsiveContainerSize(
                                  17, currentWidth, currentHeight)),
                        ),
                        FlutterSwitch(
                            activeColor: Colours.BUTTON_COLOR_1,
                            inactiveColor: Colors.grey.shade700,
                            height: responsiveContainerSize(
                                38, currentWidth, currentWidth),
                            width: responsiveContainerSize(
                                65, currentWidth, currentWidth),
                            value: provider.isAlert,
                            onToggle: (val) {
                              provider.setAlert(val);
                            }),
                      ],
                    ),
                    SizedBox(
                      height: responsiveContainerSize(
                          30, currentWidth, currentHeight),
                    ),
                    provider.isLoading
                        ? SpinKitCircle(
                            color: Colours.BUTTON_COLOR_1,
                            size: 30,
                          )
                        : companyButton(() {
                            provider.loginEmployee(context);
                          }, currentWidth, currentHeight, textScale, context),
                    SizedBox(
                      height: responsiveContainerSize(
                          8, currentWidth, currentHeight),
                    ),
                    Divider(
                      color: Colors.grey.shade700,
                      thickness: 2,
                    ),
                    SizedBox(
                      height: responsiveContainerSize(
                          8, currentWidth, currentHeight),
                    ),
                    companyLoginButton(HRButtonPressed, currentWidth,
                        currentHeight, textScale, context),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
