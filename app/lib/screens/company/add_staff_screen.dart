import 'package:attend_ease/providers/employee/employee_add_provider.dart';
import 'package:attend_ease/styling/colors.dart';
import 'package:attend_ease/globalobjects/variables.dart';
import 'package:attend_ease/styling/sizeconfig.dart';
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
    return Scaffold(
      appBar: appBStaff(context),
      body: SingleChildScrollView(child: Consumer<EmployeeAddProvider>(
        builder: (context, provider, _) {
          return Container(
            padding: EdgeInsets.symmetric(
                horizontal: 3.571 * SizeConfig.widthMultiplier),
            child: Column(
              children: [
                SizedBox(
                  height: 2.844 * SizeConfig.heightMultiplier,
                ),
                multipleWidget(),
                SizedBox(
                  height: 2.317 * SizeConfig.heightMultiplier,
                ),
                textFieldStaff("Enter Name", "Employee Name",
                    provider.employeeNameController, addEmployeeName),
                SizedBox(
                  height: 2.317 * SizeConfig.heightMultiplier,
                ),
                textFieldStaff("Employee", "Position",
                    provider.employeePositionController, addEmployeePosition),
                SizedBox(
                  height: 2.317 * SizeConfig.heightMultiplier,
                ),
                numberFieldStaff("Enter Phone Number", "Phone Number",
                    provider.employeeNumberController, addEmployeeNumber),
                SizedBox(
                  height: 2.844 * SizeConfig.heightMultiplier,
                ),
                addText(),
                SizedBox(
                  height: 25.175 * SizeConfig.heightMultiplier,
                ),
                provider.isLoading
                    ? SpinKitCircle(
                        color: Colours.BUTTON_COLOR_1,
                        size: 3.160 * SizeConfig.heightMultiplier,
                      )
                    : addEmployeeButton(() {
                        provider.addStaff(context);
                      }, context, "Add Employee")
              ],
            ),
          );
        },
      )),
    );
  }
}
