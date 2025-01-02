import 'package:attend_ease/services/leaveService.dart';
import 'package:attend_ease/widgets/auth/otp_auth_widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class LeaveProvider extends ChangeNotifier {
  //* controllers for fields
  final TextEditingController LeaveTitleController = TextEditingController();
  final TextEditingController LeaveReasonController = TextEditingController();

  String Start_Date = "";
  String End_Date = "";

  //* Lists
  List<dynamic> leaveList = [];
  List<dynamic> Pending_List = [];
  List<dynamic> Approved_List = [];
  List<dynamic> Rejected_List = [];

  bool isLoadingReq = false;
  bool isLoadingApp = false;
  bool isLoadingList = false;

  final LeaveService leaveService = LeaveService();

  //* To assign dates
  void setStart_Date(String date) {
    Start_Date = date;
    notifyListeners();
  }

  void endStart_Date(String date) {
    End_Date = date;
    notifyListeners();
  }

//* request a leave
  void reqLeave(BuildContext context) async {
    if (LeaveTitleController.text.isNotEmpty &&
        LeaveReasonController.text.isNotEmpty) {
      isLoadingReq = true;
      notifyListeners();

      await leaveService
          .reqLeave(LeaveTitleController.text, Start_Date, End_Date, "Pending",
              LeaveReasonController.text)
          .then((value) {
        if (value == "Success") {
          isLoadingReq = false;
          notifyListeners();

          toastMessage(
              context,
              "Leave Requested",
              "Your Leave is Requested Successfully",
              ToastificationType.success);
        } else if (value.toString().startsWith('Error')) {
          isLoadingReq = false;
          notifyListeners();

          toastMessage(
              context, "Error", value.toString(), ToastificationType.error);
        } else {
          isLoadingReq = false;
          notifyListeners();

          toastMessage(
              context, "Warning", value.toString(), ToastificationType.warning);
        }
      });
    } else {
      toastMessage(context, "Empty Details!", "Please fill out all the fields",
          ToastificationType.warning);
    }
  }

//* approve or reject a leave
  void arLeave(
      BuildContext context, String Leave_Status, String Leave_ID) async {
    isLoadingApp = true;
    notifyListeners();

    await leaveService.arLeave(Leave_Status, Leave_ID).then((value) {
      if (value == "Success") {
        isLoadingApp = false;
        notifyListeners();

        toastMessageSuccess(context, "Success", 'Leave ${Leave_Status}');
      } else if (value.toString().startsWith("Error")) {
        isLoadingApp = false;
        notifyListeners();
        toastMessageError(context, "Error!", value.toString());
      } else {
        isLoadingApp = false;
        notifyListeners();

        toastMessage(context, "${Leave_Status} Error",
            "Cannot ${Leave_Status} Leave", ToastificationType.warning);
      }
    });
  }

//* fetch leaves HR
  void fetchLeavesHR(BuildContext context) async {
    isLoadingList = true;
    notifyListeners();

    await leaveService.get_list_HR().then((value) {
      if (value.toString().startsWith("Error")) {
        isLoadingList = false;
        notifyListeners();

        toastMessageError(context, "Error fetching leaves", value);
      } else {
        isLoadingList = false;
        notifyListeners();

        
      }
    });
  }

//*fetch leaves Employee
  void fetchLeavesEmployee(BuildContext context) async {
    isLoadingList = true;
    notifyListeners();
  }
}
