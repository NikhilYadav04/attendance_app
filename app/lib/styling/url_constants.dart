//pc ip address
import 'package:flutter_dotenv/flutter_dotenv.dart';

final PC_IP = "${dotenv.get('PC_IP')}";
final PC_IP2 = "${dotenv.get('PC_IP2')}";

final url = dotenv.get("URL");

//*  OTP Verification
final send_OTP_baseUrl = "${url}/api/send-otp";
final verify_OTP_baseUrl = "${url}/api/verify-otp";

//* company setup
final add_company_baseUrl = "${url}/company/add-company";
final login_company_baseUrl = "${url}/company/login-company";

//*  set location
final set_location_baseUrl = "${url}/location/store-location";

//* get location
final get_location_baseUrl = "${url}/location/get-location";

//* employee add and setup
final add_employee_baseURl = "${url}/employee/add-employee";
final remove_employee_baseURl = "${url}/employee/remove-employee";
final login_employee_baseURl = "${url}/employee/join-employee";

//* mark attendance
final mark_attendance_url_in = "${url}/attendance/mark-in";
final mark_attendance_url_out = "${url}/attendance/mark-out";

//* get attendance
final get_attendance_url = "${url}/attendance/get-attend";
final get_attendance_days_url = "${url}/attendance/get-attend-days";

//* get report
final report_employee_baseURl = "${url}/employee/get-history";
final report_company_baseURl = "${url}/company/get-report";

//* get count
final staff_count = "${url}/employee/get-count";
final staff_change_count = "${url}/employee/change-count";

//* staff history count
final store_staff_history = "${url}/company/store-history";
final get_staff_history = "${url}/company/get-history";
final staff_list_history = "${url}/company/history-list";

//* whatsapp notification
final notify = "${url}/company/send-notifications";

//*  leaves
final req_leave_url = "${url}/leave/request-leave";
final ar_leave_url = "${url}/leave/ar_leave";
final fetch_leave_HR = "${url}/leave/fetch-leaves-HR";
final fetch_leave_employee = "${url}/leave//fetch-leaves-employee";

//*  profile pic
final upload_url = "${url}/employee/upload";
final get_image_url = "${url}/employee/get-profile";
