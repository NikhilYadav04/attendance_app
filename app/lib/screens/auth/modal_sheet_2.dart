import 'package:attend_ease/providers/auth/otp_provider.dart';
import 'package:attend_ease/styling/colors.dart';
import 'package:attend_ease/services/otpService.dart';
import 'package:attend_ease/styling/sizeconfig.dart';
import 'package:attend_ease/widgets/auth/otp_auth_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class SheetScreen2 extends StatefulWidget {
  const SheetScreen2({
    Key? key,
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
              vertical: 3.1601*SizeConfig.heightMultiplier,
              horizontal: 3.348*SizeConfig.widthMultiplier,
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
                        icon: Icon(Icons.arrow_circle_left_outlined, size: 3.686*SizeConfig.heightMultiplier),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.cancel_outlined,
                          size: 3.686*SizeConfig.heightMultiplier,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 0.5*SizeConfig.heightMultiplier,
                  ),
                  titleText(
                    "Enter your Verification Code",
                  ),
                  descriptionText(
                    "We have sent OTP on +${provider.numberController.text}",
                  ),
                  SizedBox(
                    height: 2.6334*SizeConfig.heightMultiplier,
                  ),
                  otpField(provider.otpController),
                  SizedBox(
                    height: 55.248*SizeConfig.heightMultiplier,
                  ),
                  //* if loading state loader will show
                  provider.isLoading
                      ? SpinKitFadingCircle(
                          color: Colours.DARK_BLUE,
                          size: 3.1601*SizeConfig.heightMultiplier,
                        )
                      : continueButton2(
                          () {
                            provider.submitOTP(context);
                          },
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
