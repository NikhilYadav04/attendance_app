import 'dart:convert';

import 'package:attend_ease/helper/helper_functions.dart';
import 'package:attend_ease/styling/url_constants.dart';
import 'package:attend_ease/globalobjects/variables.dart';
import 'package:attend_ease/models/attendanceModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AttendanceService {
  // to mark attendance
  Future<String> markAttendance(String? InTime, String OutTime, String Date,
      bool isPresent, String Month, String Year) async {
    try {
      Uri url = Uri.parse(mark_attendance_url);

      var req_body = jsonEncode({
        'InTime': InTime,
        'OutTime': OutTime,
        'Date': Date,
        'isPresent': isPresent,
        'Month': Month,
        'Year': Year
      });

      var token = await HelperFunctions.getCompanyToken();
      var res = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${token}'
          },
          body: req_body);
      var body = jsonDecode(res.body);
      if (res.statusCode == 200) {
        TotalDays = body['message'];
        return "Success";
      } else {
        return body['message'];
      }
    } catch (e) {
      return e.toString();
    }
  }

  // to get attendance data
  Future<dynamic> getAttendance(String date, BuildContext context) async {
    try {
      Uri uri = Uri.parse(get_attendance_url);

      getAttendanceModel body =
          getAttendanceModel(employeeName: "", Date: date);

      var token = await HelperFunctions.getCompanyToken();

      var res = await http.post(uri,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${token}'
          },
          body: body.toJson());

      var resBody = jsonDecode(res.body);
      var finalBody = resBody['message'];
      print("FInalbody is ${finalBody}");

      if (res.statusCode == 200) {
        return resBody['message'];
      } else {
        return resBody['message'];
      }
    } catch (e) {
      print(e.toString());
      return "Error ${e.toString()}";
    }
  }

  // to get attendance days
  Future<dynamic> getAttendanceDays() async {
    try {
      Uri uri = Uri.parse(get_attendance_days_url);

      var token = await HelperFunctions.getEmployeeToken();

      var res = await http.post(uri, headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}'
      });

      var resBody = jsonDecode(res.body);

      if (res.statusCode == 200) {
        return resBody['message'];
      } else {
        return resBody['message'];
      }
    } catch (e) {
      return "Error ${e.toString()}";
    }
  }
}
