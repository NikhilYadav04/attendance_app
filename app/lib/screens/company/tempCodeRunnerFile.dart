import 'package:attend_ease/providers/company_setup_provider.dart';
import 'package:attend_ease/styling/colors.dart';
import 'package:attend_ease/styling/scale.dart';
import 'package:attend_ease/globalobjects/controllers.dart';
import 'package:attend_ease/services/companyService.dart';
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
  bool isAlert = false;
  bool isLoading = false;
  final companyService CompanyService = companyService();

  @override
  Widget build(BuildContext context) {
    final currentHeight = MediaQuery.of(context).size.height;
    final currentWidth = MediaQuery.of(context).size.width;
    // ignore: deprecated_member_use
    final textScale = MediaQuery.of(context).textScaleFactor;
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: appB(currentWidth, currentHeight, textScale, context),
        body: Consumer<CompanySetupProvider>(
          builder: (context, provider, _) {
            return Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 11 * horizontalPaddingFactor(currentWidth)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: responsiveContainerSize(
                          20, currentWidth, currentHeight),
                    ),
                    tileWidget(currentWidth, currentHeight, textScale),
                    SizedBox(
                      height: responsiveContainerSize(
                          30, currentWidth, currentHeight),
                    ),
                    textField(
                        currentWidth,
                        currentHeight,
                        textScale,
                        " ABC pvt. ltd.",
                        "Company Name",
                        provider.companyNameController,
                        formKey),
                    SizedBox(
                      height: responsiveContainerSize(
                          25, currentWidth, currentHeight),
                    ),
                    textField(
                        currentWidth,
                        currentHeight,
                        textScale,
                        " Mr. Nikhil",
                        "Company HR",
                        provider.companyHRController,
                        formKey),
                    SizedBox(
                      height: responsiveContainerSize(
                          25, currentWidth, currentHeight),
                    ),
                    textField(currentWidth, currentHeight, textScale, " ABCX3",
                        "Company ID", provider.companyIDController, formKey),
                    SizedBox(
                      height: responsiveContainerSize(
                          25, currentWidth, currentHeight),
                    ),
                    textField(
                        currentWidth,
                        currentHeight,
                        textScale,
                        " eg. Mumbai",
                        "Company City",
                        provider.companyCityController,
                        formKey),
                    SizedBox(
                      height: responsiveContainerSize(
                          40, currentWidth, currentHeight),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Send free Whatsapp alerts",
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
                          35, currentWidth, currentHeight),
                    ),
                    provider.isLoading
                        ? SpinKitCircle(
                            color: Colours.BUTTON_COLOR_1,
                            size: 30,
                          )
                        : companyButton(() {
                            provider.addCompany(formKey, context);
                          }, currentWidth, currentHeight, textScale, context)
                  ],
                ),
              ),
            );
          },
        ));
  }
}
