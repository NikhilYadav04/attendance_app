import 'package:attend_ease/helper/helper_functions.dart';
import 'package:attend_ease/screens/employee/employee_main_screen.dart';
import 'package:attend_ease/services/employeeService.dart';
import 'package:attend_ease/widgets/auth/otp_auth_widgets.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:toastification/toastification.dart';

class EmployeeLoginProvider extends ChangeNotifier {
  //* Controllers for fields
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController employeeNameController = TextEditingController();
  final TextEditingController employeeIDController = TextEditingController();

  bool isLoading = false;
  bool isAlert = false;

  void setAlert(bool value) {
    isAlert = value;
    notifyListeners();
  }

  //* employee Login API Call
  final Employeeservice employeeservice = Employeeservice();

  void loginEmployee(BuildContext context) async {
    if (companyNameController.text.isNotEmpty &&
        employeeNameController.text.isNotEmpty &&
        employeeIDController.text.isNotEmpty) {
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
        await employeeservice
            .joinCOmpany(companyNameController.text,
                employeeNameController.text, employeeIDController.text)
            .then((value) async {
          if (value == "Success") {
            await HelperFunctions.setLoggedIn(true);
            await HelperFunctions.setLoggedInEmployee(true);
            await HelperFunctions.setLoggedInCompany(false);
            await HelperFunctions.setEmployeeName(
                employeeNameController.text.toString());

            clear();

            toastMessage(
                context, "Success!", "Logged In ", ToastificationType.success);
            isLoading = false;
            notifyListeners();

            Navigator.pushAndRemoveUntil(
              context,
              PageTransition(
                  child: EmployeeMainScreen(),
                  type: PageTransitionType.rightToLeft),
              (route) => false,
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

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    companyNameController.dispose();
    employeeNameController.dispose();
    employeeIDController.dispose();
  }

  void clear(){
    companyNameController.clear();
    employeeNameController.clear();
    employeeIDController.clear();
  }
}

// isLoading = false;
//       notifyListeners();

//       toastMessage(context, "No Internet!", "Check Your Internet Connection", ToastificationType.error);

// final connectivityStatus = await Connectivity().checkConnectivity();
//     if (connectivityStatus == ConnectivityResult.none ||
//         connectivityStatus == ConnectionState.none) {
//     }
