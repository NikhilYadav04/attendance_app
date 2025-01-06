import 'package:attend_ease/providers/company/company_location_provider.dart';
import 'package:attend_ease/styling/colors.dart';
import 'package:attend_ease/styling/sizeconfig.dart';
import 'package:attend_ease/widgets/company/company_location_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class CompanyLocationScreen extends StatefulWidget {
  final String companyName;
  CompanyLocationScreen({super.key, required this.companyName});

  @override
  State<CompanyLocationScreen> createState() => _CompanyLocationScreenState();
}

class _CompanyLocationScreenState extends State<CompanyLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBLocation(context),
      body: SingleChildScrollView(child: Consumer<CompanyLocationProvider>(
        builder: (context, provider, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              mapWidget(),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 2.678 * SizeConfig.widthMultiplier),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 2.317 * SizeConfig.heightMultiplier,
                    ),
                    pageText("Tell us your company address!"),
                    geoForceText(),
                    SizedBox(
                      height: 3.370798352522305 * SizeConfig.heightMultiplier,
                    ),
                    pageText("Company location"),
                    SizedBox(
                      height: 1.264 * SizeConfig.heightMultiplier,
                    ),
                    locationSetBox(() {
                      provider.setLocation(context, widget.companyName);
                    }, provider.latitude, provider.longitude),
                    SizedBox(
                      height: 2.3174 * SizeConfig.heightMultiplier,
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 1.116 * SizeConfig.widthMultiplier),
                        height: 186,
                        decoration: BoxDecoration(
                          color: Colours.BUTTON_COLOR_2,
                          borderRadius: BorderRadius.circular(
                              0.632 * SizeConfig.heightMultiplier),
                        ),
                        child: Column(
                          children: [
                            locationRadiusBox(),
                            Expanded(
                              child: Slider(
                                  activeColor: Colours.BUTTON_COLOR_1,
                                  value: provider.sliderValue,
                                  label: "${provider.sliderValue} m",
                                  max: 500,
                                  divisions: 400,
                                  onChanged: (val) {
                                    provider.changeRadius(val);
                                  }),
                            ),
                            rangeWidget(),
                            SizedBox(
                              height: 1.790 * SizeConfig.heightMultiplier,
                            ),
                          ],
                        )),
                    SizedBox(height: 3.3707 * SizeConfig.heightMultiplier),
                    provider.isLoading
                        ? SpinKitCircle(
                            color: Colours.BUTTON_COLOR_1,
                            size: 3.3707 * SizeConfig.heightMultiplier,
                          )
                        : continueButton(() {
                            provider.storeLocation(widget.companyName, context);
                          }, context)
                  ],
                ),
              ),
            ],
          );
        },
      )),
    );
  }
}
