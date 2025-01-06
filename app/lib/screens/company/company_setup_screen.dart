import 'package:attend_ease/providers/company/company_setup_provider.dart';
import 'package:attend_ease/styling/colors.dart';
import 'package:attend_ease/styling/sizeconfig.dart';
import 'package:attend_ease/widgets/company/company_setup_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';

class CompanySetupScreen extends StatefulWidget {
  const CompanySetupScreen({super.key});

  @override
  State<CompanySetupScreen> createState() => _CompanySetupScreenState();
}

class _CompanySetupScreenState extends State<CompanySetupScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: appB(context),
          body: Consumer<CompanySetupProvider>(
            builder: (context, provider, _) {
              return Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 2.678 * SizeConfig.widthMultiplier),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 2.844 * SizeConfig.heightMultiplier,
                      ),
                      tileWidget(),
                      SizedBox(height: 3.4761 * SizeConfig.heightMultiplier),
                      textField(
                        " ABC pvt. ltd.",
                        "Company Name",
                        provider.companyNameController,
                      ),
                      SizedBox(
                        height: 2.844 * SizeConfig.heightMultiplier,
                      ),
                      textField(" Mr. Nikhil", "Company HR",
                          provider.companyHRController),
                      SizedBox(
                        height: 2.844 * SizeConfig.heightMultiplier,
                      ),
                      textField(
                          " ABCX3", "Company ID", provider.companyIDController),
                      SizedBox(
                        height: 2.844 * SizeConfig.heightMultiplier,
                      ),
                      textFieldNumber(" 91XXX2XXX3", "Phone Number",
                          provider.companyHRNumberController),
                      SizedBox(
                        height: 2.844 * SizeConfig.heightMultiplier,
                      ),
                      textField(" eg. Mumbai", "Company City",
                          provider.companyCityController),
                      SizedBox(
                        height: 4.4241 * SizeConfig.heightMultiplier,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Send free Whatsapp alerts",
                            style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 2.001 * SizeConfig.heightMultiplier),
                          ),
                          FlutterSwitch(
                              activeColor: Colours.BUTTON_COLOR_1,
                              inactiveColor: Colors.grey.shade700,
                              height: 3.5814 * SizeConfig.heightMultiplier,
                              width: 13.392 * SizeConfig.widthMultiplier,
                              value: provider.isAlert,
                              onToggle: (val) {
                                provider.setAlert(val);
                              }),
                        ],
                      ),
                      SizedBox(height: 3.897 * SizeConfig.heightMultiplier),
                      provider.isLoading
                          ? SpinKitCircle(
                              color: Colours.BUTTON_COLOR_1,
                              size: 3.1601 * SizeConfig.heightMultiplier,
                            )
                          : companyButton(() {
                              provider.addCompany(formKey, context);
                            }, context),
                      SizedBox(
                        height: 2.844 * SizeConfig.heightMultiplier,
                      ),
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }
}
