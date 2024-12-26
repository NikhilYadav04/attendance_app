import 'dart:convert';

import 'package:attend_ease/helper/helper_functions.dart';
import 'package:attend_ease/styling/url_constants.dart';
import 'package:attend_ease/globalobjects/variables.dart';
import 'package:attend_ease/models/locationModel.dart';
import 'package:http/http.dart' as http;

class locationService {
  // set location
  Future<String> setLocation(
      String? latitude, String? longitude, double radius) async {
    try {
      Uri url = Uri.parse(set_location_baseUrl);

      Locationmodel locationBody = Locationmodel(
          latitude: latitude,
          longitude: longitude,
          companyName: companyName,
          radius: radius);

      var token = await HelperFunctions.getCompanyToken();

      var res = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${token}'
          },
          body: locationBody.toJson());
      var body = jsonDecode(res.body);
      print(body);
      if (res.statusCode == 200) {
        print(body['message']);
        return "Stored";
      } else {
        print(body["message"]);
        return body['message'];
      }
    } catch (e) {
      return e.toString();
    }
  }

  // get location
  Future<dynamic> getLocation() async {
    try {
      Uri url = Uri.parse(get_location_baseUrl);

      var token = await HelperFunctions.getEmployeeToken();

      var res = await http.post(
        url,
        headers: {'Authorization': 'Bearer ${token}'},
      );

      var resBody = jsonDecode(res.body);
      var locationBody = resBody['message'];
      print("Locatiobody is ${locationBody}");
      print("Radius id ${locationBody['radius']}");

      if (res.statusCode == 200) {
        return locationBody;
      } else {
        return resBody['message'];
      }
    } catch (e) {
      return "Error ${e.toString()}";
    }
  }
}
