import 'dart:async';
import 'dart:convert';

import 'package:attend_ease/helper/helper_functions.dart';
import 'package:attend_ease/styling/url_constants.dart';
import 'package:http/http.dart' as http;

class LeaveService {
//* request a leave
  Future<String> reqLeave(String Leave_Title, String Start_Date,
      String End_Date, String Leave_Status, String Leave_Reason) async {
    try {
      Uri url = Uri.parse(req_leave_url);

      var req_body = jsonEncode({
        "Leave_Title": Leave_Title,
        "Start_Date": Start_Date,
        "End_Date": End_Date,
        "Leave_Reason": Leave_Reason,
        "Leave_Status": Leave_Status
      });

      var token = await HelperFunctions.getEmployeeToken();

      var res = await http
          .post(url,
              headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer ${token}'
              },
              body: req_body)
          .timeout(Duration(seconds: 3));

      var body = jsonDecode(res.body);

      if (res.statusCode == 200) {
        return "Success";
      } else {
        return body['message'];
      }
    } on TimeoutException {
      return "Error : Server is taking too long to respond. Try again later.";
    } catch (e) {
      return "Error : ${e.toString()}";
    }
  }

//* approve or reject a leave
  Future<String> arLeave(String Leave_Status, String Leave_ID) async {
    try {
      Uri url = Uri.parse(ar_leave_url);

      var req_body =
          jsonEncode({"Leave_Status": Leave_Status, "Leave_ID": Leave_ID});

      var token = await HelperFunctions.getCompanyToken();

      var res = await http
          .post(url,
              headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer ${token}'
              },
              body: req_body)
          .timeout(Duration(seconds: 3));

      var body = jsonDecode(res.body);

      if (res.statusCode == 200) {
        return "Success";
      } else {
        return body['message'];
      }
    } on TimeoutException {
      return "Error : Server is taking too long to respond. Try again later.";
    } catch (e) {
      return "Error : ${e.toString()}";
    }
  }

//* fetch leaves HR
  Future<dynamic> get_list_HR() async {
    try {
      Uri url = Uri.parse(fetch_leave_HR);

      var token = await HelperFunctions.getCompanyToken();

      var res = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${token}'
        },
      ).timeout(Duration(seconds: 3));

      var body = jsonDecode(res.body);

      if (res.statusCode == 200) {
        return body;
      }
    } on TimeoutException {
      return "Error : Server is taking too long to respond. Try again later.";
    } catch (e) {
      return "Error : ${e.toString()}";
    }
  }

//*fetch leaves Employee
  Future<dynamic> get_list_employees() async {
    try {
      Uri url = Uri.parse(fetch_leave_employee);

      var token = await HelperFunctions.getEmployeeToken();

      var res = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${token}'
        },
      ).timeout(Duration(seconds: 3));

      var body = jsonDecode(res.body);

      if (res.statusCode == 200) {
        return body;
      }
    } on TimeoutException {
      return "Error : Server is taking too long to respond. Try again later.";
    } catch (e) {
      return "Error : ${e.toString()}";
    }
  }
}
