import 'package:attend_ease/helper/helper_functions.dart';
import 'package:attend_ease/screens/home/home_screen.dart';
import 'package:attend_ease/services/companyService.dart';
import 'package:attend_ease/styling/url_constants.dart';
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
  String? companyName = "";
  List<dynamic> attendaneCountList = [];

  bool isLoading = false;
  bool isLoadingCountList = false;
  bool isSubmit = false;

  //* Fetch The Records
  void fetchRecords(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    companyName = await HelperFunctions.getCompanyName();

    await CompanyService.getCount().then((value) async {
      if (value.toString().contains("jwt expired")) {
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
        In = value["In"];
        Out = value["Out"];
        Total = value["Total"];
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

 
}
