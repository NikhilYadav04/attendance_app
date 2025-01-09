import 'package:attend_ease/providers/employee/employee_login_provider.dart';
import 'package:attend_ease/styling/colors.dart';
import 'package:attend_ease/screens/auth/company_login_screen.dart';
import 'package:attend_ease/styling/sizeconfig.dart';
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
   void clear(){
    context.read<EmployeeLoginProvider>().clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBEmployee(context,clear),
        body: Consumer<EmployeeLoginProvider>(
          builder: (context, provider, _) {
            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: 2.6785 * SizeConfig.widthMultiplier,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 2.2647 * SizeConfig.heightMultiplier,
                    ),
                    tileWidgetEmployee(),
                    SizedBox(
                      height: 3.3707 * SizeConfig.heightMultiplier,
                    ),
                    textFieldEmployee(
                      " ABC pvt. ltd.",
                      "Company Name",
                      provider.companyNameController,
                    ),
                    SizedBox(
                      height: 3.3707 * SizeConfig.heightMultiplier,
                    ),
                    textFieldEmployee(
                      "Rakesh",
                      "Employee Name",
                      provider.employeeNameController,
                    ),
                    SizedBox(
                      height: 3.3707 * SizeConfig.heightMultiplier,
                    ),
                    textFieldEmployee(
                      "XXX_123",
                      "Employee ID",
                      provider.employeeIDController,
                    ),
                    SizedBox(
                      height: 9.796 * SizeConfig.heightMultiplier,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Receive free Whatsapp alerts",
                          style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 2.0014 * SizeConfig.heightMultiplier),
                        ),
                        FlutterSwitch(
                            activeColor: Colours.BUTTON_COLOR_1,
                            inactiveColor: Colors.grey.shade700,
                            height: 3.4761 * SizeConfig.heightMultiplier,
                            width: 13.392 * SizeConfig.widthMultiplier,
                            value: provider.isAlert,
                            onToggle: (val) {
                              provider.setAlert(val);
                            }),
                      ],
                    ),
                    SizedBox(
                      height: 3.3707 * SizeConfig.heightMultiplier,
                    ),
                    provider.isLoading
                        ? SpinKitCircle(
                            color: Colours.BUTTON_COLOR_1,
                            size: 30,
                          )
                        : companyButton(() {
                            provider.loginEmployee(context);
                          }, context),
                    SizedBox(
                      height: 0.9480 * SizeConfig.heightMultiplier,
                    ),
                    Divider(
                      color: Colors.grey.shade700,
                      thickness: 2,
                    ),
                    SizedBox(
                      height: 0.9480 * SizeConfig.heightMultiplier,
                    ),
                    companyLoginButton(HRButtonPressed, context),
                       SizedBox(
                      height: 1.9480 * SizeConfig.heightMultiplier,
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
