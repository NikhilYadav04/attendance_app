import 'package:attend_ease/helper/helper_functions.dart';
import 'package:attend_ease/screens/home/home_screen.dart';
import 'package:attend_ease/services/attendanceService.dart';
import 'package:attend_ease/services/companyService.dart';
import 'package:attend_ease/services/employeeService.dart';
import 'package:attend_ease/services/locationService.dart';
import 'package:attend_ease/widgets/auth/otp_auth_widgets.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:toastification/toastification.dart';

class EmployeeAttendanceProvider extends ChangeNotifier {
  final AttendanceService attendanceService = AttendanceService();
  final locationService LocationService = locationService();
  final companyService CompanyService = companyService();
  final Employeeservice employeeservice = Employeeservice();

  //* variables
  String? InTime = "00:00";
  String OutTime = "00:00";
  String Status = "No";
  List<dynamic> attendanceRecords = [];

  bool isLoading = false;
  bool isBiometric = false;
  bool isPresent = false;
  bool inRadius = false;
  bool isLoadingList = false;

  //* Get The Records of Attendance For A date
  void fetchRecord(String Date, BuildContext context) async {
    isLoading = true;
    notifyListeners();

    var report = await attendanceService.getAttendance(Date, context);

    //* check if report exists for that date

    if (report == null) {
      isLoading = false;
      notifyListeners();

      toastMessage(context, "Error!", "Error fetching records",
          ToastificationType.error);
    }

    if (report.toString() == "Doesn't Exists") {
      InTime = "00:00";
      OutTime = "00:00";
      Status = "No";
      print(Status);

      isLoading = false;
      isBiometric = false;
      inRadius = false;
      isPresent = false;
      notifyListeners();

      //* check if JWT is Expired or Not
    } else if (report.toString().contains("jwt expired")) {
      await HelperFunctions.setLoggedIn(false);
      await HelperFunctions.setLoggedInCompany(false);
      await HelperFunctions.setLoggedInEmployee(false);
      await HelperFunctions.setCompanyToken("");
      await HelperFunctions.setEmployeeToken("");

      isLoading = false;
      notifyListeners();

      Navigator.pushAndRemoveUntil(
        context,
        PageTransition(
          child: HomeScreen(),
          type: PageTransitionType.rightToLeft,
        ),
        (route) => false, //8 This removes all previous routes
      );
    } else if (report.toString().startsWith("Error")) {
      isLoading = false;
      isPresent = false;
      notifyListeners();

      toastMessage(
          context, "Error!", report.toString(), ToastificationType.error);
    } else {
      InTime = report["InTime"];
      OutTime = report["OutTime"];
      Status = "Yes";

      isLoading = false;
      isPresent = report["isPresent"];

      notifyListeners();
    }
  }

  //* Change Biometric Status
  void changeBiometricStatus(bool val) {
    isBiometric = val;
    notifyListeners();
  }

  //* Submit Attendance
  void submitAttendanceIn(
      BuildContext context, String Date, String Month, String Year) async {
    isLoading = true;
    notifyListeners();

    //* mark attendance only if biometric is verified
    if (isBiometric) {
      String time = DateFormat('HH:mm').format(DateTime.now());

      //* check if attendance report is submitted or not
      var check = await CompanyService.changeCount(1, 0, 0);

      if (check == "Success") {
        await attendanceService
            .markAttendanceIn(time, Date, false, Month, Year)
            .then((value) async {
          if (value == "Success") {
            isLoading = false;
            notifyListeners();

            toastMessage(context, "Marked!", "In-Time Marked Successfully",
                ToastificationType.success);
          } else if (value.toString().contains("jwt expired")) {
            isLoading = false;
            notifyListeners();

            toastMessage(context, "Session Over!", "Login Again And Try Again",
                ToastificationType.error);
          } else {
            isLoading = false;
            notifyListeners();

            toastMessage(context, "Error!", value, ToastificationType.error);
          }
        });
      } else if (check == "Submitted") {
        isLoading = false;
        notifyListeners();

        toastMessage(
            context,
            "Cannot Mark",
            "Attendance Report Submitted for Today",
            ToastificationType.warning);
      } else {
        isLoading = false;
        notifyListeners();

        toastMessage(context, "Error!", check, ToastificationType.error);
      }
    } else {
      isLoading = false;
      notifyListeners();
      toastMessage(
          context,
          "Biometric Incomplete",
          "Complete Biometric to submit attendance",
          ToastificationType.warning);
    }
  }

  void submitAttendanceOut(
      BuildContext context, String Date, String Month, String Year) async {
    isLoading = true;
    notifyListeners();

    //* check if attendance report is submitted or not
    var check = await CompanyService.changeCount(0, 1, 1);

    //* mark attendance only if biometric is verified
    if (isBiometric) {
      if (check == "Success") {
        //* check if InTime is marked
        if (InTime == "00:00") {
          isLoading = false;
          notifyListeners();
          toastMessage(context, "Mark In-Time", "Please mark In-Time First",
              ToastificationType.warning);
        } else {
          String time = DateFormat('HH:mm').format(DateTime.now());
          OutTime = time;

          await attendanceService
              .markAttendanceOut(InTime, OutTime, Date, true, Month, Year)
              .then((value) async {
            if (value == "Success") {
              isLoading = false;
              isPresent = true;
              notifyListeners();

              toastMessage(context, "Marked!", "Attendance marked successfully",
                  ToastificationType.success);
            } else if (value.toString().contains("jwt expired")) {
              isLoading = false;
              notifyListeners();

              toastMessage(context, "Session Over!",
                  "Login Again And Try Again", ToastificationType.error);
            } else {
              isLoading = false;
              notifyListeners();

              toastMessage(context, "Error!", value, ToastificationType.error);
            }
          });
        }
      } else if (check == "Submitted") {
        isLoading = false;
        notifyListeners();

        toastMessage(
            context,
            "Cannot Mark",
            "Attendance Report Submitted for Today",
            ToastificationType.warning);
      } else {
        isLoading = false;
        notifyListeners();

        toastMessage(context, "Error!", check, ToastificationType.error);
      }
    } else {
      isLoading = false;
      notifyListeners();
      toastMessage(
          context,
          "Biometric Incomplete",
          "Complete Biometric to submit attendance",
          ToastificationType.warning);
    }
  }

  //* Verify if employee is in attendance radius
  void checkRadius(BuildContext context) async {
    if (!isPresent) {
      await LocationService.getLocation().then((value) async {
        if (value.toString().startsWith("Error")) {
          toastMessage(context, "Error", value, ToastificationType.error);
          print("Error is ${value}");
        } else {
          double Latitude1 = double.parse(value["latitude"]);
          double Longitude1 = double.parse(value["longitude"]);
          double Latitude2 = 0.0;
          double Longitude2 = 0.0;
          double radius = value["radius"];

          //* calculate the range if employee is in radius
          LocationPermission permission = await Geolocator.checkPermission();
          if (permission == LocationPermission.denied ||
              permission == LocationPermission.deniedForever) {
            // ignore: unused_local_variable
            LocationPermission ask = await Geolocator.requestPermission();
          } else {
            Position currentPosition = await Geolocator.getCurrentPosition(
                desiredAccuracy: LocationAccuracy.best);
            Latitude2 = currentPosition.latitude;
            Longitude2 = currentPosition.longitude;
          }

          double distance = Geolocator.distanceBetween(
              Latitude1, Longitude1, Latitude2, Longitude2);

          if (distance <= radius) {
            inRadius = true;
            notifyListeners();
            toastMessage(
              context,
              "Location verified",
              "Your are within office radius!!.",
              ToastificationType.success,
            );
          } else {
            inRadius = false;
            notifyListeners();
            toastMessage(
              context,
              "Stay Within Office Radius",
              "Please stay within the office range to mark your attendance.",
              ToastificationType.warning,
            );
          }
        }
      });
    } else {}
  }

  //* get attendance history list of employee
  Future<dynamic> fetchAttendanceList(BuildContext context) async {
    isLoadingList = true;
    notifyListeners();

    await employeeservice.getReport().then((value) {
      if (value == "Doesn't Exists") {
        attendanceRecords = [];

        isLoadingList = false;
        notifyListeners();
      } else if (value.toString().startsWith("Error")) {
        isLoadingList = false;
        notifyListeners();

        toastMessageError(context, "Error!", value.toString());
      } else {
        attendanceRecords = value;

        isLoadingList = false;
        notifyListeners();
      }
    });
  }
}
