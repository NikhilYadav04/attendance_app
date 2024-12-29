import 'dart:convert';

import 'package:attend_ease/helper/helper_functions.dart';
import 'package:attend_ease/styling/url_constants.dart';
import 'package:attend_ease/models/companyModel.dart';
import 'package:http/http.dart' as http;

class companyService {
  //add Company
  Future<String> addCompany(String companyName, String companyHR,
      String companyID,String HRNumber, String companyCity) async {
    try {
      Uri url = Uri.parse(add_company_baseUrl);

      CompanyModel companyBody = CompanyModel(
          companyName: companyName,
          companyHR: companyHR,
          companyID: companyID,
          companyCity: companyCity,
          HRNumber: HRNumber
          );

      var res = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: companyBody.toJson());

      if (res.statusCode == 200) {
        var body = jsonDecode(res.body);

        //* store the token
        await HelperFunctions.setCompanyToken(body["message"]);
        await HelperFunctions.setEmployeeToken("");
        return "Success";
      } else if (res.statusCode == 401) {
        var body = jsonDecode(res.body);
        return body['message'];
      } else {
        var body = jsonDecode(res.body);
        print(body['message']);
        return body['message'];
      }
    } catch (e) {
      return e.toString();
    }
  }

  //login as HR
  Future<String> loginCompany(String companyName, String companyID) async {
    try {
      Uri url = Uri.parse(login_company_baseUrl);

      var reqBody = jsonEncode({
        'companyName': companyName,
        'companyID': companyID,
      });

      var res = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: reqBody,
      );

      if (res.statusCode == 200) {
        var body = jsonDecode(res.body);
        //* Store the token
        await HelperFunctions.setCompanyToken(body["message"]);
        await HelperFunctions.setEmployeeToken("");
        return "Success";
      } else {
        // Parse the error message
        var body = jsonDecode(res.body);
        return body['message'] ?? "An unexpected error occurred";
      }
    } catch (e) {
      return "Error: ${e.toString()}";
    }
  }

//get staff list
  Future<List<dynamic>> getSTaff(String? employeeCompany) async {
    try {
      Uri uri = Uri.parse(report_company_baseURl);

      var body = {"employeeCompany": employeeCompany};

      var res = await http.post(uri,
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode(body));

      var resBody = jsonDecode(res.body);
      List<dynamic> report = resBody['message'];

      if (res.statusCode == 200) {
        return report;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

//get staff count
  Future<dynamic> getCount() async {
    try {
      Uri uri = Uri.parse(staff_count);

      var token = await HelperFunctions.getCompanyToken();

      var res = await http.get(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': "Bearer ${token}",
        },
      );

      var resBody = jsonDecode(res.body);
      var staffCount = resBody['message'];

      if (res.statusCode == 200) {
        return staffCount;
      } else {
        return resBody['message'];
      }
    } catch (e) {
      return "Error ${e.toString()}";
    }
  }

//change staff count
  Future<String> changeCount(int inCount, int outCount, int TotalCount) async {
    try {
      Uri uri = Uri.parse(staff_change_count);

      var body = {
        "inCount": inCount,
        "outCount": outCount,
        "TotalCount": TotalCount
      };

      var token = await HelperFunctions.getEmployeeToken();

      var res = await http.post(uri,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${token}'
          },
          body: jsonEncode(body));

      var resBody = jsonDecode(res.body);

      if (res.statusCode == 200) {
        return "Success";
      } else {
        return resBody['message'];
      }
    } catch (e) {
      return e.toString();
    }
  }

//store staff count history
  Future<String> storeCountHistory(int totalCount, String currentDate) async {
    try {
      Uri uri = Uri.parse(store_staff_history);

      var token = await HelperFunctions.getCompanyToken();

      var body = {
        "companyName": "",
        "totalCount": totalCount,
        "currentDate": currentDate
      };

      var res = await http.post(uri,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${token}'
          },
          body: jsonEncode(body));

      var resBody = jsonDecode(res.body);

      if (res.statusCode == 200) {
        return "Success";
      } else {
        return resBody['message'];
      }
    } catch (e) {
      return e.toString();
    }
  }

//get staff count history
  Future<dynamic> getCountHistory(String? employeeID) async {
    try {
      Uri uri = Uri.parse(get_staff_history);

      var body = {"employeeID": employeeID};

      var token = await HelperFunctions.getCompanyToken();

      var res = await http.post(uri,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${token}'
          },
          body: jsonEncode(body));
      var resBody = jsonDecode(res.body);

      if (res.statusCode == 200) {
        var list = resBody['message'];
        return list;
      } else {
        return resBody["message"];
      }
    } catch (e) {
      return e.toString();
    }
  }

//get staff count history in form of list
  Future<dynamic> getCountList() async {
    try {
      Uri uri = Uri.parse(staff_list_history);

      var token = await HelperFunctions.getCompanyToken();

      var res = await http.get(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${token}'
        },
      );
      var resBody = jsonDecode(res.body);
      List<dynamic> resList = resBody['message'];
      if (res.statusCode == 200) {
        return resList;
      } else {
        return [];
      }
    } catch (e) {
      return "Error ${e.toString()}";
    }
  }

// send notifications whatsapp
  Future<String> sendNotify(String? employeeName) async {
    try {
      Uri url = Uri.parse(notify);

      var body = {"employeeName": employeeName};

      var res = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode(body));
      var resBody = jsonDecode(res.body);

      if (res.statusCode == 200) {
        return resBody['message'];
      } else {
        return resBody['message'];
      }
    } catch (e) {
      return e.toString();
    }
  }
}
