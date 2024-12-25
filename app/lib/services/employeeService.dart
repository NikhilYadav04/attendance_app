import 'dart:convert';

import 'package:attend_ease/helper/helper_functions.dart';
import 'package:attend_ease/styling/url_constants.dart';
import 'package:http/http.dart' as http;

class Employeeservice {
  // to add employee
  Future<String> addEmployee(
    String employeeName,
    String employeeNumber,
    String employeePosition,
  ) async {
    Uri url = Uri.parse(add_employee_baseURl);

    var req_body = jsonEncode({
      'employeeName': employeeName,
      'employeeNumber': employeeNumber,
      'employeePosition': employeePosition
    });
    print(req_body);
    var token = await HelperFunctions.getCompanyToken();
    print(token);

    try {
      var res = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${token}'
          },
          body: req_body);

      var body = jsonDecode(res.body);

      if (res.statusCode == 200) {
        return "Success";
      } else if (res.statusCode == 400) {
        return body['message'];
      } else {
        return body['message'];
      }
    } catch (e) {
      return e.toString();
    }
  }

  // to join company
  Future<String> joinCOmpany(
      String companyName, String employeeName, String employeeID) async {
    Uri url = Uri.parse(login_employee_baseURl);

    var req_body = jsonEncode({companyName, employeeName, employeeID});

    try {
      var res = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: req_body);

      var body = jsonDecode(res.body);

      if (res.statusCode == 200) {
        await HelperFunctions.setEmployeeToken(body["message"]);
        await HelperFunctions.setCompanyToken("");
        return "Success";
      } else if (res.statusCode == 401) {
        return body['message'];
      } else {
        return body['message'];
      }
    } catch (e) {
      return e.toString();
    }
  }

  // to get attendance report
  Future<List<dynamic>> getReport(String? employeeName) async {
    try {
      Uri url = Uri.parse(report_employee_baseURl);

      var body = {"employeeName": employeeName};

      var res = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode(body));

      var resBody = jsonDecode(res.body);

      if (res.statusCode == 200) {
        List<dynamic> report = resBody['message'];
        return report;
      } else {
        return [];
      }
    } catch (e) {
      print("Error is ${e}");
      return [];
    }
  }
}
