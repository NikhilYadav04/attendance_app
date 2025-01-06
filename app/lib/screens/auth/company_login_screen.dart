import 'package:attend_ease/providers/company/company_login_provider.dart';
import 'package:attend_ease/styling/colors.dart';
import 'package:attend_ease/styling/sizeconfig.dart';
import 'package:attend_ease/widgets/company/company_login_widgets.dart';
import 'package:attend_ease/widgets/company/company_setup_screen_widgets.dart';
import 'package:attend_ease/widgets/employee/employee_setup_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';

class CompanyLoginScreen extends StatefulWidget {
  const CompanyLoginScreen({super.key});

  @override
  State<CompanyLoginScreen> createState() => _CompanyLoginScreenState();
}

class _CompanyLoginScreenState extends State<CompanyLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBLoginCompany(context),
        body: Consumer<CompanyLoginProvider>(
          builder: (context, provider, _) {
            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: 2.455 * SizeConfig.widthMultiplier,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 2.3174 * SizeConfig.heightMultiplier),
                    tileWidgetLoginCompany(),
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
                      "XXX_123",
                      "Company ID",
                      provider.companyIDController,
                    ),
                    SizedBox(
                      height: 32 * SizeConfig.heightMultiplier,
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
                            height: 3.5814 * SizeConfig.heightMultiplier,
                            width: 12.9464 * SizeConfig.widthMultiplier,
                            value: provider.isAlert,
                            onToggle: (val) {
                              provider.setAlert(val);
                            }),
                      ],
                    ),
                    SizedBox(
                      height: 3.37079 * SizeConfig.heightMultiplier,
                    ),
                    provider.isLoading
                        ? SpinKitCircle(
                            color: Colours.BUTTON_COLOR_1,
                            size: 3.37079 * SizeConfig.heightMultiplier,
                          )
                        : companyButton(() {
                            provider.loginCompany(context);
                          }, context),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
