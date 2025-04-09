// ignore_for_file: constant_pattern_never_matches_value_type

import 'package:attend_ease/providers/attendance/company_attendance_provider.dart';
import 'package:attend_ease/providers/attendance/employee_attendance_provider.dart';
import 'package:attend_ease/providers/company/company_location_provider.dart';
import 'package:attend_ease/providers/company/company_login_provider.dart';
import 'package:attend_ease/providers/company/company_main_screen_provider.dart';
import 'package:attend_ease/providers/company/company_setup_provider.dart';
import 'package:attend_ease/providers/auth/otp_provider.dart';
import 'package:attend_ease/providers/employee/employee_add_provider.dart';
import 'package:attend_ease/providers/employee/employee_login_provider.dart';
import 'package:attend_ease/providers/employee/employee_main_screen_provider.dart';
import 'package:attend_ease/providers/initialize_provider.dart';
import 'package:attend_ease/providers/leave/leave_provider.dart';
import 'package:attend_ease/screens/auth/otp_auth_screen.dart';
import 'package:attend_ease/screens/company/company_hr_screen.dart';
import 'package:attend_ease/screens/employee/employee_main_screen.dart';
import 'package:attend_ease/styling/colors.dart';
import 'package:attend_ease/styling/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //* load the env
  await dotenv.load();
  //runApp(DevicePreview(enabled: !kReleaseMode, builder: (context) => MyApp()));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //* This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => InitializeProvider()),
        ChangeNotifierProvider(create: (_) => OtpProvider()),
        ChangeNotifierProvider(create: (_) => CompanySetupProvider()),
        ChangeNotifierProvider(create: (_) => CompanyLocationProvider()),
        ChangeNotifierProvider(create: (_) => CompanyLoginProvider()),
        ChangeNotifierProvider(create: (_) => EmployeeLoginProvider()),
        ChangeNotifierProvider(create: (_) => EmployeeAddProvider()),
        ChangeNotifierProvider(create: (_) => CompanyMainScreenProvider()),
        ChangeNotifierProvider(create: (_) => EmployeeMainScreenProvider()),
        ChangeNotifierProvider(create: (_) => EmployeeAttendanceProvider(),),
        ChangeNotifierProvider(create: (_) => CompanyAttendanceProvider(),),
        ChangeNotifierProvider(create: (_) => LeaveProvider(),),
      ],
      child: LayoutBuilder(builder: (context, constraints) {
        SizeConfig().init(constraints);
        return Consumer<InitializeProvider>(
          builder: (context, provider, _) {
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Attend Ease',
                home: _getLaunchScreen(provider));
          },
        );
      }),
    );
  }
}

Widget _getLaunchScreen(InitializeProvider provider) {
  return FutureBuilder<String>(
    future: provider.launchScreen(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return  Scaffold(
          body: Center(
            child: SpinKitFadingCircle(color: Colours.DARK_BLUE,size: 150,),
          ),
        );
      } else if (snapshot.hasError) {
        return const Scaffold(
          backgroundColor: Colours.BG,
          body: Center(
            child:
                Text('An error occurred while determining the launch screen.'),
          ),
        );
      } else {
        switch (snapshot.data) {
          case "HR":
            return const CompanyHrScreen();
          case "Employee":
            return const EmployeeMainScreen();
          default:
            return const OtpAuthScreen();
        }
      }
    },
  );
}
