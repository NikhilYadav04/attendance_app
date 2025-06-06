import 'dart:async';
import 'dart:convert';

import 'package:attend_ease/styling/url_constants.dart';
import 'package:http/http.dart' as http;

class OtpService {
  Future<String> sendOTP(String phoneNumber) async {
    try {
      Uri urlSendOtp = Uri.parse(send_OTP_baseUrl);
      // print(send_OTP_baseUrl);
      print(urlSendOtp);
      var res = await http
          .post(
            urlSendOtp,
            headers: {
              'Content-Type': 'application/json',
            },
            body: jsonEncode({'phoneNumber': phoneNumber}),
          )
          .timeout(Duration(seconds: 3));

      if (res.statusCode == 200) {
        return "Success";
      } else {
        return "";
      }
    } on TimeoutException {
      return "Error : Server is taking too long to respond. Try again later.";
    } catch (e) {
      // return e.toString();
      print(e.toString());
      return (e.toString());
    }
  }

  Future verifyOTP(String otp) async {
    try {
      Uri verifyOTP = Uri.parse(verify_OTP_baseUrl);

      var res = await http
          .post(
            verifyOTP,
            headers: {
              'Content-Type': 'application/json',
            },
            body: jsonEncode({'otp': otp}),
          )
          .timeout(Duration(seconds: 3));

      if (res.statusCode == 200) {
        return "Verified";
      } else if (res.statusCode == 400) {
        return "Not Verified";
      } else {
        var body = jsonDecode(res.body);
        return (body['message']);
      }
    } on TimeoutException {
      return "Error : Server is taking too long to respond. Try again later.";
    } catch (e) {
      return (e.toString());
    }
  }
}

// ignore: camel_case_types

