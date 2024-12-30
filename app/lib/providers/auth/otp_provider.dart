import 'package:attend_ease/screens/auth/modal_sheet_2.dart';
import 'package:attend_ease/screens/home/home_screen.dart';
import 'package:attend_ease/services/otpService.dart';
import 'package:attend_ease/widgets/auth/otp_auth_widgets.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pinput/pinput.dart';
import 'package:toastification/toastification.dart';

class OtpProvider extends ChangeNotifier {
  //* Controller for number input
  final TextEditingController numberController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  bool isLoading = false;

  final otpService = OtpService();

  //* Function called when user submits number for OTP
  void submitNumber(GlobalKey<FormState> formKey, BuildContext context,
      double width, double height, double textScaleFactor) async {
    if (formKey.currentState!.validate()) {
      isLoading = true;
      notifyListeners();

      final connectivityStatus = await Connectivity().checkConnectivity();
      if (connectivityStatus[0] == ConnectivityResult.none) {
        print("first block");
        isLoading = false;
        notifyListeners();

        toastMessage(context, "No Internet!", "Check Your Internet Connection",
            ToastificationType.error);
      } else {
        print("apicallllll");
        await otpService.sendOTP(numberController.text).then((value) {
          if (value == "Success") {
            isLoading = false;
            notifyListeners();
            toastMessage(context, "Valid Number", "OTP has been sent !!",
                ToastificationType.success);
            Future.delayed(Duration(milliseconds: 500));
            Navigator.push(
                context,
                PageTransition(
                    child: SheetScreen2(
                        width: width,
                        height: height,
                        textScaleFactor: textScaleFactor),
                    type: PageTransitionType.rightToLeft));
          } else {
            isLoading = false;
            notifyListeners();
            toastMessage(context, "Error", value, ToastificationType.error);
          }
        });
      }
    }
  }

  //* Function to verify OTP
  void submitOTP(BuildContext context) async {
    if (otpController.length < 6) {
      toastMessage(context, "Validation Error",
          "OTP entered should be 6 digits", ToastificationType.error);
      notifyListeners();
    } else {
      isLoading = true;
      notifyListeners();

      final connectivityStatus = await Connectivity().checkConnectivity();
      if (connectivityStatus[0] == ConnectivityResult.none ||
          connectivityStatus[0] == ConnectionState.none) {
        isLoading = false;
        notifyListeners();

        toastMessage(context, "No Internet!", "Check Your Internet Connection",
            ToastificationType.error);
      } else {
        await otpService.verifyOTP(otpController.text).then((value) {
          if (value == "Verified") {
            isLoading = false;
            notifyListeners();
            toastMessage(context, "Verified", "OTP has been verified !!",
                ToastificationType.success);
            Future.delayed(Duration(milliseconds: 500));
            Navigator.pushAndRemoveUntil(
              context,
              PageTransition(
                child: HomeScreen(),
                type: PageTransitionType.bottomToTop,
              ),
              (Route<dynamic> route) =>
                  false, // This removes all the previous routes.
            );
          } else {
            isLoading = false;
            notifyListeners();
            toastMessage(context, "Error", value, ToastificationType.error);
          }
        });
      }
    }
  }

  @override
  void dispose() {
    numberController.dispose();
    otpController.dispose();
    super.dispose();
  }
}
