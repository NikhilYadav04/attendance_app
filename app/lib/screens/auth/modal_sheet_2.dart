import 'package:attend_ease/providers/auth/otp_provider.dart';
import 'package:attend_ease/styling/colors.dart';
import 'package:attend_ease/styling/scale.dart';
import 'package:attend_ease/services/otpService.dart';
import 'package:attend_ease/widgets/auth/otp_auth_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class SheetScreen2 extends StatefulWidget {
  final double width;
  final double height;
  final double textScaleFactor;

  const SheetScreen2({
    Key? key,
    required this.width,
    required this.height,
    required this.textScaleFactor,
  }) : super(key: key);

  @override
  _SheetScreen2State createState() => _SheetScreen2State();
}

class _SheetScreen2State extends State<SheetScreen2> {
  bool isLoading = false;
  final otpService = OtpService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: Consumer<OtpProvider>(
        builder: (context, provider, _) {
          return Container(
            padding: EdgeInsets.symmetric(
              vertical: 30 * verticalPaddingFactor(widget.height),
              horizontal: 15 * horizontalPaddingFactor(widget.width),
            ),
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          WoltModalSheet.of(context).showPrevious();
                        },
                        icon: Icon(
                          Icons.arrow_circle_left_outlined,
                          size: responsiveContainerSize(
                            35,
                            widget.width,
                            widget.height,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.cancel_outlined,
                          size: responsiveContainerSize(
                            35,
                            widget.width,
                            widget.height,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: responsiveContainerSize(
                        10, widget.width, widget.height),
                  ),
                  titleText(
                    "Enter your Verification Code",
                    widget.width,
                    widget.height,
                    widget.textScaleFactor,
                  ),
                  descriptionText(
                    "We have sent OTP on +${provider.numberController.text}",
                    widget.width,
                    widget.height,
                    widget.textScaleFactor,
                  ),
                  SizedBox(
                    height: responsiveContainerSize(
                        25, widget.width, widget.height),
                  ),
                  otpField(widget.width, widget.height, widget.textScaleFactor,
                      provider.otpController),
                  SizedBox(
                    height: responsiveContainerSize(
                        485, widget.width, widget.height),
                  ),
                  //* if loading state loader will show
                  provider.isLoading
                      ? SpinKitFadingCircle(
                          color: Colours.DARK_BLUE,
                          size: 30,
                        )
                      : continueButton2(
                          () {
                            provider.submitOTP(context);
                          },
                          widget.width,
                          widget.height,
                          widget.textScaleFactor,
                          context,
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
