import 'package:attend_ease/globalobjects/variables.dart';
import 'package:attend_ease/providers/employee/employee_add_provider.dart';
import 'package:attend_ease/styling/colors.dart';
import 'package:attend_ease/styling/scale.dart';
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
    final currentHeight = MediaQuery.of(context).size.height;
    final currentWidth = MediaQuery.of(context).size.width;
    final textScale = MediaQuery.of(context).textScaleFactor;
    return SafeArea(
      
      child: Scaffold(
        appBar: appBRemStaff(currentWidth, currentHeight, textScale, context),
      body: Consumer<EmployeeAddProvider>(
        builder: (context,provider,_){
          return SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 15 * horizontalPaddingFactor(currentWidth)),
              child: Column(
                children: [
                  SizedBox(
                    height:
                        responsiveContainerSize(25, currentWidth, currentHeight),
                  ),
                  textFieldStaff(
                      currentWidth,
                      currentHeight,
                      textScale,
                      "Enter Employee ID",
                      "Employee ID",
                      provider.employeeIDController,
                      addEmployeeName),
                  SizedBox(
                    height:
                        responsiveContainerSize(30, currentWidth, currentHeight),
                  ),
                  provider.isLoadingRem
                      ? SpinKitCircle(
                          color: Colours.BUTTON_COLOR_1,
                          size: 30,
                        )
                      : addEmployeeButton(() {
                          provider.RemStaff(context);
                        }, currentWidth, currentHeight, textScale, context,"Remove Employee Record")
                ],
              ),
            ),
        );
        },
        )
    ));
  }
}