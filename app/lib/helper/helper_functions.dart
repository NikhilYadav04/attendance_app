import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {
  //* set to true when user is logged to company account
  static Future<bool> setLoggedInCompany(bool isLogIN) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.setBool(dotenv.get('LOGGED_IN_KEY_COMPANY'), isLogIN);
  }

  //* set to true when user is logged in as employee
  static Future<bool> setLoggedInEmployee(bool isLogIN) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.setBool(dotenv.get('LOGGED_IN_KEY_EMPLOYEE'), isLogIN);
  }

  //* set to true when user is logged in in any state
  static Future<bool> setLoggedIn(bool isLogIN) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.setBool(dotenv.get('LOGGED_IN_KEY'), isLogIN);
  }

  //* store the token for company
  static Future<bool> setCompanyToken(String token) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.setString(dotenv.get('COMPANY_TOKEN'), token);
  }

  //* store the token for employee
  static Future<bool> setEmployeeToken(String token) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.setString(dotenv.get('EMPLOYEE_TOKEN'), token);
  }

  //* Store The Employee Name
  static Future<bool> setEmployeeName(String employeeName) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.setString(dotenv.get('EMPLOYEE_NAME_TOKEN'), employeeName);
  }

  //* Store The Company Name
  static Future<bool> setCompanyName(String companyName) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.setString(dotenv.get('COMPANY_NAME_TOKEN'), companyName);
  }

  //* Store The Profile Photo
  static Future<bool> setProfilePhoto(String path) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.setString(dotenv.get('PHOTO_TOKEN'), path);
  }

  //* Get The Profile Photo
  static Future<String?> getProfilePhoto() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(dotenv.get('PHOTO_TOKEN'));
  }

  //* Get The Company Name
  static Future<String?> getCompanyName() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(dotenv.get('COMPANY_NAME_TOKEN'));
  }

  //* Get The Employee Name
  static Future<String?> getEmployeeName() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(dotenv.get('EMPLOYEE_NAME_TOKEN'));
  }

  //* get the token for employee
  static Future<String?> getEmployeeToken() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(dotenv.get('EMPLOYEE_TOKEN'));
  }

  //* get the token for company
  static Future<String?> getCompanyToken() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(dotenv.get('COMPANY_TOKEN'));
  }

  //* get status if user is logged to company account
  static Future<bool?> getLoggedInCompany() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(dotenv.get('LOGGED_IN_KEY_COMPANY'));
  }

  //* get status is user is logged in as employee
  static Future<bool?> getLoggedInEmployee() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(dotenv.get('LOGGED_IN_KEY_EMPLOYEE'));
  }

  //* get status if user is logged in in any state
  static Future<bool?> getLoggedIn() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(dotenv.get('LOGGED_IN_KEY'));
  }
}
