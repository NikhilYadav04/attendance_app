import 'package:attend_ease/helper/helper_functions.dart';
import 'package:flutter/material.dart';

class InitializeProvider extends ChangeNotifier {
  Future<String> launchScreen() async {
    bool isLogin = (await HelperFunctions.getLoggedIn()) ?? false;
    bool isLoginCompany = (await HelperFunctions.getLoggedInCompany()) ?? false;
    bool isLoginEmployee =
        (await HelperFunctions.getLoggedInEmployee()) ?? false;

    print("islogin ${isLogin}");
    print("isloginCompany ${isLoginCompany}");
    print("isloginEmployee ${isLoginEmployee}");

    if (isLogin && isLoginCompany) {
      print("HR");
      return "HR";
    } else if (isLogin && isLoginEmployee) {
      print("Employee");
      return "Employee";
    } else {
      print("Default");
      return "Default";
    }
  }
}
