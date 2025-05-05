import 'dart:convert';

import 'package:attend_ease/helper/date_time_formatter.dart';
import 'package:attend_ease/helper/helper_functions.dart';
import 'package:attend_ease/screens/home/home_screen.dart';
import 'package:attend_ease/services/companyService.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
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
  String Total = "0";
  String Date = "";
  List<dynamic> attendaneCountList = [];
  List<dynamic> attendanceIDList = [];
  List<dynamic> attendanceEmployeeList = [];
  List<dynamic> filteredCountList = [];
  List<dynamic> filteredIDList = [];

  bool isLoading = false;
  bool isLoadingCountList = false;
  bool isLoadingID = false;
  bool isSubmit = false;

  final TextEditingController searchController = TextEditingController();
  final TextEditingController searchController1 = TextEditingController();

  //* Fetch The Records
  void fetchRecords(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    final connectivityStatus = await Connectivity().checkConnectivity();
    if (connectivityStatus[0] == ConnectivityResult.none ||
        connectivityStatus[0] == ConnectionState.none) {
      isLoading = false;
      notifyListeners();

      toastMessage(context, "No Internet!", "Check Your Internet Connection",
          ToastificationType.error);

      Navigator.pushAndRemoveUntil(
          context,
          PageTransition(
            child: HomeScreen(),
            type: PageTransitionType.rightToLeft,
          ),
          (route) => false);
    } else {
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
  }

  //* Submit The Attendance
  void submit(BuildContext context) async {
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
      await CompanyService.storeCountHistory(int.parse(Total), Date)
          .then((value) {
        if (value == "Success") {
          isLoading = false;
          isSubmit = true;

          notifyListeners();

          toastMessage(context, "Submitted",
              "Attendance Report Submitted Today", ToastificationType.success);
        } else {
          isLoading = false;
          notifyListeners();

          toastMessage(context, "Error!", value, ToastificationType.error);
        }
      });
    }
  }

  //* Get STaff Count List
  void getCountList(BuildContext context) async {
    attendaneCountList.clear();
    isLoadingCountList = true;
    notifyListeners();

    final connectivityStatus = await Connectivity().checkConnectivity();
    if (connectivityStatus[0] == ConnectivityResult.none ||
        connectivityStatus[0] == ConnectionState.none) {
      isLoadingCountList = false;
      notifyListeners();

      toastMessage(context, "No Internet!", "Check Your Internet Connection",
          ToastificationType.error);
    } else {
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
          filteredCountList = value;
          isLoadingCountList = false;
          notifyListeners();
        }
      });
    }
  }

  //* Get All ID's
  void getIDs(BuildContext context) async {
    attendanceIDList.clear();
    isLoadingID = true;
    notifyListeners();

    final connectivityStatus = await Connectivity().checkConnectivity();
    if (connectivityStatus[0] == ConnectivityResult.none ||
        connectivityStatus[0] == ConnectionState.none) {
      isLoadingID = false;
      notifyListeners();

      toastMessage(context, "No Internet!", "Check Your Internet Connection",
          ToastificationType.error);
    } else {
      const String url = 'https://attendance-app-odiw.onrender.com/company/get/-ids';

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
          filteredIDList = attendanceIDList;

          isLoadingID = false;
          notifyListeners();
        } else if (response.statusCode == 404) {
          attendanceIDList = [];
          filteredIDList = attendanceIDList;

          isLoadingID = false;
          notifyListeners();
        }
      } catch (e) {
        isLoadingID = false;
        notifyListeners();

        toastMessage(context, "Error!", e.toString(), ToastificationType.error);
      }
    }
  }

  //* Get Report Of A Particular Employee
  void getIDReport(BuildContext context, String employeeID) async {
    attendanceEmployeeList.clear();
    isLoadingID = true;
    notifyListeners();

    final connectivityStatus = await Connectivity().checkConnectivity();
    if (connectivityStatus[0] == ConnectivityResult.none ||
        connectivityStatus[0] == ConnectionState.none) {
      isLoadingID = false;
      notifyListeners();

      toastMessage(context, "No Internet!", "Check Your Internet Connection",
          ToastificationType.error);
    }

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

  //* search any record
  void searchRecordCount(String keyword) {
    if (keyword.isEmpty) {
      filteredCountList = attendaneCountList;
      notifyListeners();
    } else {
      filteredCountList = attendaneCountList
          .where((user) => DateTimeFormatter.formatDate(user["currentDate"])
              .toLowerCase()
              .contains(keyword.toLowerCase()))
          .toList();
      notifyListeners();
    }
    notifyListeners();
  }

  void searchRecordID(String keyword) {
    if (keyword.isEmpty) {
      filteredIDList = attendanceIDList;
      notifyListeners();
    } else {
      filteredIDList = attendanceIDList
          .where((user) =>
              user["employeeID"].toLowerCase().contains(keyword.toLowerCase()))
          .toList();
      notifyListeners();
    }
    notifyListeners();
  }
}
