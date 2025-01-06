import 'package:attend_ease/styling/sizeconfig.dart';
import 'package:attend_ease/widgets/auth/otp_auth_widgets.dart';
import 'package:flutter/material.dart';

class OtpAuthScreen extends StatefulWidget {
  const OtpAuthScreen({super.key});

  @override
  State<OtpAuthScreen> createState() => _OtpAuthScreenState();
}

class _OtpAuthScreenState extends State<OtpAuthScreen> {
  bool isLoggedIn = false;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.grey.shade200,
          child: SingleChildScrollView(
            child: Column(
              children: [
                imageSlider(),
                SizedBox(
                  height: 4.002 * SizeConfig.heightMultiplier,
                ),
                loginButton(context),
                SizedBox(
                  height: 1.580 * SizeConfig.heightMultiplier,
                ),
                bottomText(),
                SizedBox(
                  height: 5.793 * SizeConfig.heightMultiplier,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
