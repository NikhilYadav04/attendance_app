import 'package:attend_ease/helper/helper_functions.dart';
import 'package:attend_ease/screens/company/company_hr_screen.dart';
import 'package:attend_ease/services/companyService.dart';
import 'package:attend_ease/widgets/auth/otp_auth_widgets.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:toastification/toastification.dart';

class CompanyLoginProvider extends ChangeNotifier {
  //* controllers for login fields
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController companyIDController = TextEditingController();

  bool isLoading = false;
  bool isAlert = false;

  void setAlert(bool value) {
    isAlert = value;
    notifyListeners();
  }

  //* Company Login API Call
  final companyService CompanyService = companyService();

  void loginCompany(BuildContext context) async {
    if (companyNameController.text.isNotEmpty &&
        companyIDController.text.isNotEmpty) {
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
        await CompanyService.loginCompany(
                companyNameController.text, companyIDController.text)
            .then((value) async {
          if (value == "Success") {
            await HelperFunctions.setLoggedInCompany(true);
            await HelperFunctions.setLoggedIn(true);
            await HelperFunctions.setLoggedInEmployee(false);
            await HelperFunctions.setCompanyName(
                companyNameController.text.toString());
            isLoading = false;
            notifyListeners();

            clear();

            Navigator.pushAndRemoveUntil(
              context,
              PageTransition(
                child: CompanyHrScreen(),
                type: PageTransitionType.rightToLeft,
              ),
              (route) => false, // This removes all previous routes
            );
          } else {
            isLoading = false;
            notifyListeners();
            toastMessage(context, "Error!", value, ToastificationType.error);
          }
        });
      }
    } else {
      toastMessage(context, "Empty Details!", "Please fill all the fields",
          ToastificationType.warning);
    }
  }

  void clear() {
    companyIDController.clear();
    companyNameController.clear();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    companyIDController.dispose();
    companyNameController.dispose();
  }
}
