import 'package:attend_ease/providers/employee/employee_add_provider.dart';
import 'package:attend_ease/styling/colors.dart';
import 'package:attend_ease/styling/scale.dart';
import 'package:attend_ease/globalobjects/variables.dart';
import 'package:attend_ease/widgets/company/add_staff_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class AddStaffScreen extends StatefulWidget {
  const AddStaffScreen({super.key});

  @override
  State<AddStaffScreen> createState() => _AddStaffScreenState();
}

class _AddStaffScreenState extends State<AddStaffScreen> {
  @override
  Widget build(BuildContext context) {
    final currentHeight = MediaQuery.of(context).size.height;
    final currentWidth = MediaQuery.of(context).size.width;
    final textScale = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      appBar: appBStaff(currentWidth, currentHeight, textScale, context),
      body: SingleChildScrollView(child: Consumer<EmployeeAddProvider>(
        builder: (context, provider, _) {
          return Container(
            padding: EdgeInsets.symmetric(
                horizontal: 15 * horizontalPaddingFactor(currentWidth)),
            child: Column(
              children: [
                SizedBox(
                  height:
                      responsiveContainerSize(25, currentWidth, currentHeight),
                ),
                multipleWidget(currentWidth, currentHeight, textScale),
                SizedBox(
                  height:
                      responsiveContainerSize(20, currentWidth, currentHeight),
                ),
                textFieldStaff(
                    currentWidth,
                    currentHeight,
                    textScale,
                    "Enter Name",
                    "Employee Name",
                    provider.employeeNameController,
                    addEmployeeName),
                SizedBox(
                  height:
                      responsiveContainerSize(20, currentWidth, currentHeight),
                ),
                textFieldStaff(
                    currentWidth,
                    currentHeight,
                    textScale,
                    "Employee",
                    "Position",
                    provider.employeePositionController,
                    addEmployeePosition),
                SizedBox(
                  height:
                      responsiveContainerSize(20, currentWidth, currentHeight),
                ),
                numberFieldStaff(
                    currentWidth,
                    currentHeight,
                    textScale,
                    "Enter Phone Number",
                    "Phone Number",
                    provider.employeeNumberController,
                    addEmployeeNumber),
                SizedBox(
                  height:
                      responsiveContainerSize(25, currentWidth, currentHeight),
                ),
                addText(currentWidth, currentHeight, textScale),
                SizedBox(
                  height:
                      responsiveContainerSize(210, currentWidth, currentHeight),
                ),
                provider.isLoading
                    ? SpinKitCircle(
                        color: Colours.BUTTON_COLOR_1,
                        size: 30,
                      )
                    : addEmployeeButton(() {
                        provider.addStaff(context);
                      }, currentWidth, currentHeight, textScale, context)
              ],
            ),
          );
        },
      )),
    );
  }
}
