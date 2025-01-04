import 'dart:io';

import 'package:attend_ease/helper/helper_functions.dart';
import 'package:attend_ease/screens/home/home_screen.dart';
import 'package:attend_ease/services/employeeService.dart';
import 'package:attend_ease/widgets/auth/otp_auth_widgets.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:toastification/toastification.dart';

class EmployeeMainScreenProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isProfile = false;
  String profile_url = "";
  final Employeeservice employeeservice = Employeeservice();

  //* Logout Event
  void logoutEmployee(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    await HelperFunctions.setLoggedIn(false);
    await HelperFunctions.setLoggedInCompany(false);
    await HelperFunctions.setLoggedInEmployee(false);
    await HelperFunctions.setCompanyToken("");
    await HelperFunctions.setEmployeeToken("");
    await HelperFunctions.setEmployeeName("");
    await HelperFunctions.setCompanyName("");

    isLoading = false;
    notifyListeners();

    Navigator.pushAndRemoveUntil(
        context,
        PageTransition(
          child: HomeScreen(),
          type: PageTransitionType.fade,
        ),
        (Route<dynamic> route) => false);
  }

  //* get the image
  void getProfilePic(BuildContext context) async {
    isProfile = true;
    notifyListeners();

    await employeeservice.getProfilePic().then((value) {
      print("Value isssssss ${value}");
      if (value.toString().startsWith("Error")) {
        isProfile = false;
        notifyListeners();

        profile_url = "";
        toastMessageError(context, "Cannot Get Profile Pic", value);
      } else {
        profile_url = value;
        isProfile = false;
        notifyListeners();
      }
    });
  }

  //* upload image
  void uploadImageGallery(BuildContext context) async {
    isProfile = true;
    notifyListeners();

    final connectivityStatus = await Connectivity().checkConnectivity();
    if (connectivityStatus[0] == ConnectivityResult.none ||
        connectivityStatus[0] == ConnectionState.none) {
      isProfile = false;
      notifyListeners();
      profile_url = "";

      toastMessage(context, "No Internet!", "Check Your Internet Connection",
          ToastificationType.error);
    } else {
      final _pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (_pickedImage == null) {
        isProfile = false;
        notifyListeners();
        profile_url = "";
        return;
      } else {
        File image = File(_pickedImage.path);

        await employeeservice.uploadProfilePic(image).then((value) {
          if (value.toString().startsWith("Error")) {
            isProfile = false;
            notifyListeners();
            profile_url = "";

            toastMessageError(
                context, "Cannot Upload", "Profile Pic Not Uploaded");
          } else {
            profile_url = value;

            isProfile = false;
            notifyListeners();
          }
        });
      }
    }
  }

  void uploadImageCamera(BuildContext context) async {
    isProfile = true;
    notifyListeners();

    final connectivityStatus = await Connectivity().checkConnectivity();
    if (connectivityStatus[0] == ConnectivityResult.none ||
        connectivityStatus[0] == ConnectionState.none) {
      profile_url = "";
      isProfile = false;
      notifyListeners();

      toastMessage(context, "No Internet!", "Check Your Internet Connection",
          ToastificationType.error);
    } else {
      final _pickedImage =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (_pickedImage == null) {
        profile_url = "";
        isProfile = false;
        notifyListeners();
        return;
      } else {
        File image = File(_pickedImage.path);

        await employeeservice.uploadProfilePic(image).then((value) {
          if (value.toString().startsWith("Error")) {
            profile_url = "";
            isProfile = false;
            notifyListeners();

            toastMessageError(
                context, "Cannot Upload", "Profile Pic Not Uploaded");
          } else {
            profile_url = value;

            isProfile = false;
            notifyListeners();
          }
        });
      }
    }
  }
}
