import 'dart:convert';

import 'package:attend_ease/helper/helper_functions.dart';
import 'package:attend_ease/screens/home/home_screen.dart';
import 'package:attend_ease/services/companyService.dart';
import 'package:http/http.dart' as http;
import 'package:attend_ease/widgets/auth/otp_auth_widgets.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:toastification/toastification.dart';

class CompanyAttendanceProvider extends ChangeNotifier {
  final companyService CompanyService = companyService();

  //* variables
  String In = "0";
  String Out = "0";
  String Total = "";
  String Date = "";
  List<dynamic> attendaneCountList = [];
  List<dynamic> attendanceIDList = [];
  List<dynamic> attendanceEmployeeList = [];

  bool isLoading = false;
  bool isLoadingCountList = false;
  bool isLoadingID = false;
  bool isSubmit = false;

  //* Fetch The Records
  void fetchRecords(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    await CompanyService.getCount().then((value) async {
      if (value.toString().contains("jwt expired") ||
          value.toString().contains("Unauthorized: JWT is required")) {
        await HelperFunctions.setLoggedIn(false);
        await HelperFunctions.setLoggedInCompany(false);
        await HelperFunctions.setLoggedInEmployee(false);
        await HelperFunctions.setCompanyToken("");
        await HelperFunctions.setEmployeeToken("");

        isLoading = false;
        notifyListeners();

        Navigator.pushAndRemoveUntil(
            context,
            PageTransition(
              child: HomeScreen(),
              type: PageTransitionType.rightToLeft,
            ),
            (route) => false);
      } else if (value.toString().startsWith("Error")) {
        isLoading = false;
        notifyListeners();

        toastMessage(
            context, "Error!", value.toString(), ToastificationType.error);
      } else if (value.toString() == "No Records") {
        In = "0";
        Out = "0";
        Total = "0";
        isSubmit = false;

        isLoading = false;
        notifyListeners();
      } else {
        In = value["In"].toString();
        Out = value["Out"].toString();
        Total = value["Total"].toString();
        isSubmit = value["submit"];

        isLoading = false;
        notifyListeners();
      }
    });
  }

  //* Submit The Attendance
  void submit(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    await CompanyService.storeCountHistory(int.parse(Total), Date)
        .then((value) {
      if (value == "Success") {
        isLoading = false;
        isSubmit = true;

        notifyListeners();

        toastMessage(context, "Submitted", "Attendance Report Submitted Today",
            ToastificationType.success);
      } else {
        isLoading = false;
        notifyListeners();

        toastMessage(context, "Error!", value, ToastificationType.error);
      }
    });
  }

  //* Get STaff Count List
  void getCountList(BuildContext context) async {
    attendaneCountList.clear();
    isLoadingCountList = true;
    notifyListeners();

    await CompanyService.getCountList().then((value) {
      if (!value.isNotEmpty) {
        isLoadingCountList = false;
        notifyListeners();
      } else if (value.toString().startsWith("Error")) {
        isLoadingCountList = false;
        notifyListeners();

        toastMessage(context, "Error!", value, ToastificationType.error);
      } else {
        attendaneCountList = value;
        isLoadingCountList = false;
        notifyListeners();
      }
    });
  }

  //* Get All ID's
  void getIDs(BuildContext context) async {
    attendanceIDList.clear();
    isLoadingID = true;
    notifyListeners();

    const String url = 'http://192.168.56.1/company/get/-ids';

    try {
      // Retrieve the token
      var token = await HelperFunctions.getCompanyToken();

      // Make the GET request
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        attendanceIDList = data['message'];

        isLoadingID = false;
        notifyListeners();
      } else if (response.statusCode == 401) {
        attendanceIDList = [];

        isLoadingID = false;
        notifyListeners();
      }
    } catch (e) {
      isLoadingID = false;
      notifyListeners();

      toastMessage(context, "Error!", e.toString(), ToastificationType.error);
    }
  }

  //* Get Report Of A Particular Employee
  void getIDReport(BuildContext context, String employeeID) async {
    attendanceEmployeeList.clear();
    isLoadingID = true;
    notifyListeners();

    await CompanyService.getCountHistory(employeeID).then((value) {
      if (value.toString().startsWith("Error")) {
        isLoadingID = false;
        notifyListeners();

        toastMessageError(context, "Error!", value.toString());
      } else if (value == "Empty Body" || value == null) {
        isLoadingID = false;
        notifyListeners();
      } else {
        attendanceEmployeeList = value;

        isLoadingID = false;
        notifyListeners();
      }
    });
  }
}
