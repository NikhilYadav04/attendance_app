import 'package:attend_ease/styling/scale.dart';
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
    final currentHeight = MediaQuery.of(context).size.height;
    final currentWidth = MediaQuery.of(context).size.width;
    // ignore: deprecated_member_use
    final currentTextscalefactor = MediaQuery.of(context).textScaleFactor;

    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.grey.shade200,
          child: SingleChildScrollView(
            child: Column(
              children: [
                imageSlider(
                    currentWidth, currentHeight, currentTextscalefactor),
                SizedBox(
                  height:
                      responsiveContainerSize(35, currentWidth, currentHeight),
                ),
                loginButton(currentWidth, currentHeight, currentTextscalefactor,
                    context),
                SizedBox(
                  height:
                      responsiveContainerSize(15, currentWidth, currentHeight),
                ),
                bottomText(currentWidth, currentHeight, currentTextscalefactor),
                SizedBox(
                  height:
                      responsiveContainerSize(55, currentWidth, currentHeight),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
