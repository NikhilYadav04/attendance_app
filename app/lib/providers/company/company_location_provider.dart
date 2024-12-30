import 'package:attend_ease/helper/helper_functions.dart';
import 'package:attend_ease/screens/company/company_hr_screen.dart';
import 'package:attend_ease/services/locationService.dart';
import 'package:attend_ease/widgets/auth/otp_auth_widgets.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:page_transition/page_transition.dart';
import 'package:toastification/toastification.dart';

class CompanyLocationProvider extends ChangeNotifier {
  final locationService LocationService = locationService();

  //* Variables for latitude and longitude
  var latitude = "Your Location Co-ordinates";
  var longitude = "";
  double sliderValue = 100.0;

  bool isLoading = false;

  //* change radius
  void changeRadius(double val) {
    sliderValue = val;
    notifyListeners();
  }

  //* Function to set latitude and longitude
  void setLocation(BuildContext context, String companyName) async {
    final connectivityStatus = await Connectivity().checkConnectivity();
    if (connectivityStatus[0] == ConnectivityResult.none ||
        connectivityStatus[0] == ConnectionState.none) {
      toastMessage(context, "No Internet!", "Check Your Internet Connection",
          ToastificationType.error);
    } else {
      bool isEnabled = await Geolocator.isLocationServiceEnabled();
      if (!isEnabled) {
        toastMessageError(context, "Error!", "Location Services Not Enabled");
      } else {
        LocationPermission permission = await Geolocator.checkPermission();
        if (permission == LocationPermission.denied ||
            permission == LocationPermission.deniedForever) {
          toastMessageError(context, "Error!", "Permission Denied");
          await Geolocator.requestPermission();
        } else {
          Position currentPosition = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.best);

          latitude = currentPosition.latitude.toString();
          longitude = currentPosition.longitude.toString();
          notifyListeners();

          if (latitude.isNotEmpty && longitude.isNotEmpty) {
            toastMessage(
                context,
                "Success",
                "Location co-ordinates set successfully",
                ToastificationType.success);
          } else {
            toastMessage(context, "Error", "Cannot Set Location co-ordinates",
                ToastificationType.warning);
          }
        }
      }
    }
  }

  //* Store Location
  void storeLocation(String companyName, BuildContext context) async {
    if (latitude.isNotEmpty && longitude.isNotEmpty) {
      isLoading = true;
      notifyListeners();

      final connectivityStatus = await Connectivity().checkConnectivity();
      if (connectivityStatus[0] == ConnectivityResult.none ||
          connectivityStatus[0] == ConnectionState.none) {
        isLoading = false;
        notifyListeners();

        toastMessage(context, "No Internet!", "Check Your Internet Connection",
            ToastificationType.error);
      } else {
        await LocationService.setLocation(
                latitude, longitude, sliderValue.toString())
            .then((value) async {
          if (value == "Stored") {
            await HelperFunctions.setLoggedInCompany(true);
            await HelperFunctions.setLoggedIn(true);
            await HelperFunctions.setLoggedInEmployee(false);
            latitude = "Your Location Co-ordinates";
            longitude = "";
            isLoading = false;
            notifyListeners();

            Navigator.pushAndRemoveUntil(
              context,
              PageTransition(
                child: CompanyHrScreen(),
                type: PageTransitionType.rightToLeft,
              ),
              (route) => false, // This removes all previous routes
            );
          } else {
            isLoading = false;
            notifyListeners();

            //* if jwt expires then
            if (value == "jwt expired") {
              toastMessage(
                  context,
                  "Error",
                  "Session Expired, Please Create Account Again",
                  ToastificationType.error);
            } else {
              toastMessage(context, "Error", value, ToastificationType.error);
            }
          }
        });
      }
    } else {
      toastMessage(context, "Empty Location", "Set the location before storing",
          ToastificationType.warning);
    }
  }
}
