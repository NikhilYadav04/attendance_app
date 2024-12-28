import 'package:attend_ease/globalobjects/tokens.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {
  //* set to true when user is logged to company account
  static Future<bool> setLoggedInCompany(bool isLogIN) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.setBool(Tokens.LOGGED_IN_KEY_COMPANY, isLogIN);
  }

  //* set to true when user is logged in as employee
  static Future<bool> setLoggedInEmployee(bool isLogIN) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.setBool(Tokens.LOGGED_IN_KEY_EMPLOYEE, isLogIN);
  }

  //* set to true when user is logged in in any state
  static Future<bool> setLoggedIn(bool isLogIN) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.setBool(Tokens.LOGGED_IN_KEY, isLogIN);
  }

  //* store the token for company
  static Future<bool> setCompanyToken(String token) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.setString(Tokens.COMPANY_TOKEN, token);
  }

  //* store the token for employee
  static Future<bool> setEmployeeToken(String token) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.setString(Tokens.EMPLOYEE_TOKEN, token);
  }

  //* Store The Employee Name
  static Future<bool> setEmployeeName(String employeeName) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.setString(Tokens.EMPLOYEE_NAME_TOKEN, employeeName);
  }

  //* Store The Company Name
  static Future<bool> setCompanyName(String companyName) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.setString(Tokens.COMPANY_NAME_TOKEN, companyName);
  }

  //* Get The Company Name
  static Future<String?> getCompanyName() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(Tokens.COMPANY_NAME_TOKEN);
  }

  //* Get The Employee Name
  static Future<String?> getEmployeeName() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(Tokens.EMPLOYEE_NAME_TOKEN);
  }

  //* get the token for employee
  static Future<String?> getEmployeeToken() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(Tokens.EMPLOYEE_TOKEN);
  }

  //* get the token for company
  static Future<String?> getCompanyToken() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(Tokens.COMPANY_TOKEN);
  }

  //* get status if user is logged to company account
  static Future<bool?> getLoggedInCompany() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(Tokens.LOGGED_IN_KEY_COMPANY);
  }

  //* get status is user is logged in as employee
  static Future<bool?> getLoggedInEmployee() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(Tokens.LOGGED_IN_KEY_EMPLOYEE);
  }

  //* get status if user is logged in in any state
  static Future<bool?> getLoggedIn() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(Tokens.LOGGED_IN_KEY);
  }
}
