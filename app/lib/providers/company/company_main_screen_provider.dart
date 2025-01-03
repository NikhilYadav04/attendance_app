import 'package:attend_ease/helper/helper_functions.dart';
import 'package:attend_ease/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class CompanyMainScreenProvider extends ChangeNotifier {
  bool isLoading = false;

  //* Logout Event
  void logoutCompany(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    await HelperFunctions.setLoggedIn(false);
    await HelperFunctions.setLoggedInCompany(false);
    await HelperFunctions.setLoggedInEmployee(false);
    await HelperFunctions.setCompanyToken("");
    await HelperFunctions.setEmployeeToken("");
    await HelperFunctions.setEmployeeName("");
    await HelperFunctions.setCompanyName("");

    isLoading = false;
    notifyListeners();

    Navigator.pushAndRemoveUntil(
        context,
        PageTransition(
          child: HomeScreen(),
          type: PageTransitionType.fade,
        ),
        (Route<dynamic> route) => false);
  }
}

