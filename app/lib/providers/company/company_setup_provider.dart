import 'package:attend_ease/screens/company/company_location_screen.dart';
import 'package:attend_ease/services/companyService.dart';
import 'package:attend_ease/widgets/auth/otp_auth_widgets.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:toastification/toastification.dart';

class CompanySetupProvider extends ChangeNotifier {
  //* Controllers For Company Setup
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController companyHRController = TextEditingController();
  final TextEditingController companyIDController = TextEditingController();
  final TextEditingController companyCityController = TextEditingController();

  bool isLoading = false;
  bool isAlert = false;

  //* to toggle alert set or not
  void setAlert(bool value) {
    isAlert = value;
    notifyListeners();
  }

  //* Add Company API Call Function
  final companyService CompanyService = companyService();

  void addCompany(GlobalKey<FormState> formkey, BuildContext context) async {
    if (companyNameController.text.isNotEmpty &&
        companyHRController.text.isNotEmpty &&
        companyCityController.text.isNotEmpty &&
        companyIDController.text.isNotEmpty) {
      isLoading = true;
      notifyListeners();
      await CompanyService.addCompany(
              companyNameController.text,
              companyHRController.text,
              companyIDController.text,
              companyCityController.text)
          .then((value) {
        if (value == "Success") {
          isLoading = false;
          notifyListeners();

          toastMessage(
              context,
              "Congrats!",
              "Company Account Created Successfully",
              ToastificationType.success);
          Future.delayed(Duration(milliseconds: 1000));
          Navigator.push(
              context,
              PageTransition(
                  child: CompanyLocationScreen(
                      companyName: companyNameController.text),
                  type: PageTransitionType.rightToLeft));
        } else {
          isLoading = false;
          notifyListeners();
          toastMessage(context, "Error!", value, ToastificationType.error);
        }
      });
    } else {
      toastMessage(context, "Empty Details!", "Please fill all the fields",
          ToastificationType.error);
    }
  }
}
