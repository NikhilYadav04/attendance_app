import 'package:attend_ease/providers/attendance/employee_attendance_provider.dart';
import 'package:attend_ease/styling/colors.dart';
import 'package:attend_ease/styling/scale.dart';
import 'package:attend_ease/widgets/auth/otp_auth_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class BiomAuth extends StatefulWidget {
  const BiomAuth({super.key});

  @override
  State<BiomAuth> createState() => _BiomAuthState();
}

class _BiomAuthState extends State<BiomAuth> {
  late final LocalAuthentication auth;
  bool _supportState = false;

  @override
  void initState() {
    super.initState();
    auth = LocalAuthentication();
    auth.isDeviceSupported().then((bool isDeviceSupported) {
      setState(() {
        _supportState = isDeviceSupported;
      });
    });
  }

  Future<bool> _getBiometrics() async {
    try {
      List<BiometricType> availableBiometrics =
          await auth.getAvailableBiometrics();
      if (!mounted) return false;

      return await authenticate();
    } catch (e) {
      toastMessageError(context, "Error!", "Biometric authentication failed.");
      return false;
    }
  }

  Future<bool> authenticate() async {
    try {
      bool authenticated = await auth.authenticate(
        options: const AuthenticationOptions(stickyAuth: true),
        localizedReason: "Authenticate your Fingerprint To proceed further.",
      );

      if (authenticated) {
        Navigator.pop(context);
      } else {
        toastMessageError(context, "Error!", "Invalid Biometric ID");
      }
      return authenticated;
    } catch (e) {
      toastMessageError(context, "Error!", "Authentication error.");
      return false;
    }
  }

  void _handleBiometricAuthentication(
      EmployeeAttendanceProvider provider) async {
    bool result = await _getBiometrics();
    provider.changeBiometricStatus(result);
  }

  @override
  Widget build(BuildContext context) {
    final currentHeight = MediaQuery.of(context).size.height;
    final currentWidth = MediaQuery.of(context).size.width;
    final textScale = MediaQuery.of(context).textScaleFactor;

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Consumer<EmployeeAttendanceProvider>(
            builder: (context, provider, _) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LottieBuilder.asset(
                    "assets/animations/finger.json",
                    height: responsiveContainerSize(
                        350, currentWidth, currentHeight),
                    width: responsiveContainerSize(
                        350, currentWidth, currentHeight),
                  ),
                  Text(
                    "Click To Verify Biometric ID",
                    style: GoogleFonts.notoSansOldHungarian(
                      fontSize: responsiveFontSize(
                          28, currentWidth, currentHeight, textScale),
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                      height: responsiveContainerSize(
                          28, currentWidth, currentHeight)),
                  InkWell(
                    onTap: () => _handleBiometricAuthentication(provider),
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 70 * horizontalPaddingFactor(currentWidth),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 5 * horizontalPaddingFactor(currentWidth),
                        vertical: 5 * verticalPaddingFactor(currentHeight),
                      ),
                      height: responsiveContainerSize(
                          60, currentWidth, currentHeight),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          responsiveBorderRadius(
                              10, currentWidth, currentHeight),
                        ),
                        color: Colours.BUTTON_COLOR_1,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Authenticate",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: responsiveFontSize(
                                  24, currentWidth, currentHeight, textScale),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.fingerprint,
                            color: Colors.white,
                            size: responsiveContainerSize(
                                26, currentWidth, currentHeight),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
