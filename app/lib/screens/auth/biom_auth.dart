import 'package:attend_ease/providers/attendance/employee_attendance_provider.dart';
import 'package:attend_ease/styling/colors.dart';
import 'package:attend_ease/styling/sizeconfig.dart';
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
                    height: 38.9748 * SizeConfig.heightMultiplier,
                    width: 82.589 * SizeConfig.widthMultiplier,
                  ),
                  Text(
                    "Click To Verify Biometric ID",
                    style: GoogleFonts.notoSansOldHungarian(
                      fontSize: 2.8967 * SizeConfig.heightMultiplier,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 3.1601 * SizeConfig.heightMultiplier),
                  InkWell(
                    onTap: () => _handleBiometricAuthentication(provider),
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 15.625 * SizeConfig.widthMultiplier,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 1.11607 * SizeConfig.widthMultiplier,
                        vertical: 0.52668 * SizeConfig.heightMultiplier,
                      ),
                      height: 6.53092 * SizeConfig.heightMultiplier,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          1.053 * SizeConfig.heightMultiplier,
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
                              fontSize: 2.7387 * SizeConfig.heightMultiplier,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.fingerprint,
                            color: Colors.white,
                            size: 2.8967 * SizeConfig.heightMultiplier,
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
