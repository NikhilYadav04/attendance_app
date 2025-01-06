import 'package:attend_ease/providers/auth/otp_provider.dart';
import 'package:attend_ease/styling/colors.dart';
import 'package:attend_ease/services/otpService.dart';
import 'package:attend_ease/styling/sizeconfig.dart';
import 'package:attend_ease/widgets/auth/otp_auth_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class SheetScreen1 extends StatefulWidget {
  SheetScreen1();

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
                vertical: 3.1601 * SizeConfig.heightMultiplier,
                horizontal: 2.232 * SizeConfig.widthMultiplier),
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
                            size: 3.686 * SizeConfig.heightMultiplier,
                          )),
                      InkWell(
                          onTap: () {
                            WoltModalSheet.of(context).showNext();
                          },
                          child: Icon(Icons.question_mark,
                              size: 3.686 * SizeConfig.heightMultiplier)),
                    ],
                  ),
                  SizedBox(height: 2.106 * SizeConfig.heightMultiplier),
                  titleText(
                    " Enter your mobile number",
                  ),
                  descriptionText(
                    " We will send OTP on this phone number",
                  ),
                  SizedBox(height: 2.844 * SizeConfig.heightMultiplier),
                  phoneNumberField(formKey, provider.numberController),
                  SizedBox(height: 55.828 * SizeConfig.heightMultiplier),
                  //* if loading state loader will show
                  provider.isLoading
                      ? SpinKitFadingCircle(
                          color: Colours.BUTTON_COLOR_1,
                          size: 3.160 * SizeConfig.heightMultiplier,
                        )
                      : continueButton2(() {
                          provider.submitNumber(formKey, context);
                        }, context)
                ],
              ),
            ),
          );
        },
      )),
    );
  }
}
