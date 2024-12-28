import 'package:attend_ease/providers/auth/otp_provider.dart';
import 'package:attend_ease/styling/colors.dart';
import 'package:attend_ease/styling/scale.dart';
import 'package:attend_ease/globalobjects/variables.dart';
import 'package:attend_ease/screens/auth/modal_sheet_2.dart';
import 'package:attend_ease/services/otpService.dart';
import 'package:attend_ease/widgets/auth/otp_auth_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class SheetScreen1 extends StatefulWidget {
  final double width;
  final double height;
  final double textScaleFactor;

  SheetScreen1({
    required this.width,
    required this.height,
    required this.textScaleFactor,
  });

  @override
  _SheetScreen1State createState() => _SheetScreen1State();
}

class _SheetScreen1State extends State<SheetScreen1> {
  bool isLoading = false;
  final otpService = OtpService();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: Consumer<OtpProvider>(
        builder: (context, provider, _) {
          return Container(
            padding: EdgeInsets.symmetric(
                vertical: 30 * verticalPaddingFactor(widget.height),
                horizontal: 10 * horizontalPaddingFactor(widget.width)),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Icon(
                            Icons.cancel_outlined,
                            size: responsiveContainerSize(
                              35,
                              widget.width,
                              widget.height,
                            ),
                          )),
                      InkWell(
                          onTap: () {
                            WoltModalSheet.of(context).showNext();
                          },
                          child: Icon(
                            Icons.question_mark,
                            size: responsiveContainerSize(
                              35,
                              widget.width,
                              widget.height,
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: responsiveContainerSize(
                        20, widget.width, widget.height),
                  ),
                  titleText(
                    " Enter your mobile number",
                    widget.width,
                    widget.height,
                    widget.textScaleFactor,
                  ),
                  descriptionText(
                    " We will send OTP on this phone number",
                    widget.width,
                    widget.height,
                    widget.textScaleFactor,
                  ),
                  SizedBox(
                    height: responsiveContainerSize(
                        25, widget.width, widget.height),
                  ),
                  phoneNumberField(
                      widget.width,
                      widget.height,
                      widget.textScaleFactor,
                      formKey,
                      provider.numberController),
                  SizedBox(
                    height: responsiveContainerSize(
                        485, widget.width, widget.height),
                  ),
                  //* if loading state loader will show
                  provider.isLoading
                      ? SpinKitFadingCircle(
                          color: Colours.BUTTON_COLOR_1,
                          size: 30,
                        )
                      : continueButton2(() {
                          provider.submitNumber(formKey, context,widget.width, widget.height, widget.textScaleFactor);
                        }, widget.width, widget.height, widget.textScaleFactor,
                          context)
                ],
              ),
            ),
          );
        },
      )),
    );
  }
}
