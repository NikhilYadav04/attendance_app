import 'package:attend_ease/providers/company_setup_provider.dart';
import 'package:attend_ease/providers/otp_provider.dart';
import 'package:attend_ease/screens/home/home_screen.dart';
import 'package:attend_ease/styling/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // runApp(DevicePreview(enabled: !kReleaseMode, builder: (context) => MyApp()));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //* This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OtpProvider()),
        ChangeNotifierProvider(create: (_)=>CompanySetupProvider())
        ],
      child: LayoutBuilder(builder: (context, constraints) {
        SizeConfig().init(constraints);
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Attend Ease',
            home: HomeScreen());
      }),
    );
  }
}
