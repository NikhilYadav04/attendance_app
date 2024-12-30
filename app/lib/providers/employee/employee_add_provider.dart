import 'package:attend_ease/services/employeeService.dart';
import 'package:attend_ease/widgets/auth/otp_auth_widgets.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class EmployeeAddProvider extends ChangeNotifier {
  //* controllers for input fields
  final TextEditingController employeeNameController = TextEditingController();
  final TextEditingController employeePositionController =
      TextEditingController();
  final TextEditingController employeeNumberController =
      TextEditingController();
  final TextEditingController employeeIDController = TextEditingController();

  bool isLoading = false;
  bool isLoadingRem = false;

  //* Function for add Staff API Call
  final Employeeservice employeeservice = Employeeservice();

  void addStaff(BuildContext context) async {
    if (employeeNameController.text.isNotEmpty &&
        employeePositionController.text.isNotEmpty &&
        employeeNumberController.text.isNotEmpty) {
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
            .addEmployee(employeeNameController.text,
                employeeNumberController.text, employeePositionController.text)
            .then((value) {
          if (value == "Success") {
            isLoading = false;
            notifyListeners();
            print(value);
            toastMessageSuccess(context, "Success", "Employee Added");
          } else {
            isLoading = false;
            notifyListeners();
            print(value);
            toastMessage(context, "Error!", value, ToastificationType.error);
          }
        });
      }
    } else {
      toastMessage(context, "Empty Details!", "Please fill all the fields",
          ToastificationType.warning);
    }
  }

  void RemStaff(BuildContext context) async {
    if (employeeIDController.text.isNotEmpty) {
      isLoadingRem = true;
      notifyListeners();

      final connectivityStatus = await Connectivity().checkConnectivity();
      if (connectivityStatus[0] == ConnectivityResult.none ||
          connectivityStatus[0] == ConnectionState.none) {
        isLoadingRem = false;
        notifyListeners();

        toastMessage(context, "No Internet!", "Check Your Internet Connection",
            ToastificationType.error);
      } else {
        await employeeservice
            .removeEmployee(employeeIDController.text)
            .then((value) {
          if (value == "Success") {
            isLoadingRem = false;
            notifyListeners();
            print(value);
            toastMessageSuccess(context, "Success", "Employee Removed");
          } else {
            isLoadingRem = false;
            notifyListeners();
            print(value);
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
    employeeNameController.dispose();
    employeeNumberController.dispose();
    employeePositionController.dispose();
    employeeIDController.dispose();
  }
}
