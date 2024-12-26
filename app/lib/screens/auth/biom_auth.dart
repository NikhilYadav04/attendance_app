import 'package:attend_ease/styling/colors.dart';
import 'package:attend_ease/styling/scale.dart';
import 'package:attend_ease/widgets/auth/otp_auth_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';
import 'package:lottie/lottie.dart';

class BiomAuth extends StatefulWidget {
  BiomAuth({super.key, required this.isBiometric});
  bool isBiometric;

  @override
  State<BiomAuth> createState() => _BiomAuthState();
}

class _BiomAuthState extends State<BiomAuth> {
  late final LocalAuthentication auth;
  bool _supportState = false;

  Future<void> _getBiometrics() async {
    print("Getting biometrics...");
    List<BiometricType> availableBiometrics = await auth.getAvailableBiometrics();
    if (!mounted) {
      return;
    }
    authenticate();
  }

  Future<void> authenticate() async {
    try {
      print("Authenticating...");
      bool authenticated = await auth.authenticate(
        options: const AuthenticationOptions(
          stickyAuth: true,
        ),
        localizedReason: "Authenticate your Fingerprint To proceed further.",
      );
      setState(() {
        widget.isBiometric = authenticated;
      });
      print("Authentication result: ${widget.isBiometric}");
      widget.isBiometric
          ? Navigator.pop(context)
          : toastMessageError(context, "Error!", "Invalid Biometric ID");
    } catch (e) {
      print("Authentication error: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    auth = LocalAuthentication();
    auth.isDeviceSupported().then((bool isDeviceSupported) {
      setState(() {
        _supportState = isDeviceSupported;
      });
      if (!_supportState) {
        print("Error: Device not supported");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentHeight = MediaQuery.of(context).size.height;
    final currentWidth = MediaQuery.of(context).size.width;
    final textScale = MediaQuery.of(context).textScaleFactor;

    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(
              vertical: 70 * verticalPaddingFactor(currentHeight)),
          decoration: BoxDecoration(
              border: Border.all(color: Colours.BUTTON_COLOR_1, width: 10)),
          child: Center(
            child: Column(
              children: [
                LottieBuilder.asset(
                  "assets/animations/finger.json",
                  height: responsiveContainerSize(350, currentWidth, currentHeight),
                  width: responsiveContainerSize(350, currentWidth, currentHeight),
                ),
                Text(
                  "Click To Verify Biometric ID",
                  style: GoogleFonts.notoSansOldHungarian(
                      fontSize: responsiveFontSize(
                          28, currentWidth, currentHeight, textScale),
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  "For Attendance",
                  style: GoogleFonts.notoSansOldHungarian(
                      fontSize: responsiveFontSize(
                          28, currentWidth, currentHeight, textScale),
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  height: responsiveContainerSize(28, currentWidth, currentHeight),
                ),
                InkWell(
                  onTap: () {
                    _getBiometrics();
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 70 * horizontalPaddingFactor(currentWidth),
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: 5 * horizontalPaddingFactor(currentWidth),
                        vertical: 5 * verticalPaddingFactor(currentHeight)),
                    height: responsiveContainerSize(
                        60, currentWidth, currentHeight),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            responsiveBorderRadius(
                                10, currentWidth, currentHeight)),
                        color: Colours.BUTTON_COLOR_1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Authenticate",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: responsiveFontSize(
                                  24, currentWidth, currentHeight, textScale),
                              fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.fingerprint,
                            color: Colors.white,
                            size: responsiveContainerSize(
                                26, currentWidth, currentHeight),
                          ),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
