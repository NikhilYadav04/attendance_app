import 'package:attend_ease/global/variables.dart';
import 'package:attend_ease/providers/employee/employee_add_provider.dart';
import 'package:attend_ease/styling/colors.dart';
import 'package:attend_ease/styling/sizeconfig.dart';
import 'package:attend_ease/widgets/company/add_staff_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class RemoveStaffScreen extends StatefulWidget {
  const RemoveStaffScreen({super.key});

  @override
  State<RemoveStaffScreen> createState() => _RemoveStaffScreenState();
}

class _RemoveStaffScreenState extends State<RemoveStaffScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar:
                appBRemStaff(context),
            body: Consumer<EmployeeAddProvider>(
              builder: (context, provider, _) {
                return SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 3.348*SizeConfig.widthMultiplier),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 2.844*SizeConfig.heightMultiplier,
                        ),
                        textFieldStaff("Enter Employee ID", "Employee ID",
                            provider.employeeIDController, addEmployeeName),
                        SizedBox(
                          height: 3.370*SizeConfig.heightMultiplier,
                        ),
                        provider.isLoadingRem
                            ? SpinKitCircle(
                                color: Colours.BUTTON_COLOR_1,
                                size: 3.1601*SizeConfig.heightMultiplier,
                              )
                            : addEmployeeButton(() {
                                provider.RemStaff(context);
                              }, context, "Remove Employee Record")
                      ],
                    ),
                  ),
                );
              },
            )));
  }
}
