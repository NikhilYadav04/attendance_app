import 'dart:async';
import 'dart:convert';

import 'package:attend_ease/helper/helper_functions.dart';
import 'package:attend_ease/styling/url_constants.dart';
import 'package:http/http.dart' as http;

class locationService {
  // set location
  Future<String> setLocation(
      String? latitude, String? longitude, String radius) async {
    try {
      Uri url = Uri.parse(set_location_baseUrl);

      var req_body = jsonEncode(
          {"latitude": latitude, "longitude": longitude, "radius": radius});

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
      print(body);
      if (res.statusCode == 200) {
        print(body['message']);
        return "Stored";
      } else {
        print(body["message"]);
        return body['message'];
      }
    } on TimeoutException {
      return "Error : Server is taking too long to respond. Try again later.";
    } catch (e) {
      return e.toString();
    }
  }

  // get location
  Future<dynamic> getLocation() async {
    try {
      Uri url = Uri.parse(get_location_baseUrl);

      var token = await HelperFunctions.getEmployeeToken();

      var res = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${token}'
        },
      ).timeout(Duration(seconds: 3));

      var resBody = jsonDecode(res.body);
      var locationBody = resBody['message'];
      print("Locatiobody is ${locationBody}");
      print("Radius id ${locationBody['radius']}");

      if (res.statusCode == 200) {
        return locationBody;
      } else {
        return resBody['message'];
      }
    } on TimeoutException {
      return "Error : Server is taking too long to respond. Try again later.";
    } catch (e) {
      return "Error ${e.toString()}";
    }
  }
}
