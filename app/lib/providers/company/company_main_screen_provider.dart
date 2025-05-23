import 'package:attend_ease/helper/helper_functions.dart';
import 'package:attend_ease/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';

class CompanyMainScreenProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isProfile = false;
  String? profile_url = "";

  //* Logout Event
  void logoutCompany(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    await HelperFunctions.setLoggedIn(false);
    await HelperFunctions.setLoggedInCompany(false);
    await HelperFunctions.setLoggedInEmployee(false);
    await HelperFunctions.setCompanyToken("");
    await HelperFunctions.setEmployeeToken("");
    await HelperFunctions.setEmployeeName("");
    await HelperFunctions.setCompanyName("");
    await HelperFunctions.setProfilePhoto("");

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

  void uploadImageGalleryLocalStorage(BuildContext content) async {
    final XFile? _pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (_pickedFile == null) {
      return;
    } else {
      await HelperFunctions.setProfilePhoto(_pickedFile.path);
      profile_url = _pickedFile.path;
      notifyListeners();
    }
  }

   void uploadImageCameraLocalStorage(BuildContext content) async {
    final XFile? _pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (_pickedFile == null) {
      return;
    } else {
      await HelperFunctions.setProfilePhoto(_pickedFile.path);
      profile_url = _pickedFile.path;
      notifyListeners();
    }
  }
}


