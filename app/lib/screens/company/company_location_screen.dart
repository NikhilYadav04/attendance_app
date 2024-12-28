import 'package:attend_ease/providers/company/company_location_provider.dart';
import 'package:attend_ease/styling/colors.dart';
import 'package:attend_ease/styling/scale.dart';
import 'package:attend_ease/globalobjects/variables.dart';
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
    final currentHeight = MediaQuery.of(context).size.height;
    final currentWidth = MediaQuery.of(context).size.width;
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      appBar: appBLocation(currentWidth, currentHeight, textScale, context),
      body: SingleChildScrollView(child: Consumer<CompanyLocationProvider>(
        builder: (context, provider, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              mapWidget(),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 12 * horizontalPaddingFactor(currentWidth)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: responsiveContainerSize(
                          20, currentWidth, currentHeight),
                    ),
                    pageText(currentWidth, currentHeight, textScale,
                        "Tell us your company address!"),
                    geoForceText(currentWidth, currentHeight, textScale),
                    SizedBox(
                      height: responsiveContainerSize(
                          30, currentWidth, currentHeight),
                    ),
                    pageText(currentWidth, currentHeight, textScale,
                        "Company location"),
                    SizedBox(
                      height: responsiveContainerSize(
                          10, currentWidth, currentHeight),
                    ),
                    locationSetBox(currentWidth, currentHeight, textScale, () {
                      provider.setLocation(context, widget.companyName);
                    },provider.latitude,provider.longitude),
                    SizedBox(
                      height: responsiveContainerSize(
                          20, currentWidth, currentHeight),
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                5 * horizontalPaddingFactor(currentWidth)),
                        height: responsiveContainerSize(
                            170, currentWidth, currentHeight),
                        decoration: BoxDecoration(
                          color: Colours.BUTTON_COLOR_2,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Column(
                          children: [
                            locationRadiusBox(
                                currentWidth, currentHeight, textScale),
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
                            rangeWidget(currentWidth, currentHeight, textScale),
                            SizedBox(
                              height: responsiveContainerSize(
                                  15, currentWidth, currentHeight),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: responsiveContainerSize(
                          30, currentWidth, currentHeight),
                    ),
                   provider.isLoading ? SpinKitCircle(color: Colours.BUTTON_COLOR_1,size: 30,)  : continueButton(() {
                      provider.storeLocation(widget.companyName, context);
                    }, currentWidth, currentHeight, textScale, context)
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
