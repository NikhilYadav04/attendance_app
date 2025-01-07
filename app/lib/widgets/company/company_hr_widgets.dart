import 'dart:io';

import 'package:attend_ease/helper/date_time_formatter.dart';
import 'package:attend_ease/styling/colors.dart';
import 'package:attend_ease/services/companyService.dart';
import 'package:attend_ease/styling/sizeconfig.dart';
import 'package:attend_ease/widgets/employee/employee_main_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

final companyService CompanyService = companyService();

List<String> images = [
  "assets/location_screen/add.png",
  "assets/location_screen/count.png",
  "assets/location_screen/list.png",
  "assets/location_screen/tasks.png"
];

List<String> title = [
  "Add And Remove Staff",
  "Check Staff Count",
  "Check Staff Report",
  "Monitor Leaves"
];

List subtitle = [
  "Add or remove an employee's attendance account",
  "View the daily staff attendance count summary.",
  "View each employee's monthly attendance report.",
  "Approve or decline employee leave requests."
];

DateTime now = DateTime.now();

Widget appBtitleHR(
    String? companyName,
    BuildContext context,
    void Function() fun1,
    void Function() fun2,
    bool isProfile,
    String? profile) {
  return AppBar(
    title: Row(
      children: [
        GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(actions: [
                    Container(
                        height: 29.494 * SizeConfig.heightMultiplier,
                        width: 75.892 * SizeConfig.widthMultiplier,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1)),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 2.1067 * SizeConfig.heightMultiplier,
                            ),
                            Text(
                              "Upload Your Profile Picture",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Kumbh-Med",
                                  fontSize:
                                      2.5280 * SizeConfig.heightMultiplier,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 2.6334 * SizeConfig.heightMultiplier,
                            ),
                            Container(
                              height: 18.9607 * SizeConfig.heightMultiplier,
                              width: 66.96428 * SizeConfig.widthMultiplier,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      0.5266 * SizeConfig.heightMultiplier),
                                  border: Border.all(
                                      color: Colors.black,
                                      width: 2,
                                      style: BorderStyle.solid)),
                              child: isProfile
                                  ? SpinKitCircle(
                                      color: Colours.DARK_BLUE,
                                      size:
                                          2.10674 * SizeConfig.heightMultiplier,
                                    )
                                  : Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 3.3482 *
                                              SizeConfig.widthMultiplier,
                                          vertical: 1.58006 *
                                              SizeConfig.heightMultiplier),
                                      child: Column(
                                        children: [
                                          buttonPic("Pick From Gallery  ",
                                              Icons.photo, fun2),
                                          SizedBox(
                                            height: 2.1067 *
                                                SizeConfig.heightMultiplier,
                                          ),
                                          buttonPic("Click From Camera",
                                              Icons.camera_alt, fun1)
                                        ],
                                      ),
                                    ),
                            )
                          ],
                        )),
                  ]);
                });
          },
          child: isProfile
              ? SpinKitCircle(
                  color: Colours.DARK_BLUE,
                  size: 2.1067 * SizeConfig.heightMultiplier,
                )
              : profile == ""
                  ? Icon(
                      Icons.account_circle_sharp,
                      color: Colors.grey.shade800,
                      size: 3.5814 * SizeConfig.heightMultiplier,
                    )
                  : CircleAvatar(
                      radius: 2.6334 * SizeConfig.heightMultiplier,
                      backgroundImage: FileImage(File(profile.toString())),
                    ),
        ),
        SizedBox(
          width: 2.9017 * SizeConfig.widthMultiplier,
        ),
        Text(
          "${companyName}",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 2.6334 * SizeConfig.heightMultiplier),
        ),
      ],
    ),
  );
}

Widget attendCountWidget(void Function() ontap, String inCount, String outCount,
    String Total, String Date, bool isSubmit) {
  return Container(
    height: 23.6475 * SizeConfig.heightMultiplier,
    decoration: BoxDecoration(
      borderRadius:
          BorderRadius.circular(0.63202 * SizeConfig.heightMultiplier),
      gradient: const LinearGradient(
        colors: [
          Colours.GRADIENT_1,
          Colours.GRADIENT_2,
          Colours.GRADIENT_1,
        ],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
    ),
    child: Center(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: 10.49108 * SizeConfig.widthMultiplier,
                vertical: 1.15871 * SizeConfig.heightMultiplier),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    rowCOntent("In", inCount),
                    rowCOntent("Out", outCount),
                    rowCOntentDate("Date", Date)
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 1.2640 * SizeConfig.heightMultiplier),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: 3.7946 * SizeConfig.widthMultiplier),
            child: Divider(
              color: Colors.grey.shade300,
              height: 1,
            ),
          ),
          SizedBox(
            height: 1.053 * SizeConfig.heightMultiplier,
          ),
          rowContent2(ontap, Total, isSubmit),
        ],
      ),
    ),
  );
}

Widget rowCOntent(String title, String Count) {
  return Column(
    children: [
      Text(
        title,
        style: TextStyle(
            color: Colors.white,
            fontFamily: "Tansek",
            fontSize: 4.10816 * SizeConfig.heightMultiplier),
      ),
      SizedBox(
        height: 1.2633 * SizeConfig.heightMultiplier,
      ),
      Text(
        "$Count",
        style: GoogleFonts.aDLaMDisplay(
            color: Colors.white,
            fontSize: 3.3707 * SizeConfig.heightMultiplier),
      )
    ],
  );
}

Widget rowCOntentDate(String title, String date) {
  return Column(
    children: [
      Text(
        title,
        style: TextStyle(
            color: Colors.white,
            fontFamily: "Tansek",
            fontSize: 4.1081 * SizeConfig.heightMultiplier),
      ),
      SizedBox(
        height: 1.3693 * SizeConfig.heightMultiplier,
      ),
      Text(
        date,
        style: GoogleFonts.aDLaMDisplay(
            color: Colors.white,
            fontSize: 3.26548 * SizeConfig.heightMultiplier),
      )
    ],
  );
}

Widget rowContent2(void Function() ontap, String Total, bool isSubmit) {
  return Container(
    padding:
        EdgeInsets.symmetric(horizontal: 4.24107 * SizeConfig.widthMultiplier),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Total Staff - ${Total}",
          style: TextStyle(
              color: Colors.white,
              fontFamily: "Tansek",
              fontSize: 3.47613 * SizeConfig.heightMultiplier),
        ),
        GestureDetector(
          onTap: isSubmit ? () {} : ontap,
          child: Text(
            isSubmit ? "Submitted" : "Submit Attendance  >",
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Tansek",
                fontSize: 3.47613 * SizeConfig.heightMultiplier),
          ),
        )
      ],
    ),
  );
}

Widget floatButton(BuildContext context, IconData icon, void Function() onTap) {
  return Container(
    height: 7.16294 * SizeConfig.heightMultiplier,
    width: 17.4107 * SizeConfig.widthMultiplier,
    child: FloatingActionButton(
        shape: CircleBorder(),
        elevation: 2,
        backgroundColor: Colours.GRADIENT_2,
        onPressed: onTap,
        child: Center(
          child: Icon(
            icon,
            color: Colors.white,
            size: 3.7 * SizeConfig.heightMultiplier,
          ),
        )),
  );
}

Widget listWidget(BuildContext context) {
  return Column(
    children: [
      Container(
        height: 44.2417 * SizeConfig.heightMultiplier,
        child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  SizedBox(
                    height: 1.053 * SizeConfig.heightMultiplier,
                  ),
                  ListTile(
                    leading: Image.asset(
                      images[index],
                      height: 4.0028 * SizeConfig.heightMultiplier,
                      width: 8.4821 * SizeConfig.widthMultiplier,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 2.1067 * SizeConfig.heightMultiplier,
                    ),
                    title: Text(
                      title[index],
                      style: GoogleFonts.notoSansOldHungarian(
                          color: Colors.black,
                          fontSize: 2 * SizeConfig.heightMultiplier,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(subtitle[index],
                        style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 1.65 * SizeConfig.heightMultiplier,
                        )),
                  ),
                  SizedBox(
                    height: 1.26404 * SizeConfig.heightMultiplier,
                  ),
                  Divider(
                    indent: 10,
                    endIndent: 10,
                    color: Colors.grey.shade300,
                    height: 5,
                    thickness: 2,
                  ),
                ],
              );
            }),
      ),
    ],
  );
}

Widget approveTextEmployee(String text) {
  return Center(
    child: Text(text,
        style: GoogleFonts.montserrat(
          color: Colors.grey.shade900,
          fontWeight: FontWeight.bold,
          fontSize: 4.00282 * SizeConfig.heightMultiplier,
        )),
  );
}

Widget listApproval(BuildContext context, List<dynamic> staffList) {
  return Column(
    children: [
      ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: staffList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 2.2321 * SizeConfig.widthMultiplier,
                  vertical: 1.2640 * SizeConfig.heightMultiplier),
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 3.3482 * SizeConfig.widthMultiplier,
                    vertical: 1.3693 * SizeConfig.heightMultiplier),
                height: 14.7472 * SizeConfig.heightMultiplier,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                        1.053 * SizeConfig.heightMultiplier),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade700,
                          spreadRadius: 1.5,
                          blurRadius: 2)
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateTimeFormatter.formatDate(
                          staffList[index]["currentDate"]),
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 2.5280 * SizeConfig.heightMultiplier,
                      ),
                    ),
                    SizedBox(
                      height: 1.8960 * SizeConfig.heightMultiplier,
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            boxIcon(Icons.group),
                            SizedBox(
                              width: 2.2321 * SizeConfig.widthMultiplier,
                            ),
                            Text("Total Staff Present : ",
                                style: GoogleFonts.montserrat(
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      2.42283 * SizeConfig.heightMultiplier,
                                )),
                            SizedBox(
                              width: 2.2321 * SizeConfig.widthMultiplier,
                            ),
                            Text("${staffList[index]["totalCount"]}",
                                style: GoogleFonts.montserrat(
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      2.5280 * SizeConfig.heightMultiplier,
                                )),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          })
    ],
  );
}

Widget staffText(String text) {
  return Center(
    child: Text(text,
        style: GoogleFonts.montserrat(
          color: Colors.grey.shade900,
          fontWeight: FontWeight.bold,
          fontSize: 3.89748 * SizeConfig.heightMultiplier,
        )),
  );
}

// Widget VideoCallField(double width, double height, double textScale,
//     String title, TextEditingController controller) {
//   return TextField(
//     controller: controller,
//     decoration: InputDecoration(
//       labelText: title,
//       labelStyle: TextStyle(
//           color: Colors.grey.shade800,
//           fontWeight: FontWeight.bold,
//           fontSize: responsiveFontSize(20, width, height, textScale)),
//       enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: Colors.grey.shade800),
//           borderRadius:
//               BorderRadius.circular(responsiveBorderRadius(4, width, height))),
//       border: OutlineInputBorder(
//           borderSide: const BorderSide(color: Colours.BUTTON_COLOR_1),
//           borderRadius:
//               BorderRadius.circular(responsiveBorderRadius(4, width, height))),
//     ),
//   );
// }

// Widget VideoCallJoinButton(
//     double width, double height, double textScale, void Function() onTap) {
//   return ElevatedButton(
//       style: ButtonStyle(
//           backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
//       onPressed: onTap,
//       child: Center(
//           child: Text(
//         "Join",
//         style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//             fontSize: responsiveFontSize(20, width, height, textScale)),
//       )));
// }
