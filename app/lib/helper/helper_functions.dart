import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {
  static String LOGGED_IN_KEY_COMPANY = "COMPANY_KEY";
  static String LOGGED_IN_KEY_EMPLOYEE = "EMPLOYEE_KEY";
  static String LOGGED_IN_KEY = "LOGIN_KEY";
  static String COMPANY_TOKEN = "TOKEN_COMPANY";
  static String EMPLOYEE_TOKEN = "TOKEN_EMPLOYEE";
  static String EMPLOYEE_NAME_TOKEN = "EMPLOYEE_NAME_TOKEN";
  static String COMPANY_NAME_TOKEN = "COMPANY_NAME_TOKEN";

  //* set to true when user is logged to company account
  static Future<bool> setLoggedInCompany(bool isLogIN) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.setBool(LOGGED_IN_KEY_COMPANY, isLogIN);
  }

  //* set to true when user is logged in as employee
  static Future<bool> setLoggedInEmployee(bool isLogIN) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.setBool(LOGGED_IN_KEY_EMPLOYEE, isLogIN);
  }

  //* set to true when user is logged in in any state
  static Future<bool> setLoggedIn(bool isLogIN) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.setBool(LOGGED_IN_KEY, isLogIN);
  }

  //* store the token for company
  static Future<bool> setCompanyToken(String token) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.setString(COMPANY_TOKEN, token);
  }

  //* store the token for employee
  static Future<bool> setEmployeeToken(String token) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.setString(EMPLOYEE_TOKEN, token);
  }

  //* Store The Employee Name
  static Future<bool> setEmployeeName(String employeeName) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.setString(EMPLOYEE_NAME_TOKEN, employeeName);
  }

   //* Store The Company Name
  static Future<bool> setCompanyName(String companyName) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.setString(COMPANY_NAME_TOKEN,companyName);
  }

  //* Get The Company Name
  static Future<String?> getCompanyName() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(COMPANY_NAME_TOKEN);
  }

  //* Get The Employee Name
  static Future<String?> getEmployeeName() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(EMPLOYEE_NAME_TOKEN);
  }

  //* get the token for employee
  static Future<String?> getEmployeeToken() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(EMPLOYEE_TOKEN);
  }

  //* get the token for company
  static Future<String?> getCompanyToken() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(COMPANY_TOKEN);
  }

  //* get status if user is logged to company account
  static Future<bool?> getLoggedInCompany() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(LOGGED_IN_KEY_COMPANY);
  }

  //* get status is user is logged in as employee
  static Future<bool?> getLoggedInEmployee() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(LOGGED_IN_KEY_EMPLOYEE);
  }

  //* get status if user is logged in in any state
  static Future<bool?> getLoggedIn() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(LOGGED_IN_KEY);
  }
}
