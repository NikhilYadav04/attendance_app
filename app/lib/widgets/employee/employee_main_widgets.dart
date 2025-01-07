import 'dart:io';

import 'package:attend_ease/helper/date_time_formatter.dart';
import 'package:attend_ease/styling/colors.dart';
import 'package:attend_ease/styling/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

List<String> imagesEmployee = [
  "assets/location_screen/face.png",
  "assets/location_screen/group.png",
  "assets/location_screen/list.png",
];

List<String> titleEmployee = [
  "Mark Attendance",
  "Check Attendance History",
  "Manage Leaves",
];

List subtitleEmployee = [
  "Stay within the office radius to mark today's attendance",
  "Check your In-Time and Out-Time history for each day.",
  "View your leave history and remaining leave count.",
];

Widget appBartitle(
    String? employeeName,
    BuildContext context,
    void Function() fun1,
    void Function() fun2,
    bool isProfile,
    String? profile) {
  return Row(
    children: [
      GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(actions: [
                    Container(
                        height: 29.4944*SizeConfig.heightMultiplier,
                        width: 75.8928*SizeConfig.widthMultiplier,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1)),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 2.10678*SizeConfig.heightMultiplier,
                            ),
                            Text(
                              "Upload Your Profile Picture",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Kumbh-Med",
                                  fontSize: 2.528098*SizeConfig.heightMultiplier,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 2.63343*SizeConfig.heightMultiplier,
                            ),
                            Container(
                              height:18.96078*SizeConfig.heightMultiplier,
                              width: 66.9642*SizeConfig.widthMultiplier,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(0.52668*SizeConfig.heightMultiplier),
                                  border: Border.all(
                                      color: Colors.black,
                                      width: 2,
                                      style: BorderStyle.solid)),
                              child: isProfile
                                  ? SpinKitCircle(
                                      color: Colours.DARK_BLUE,
                                      size: 2.10674*SizeConfig.heightMultiplier,
                                    )
                                  : Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 3.34821*SizeConfig.widthMultiplier, vertical: 1.58006*SizeConfig.heightMultiplier),
                                      child: Column(
                                        children: [
                                          buttonPic("Pick From Gallery  ",
                                              Icons.photo, fun2),
                                          SizedBox(
                                            height: 2.10674*SizeConfig.heightMultiplier,
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
                  size: 2.10674*SizeConfig.heightMultiplier,
                )
              : profile == ""
                  ? Icon(
                      Icons.account_circle_sharp,
                      color: Colors.grey.shade800,
                      size: 3.581473*SizeConfig.heightMultiplier,
                    )
                  : CircleAvatar(
                      radius: 2.63343*SizeConfig.heightMultiplier,
                      backgroundImage: FileImage(File(profile.toString())),
                    )),
      SizedBox(
        width: 2.67857*SizeConfig.widthMultiplier,
      ),
      Text(
        "${employeeName}",
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 2.6334*SizeConfig.heightMultiplier),
      ),
    ],
  );
}



Widget upperBar(BuildContext context, String Date, String status) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border(
        bottom: BorderSide(
          color: Colors.red, // Choose your color here
          width: 1.1160*SizeConfig.widthMultiplier, // Choose the width of the border
        ),
      ),
    ),
    padding: EdgeInsets.symmetric(
        horizontal: 2.23214*SizeConfig.widthMultiplier ,
        vertical: 0.5266*SizeConfig.heightMultiplier),
    height: 12.6404*SizeConfig.heightMultiplier,
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Mark Your Attendance",
                style: GoogleFonts.notoSansOldHungarian(
                  color: Colors.grey.shade900,
                  fontWeight: FontWeight.bold,
                  fontSize: 2.52809*SizeConfig.heightMultiplier,
                )),
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  0.6320*SizeConfig.heightMultiplier)),
                          backgroundColor: Colours.BUTTON_COLOR_2,
                          title: Center(
                            child: Text(
                              "Stay Within Radius",
                              style: GoogleFonts.notoSansOldHungarian(
                                  fontSize: 2.89677*SizeConfig.heightMultiplier,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          content: Container(
                            height: 14.7472*SizeConfig.heightMultiplier,
                            child: Center(
                              child: Text(
                                "Please stay within 100 to 500 m from office location otherwise you will be not able to mark attendance . ",
                                style: GoogleFonts.notoSansOldHungarian(
                                    fontSize: 2.0540*SizeConfig.heightMultiplier,
                                    color: Colors.grey.shade800,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        );
                      });
                },
                icon: Icon(
                  Icons.help,
                  size: 3.6341*SizeConfig.heightMultiplier,
                )),
          ],
        ),
        SizedBox(
          height: 1.8434*SizeConfig.heightMultiplier,
        ),
        dateWidget(Date, status)
      ],
    ),
  );
}

Widget dateWidget( String Date, String status) {
  return Center(
    child: RichText(
      text: TextSpan(
        text: '${Date} ',
        style: GoogleFonts.notoSansOldHungarian(
          color: Colors.grey.shade900,
          fontWeight: FontWeight.w600,
          fontSize: 2.4227* SizeConfig.heightMultiplier,
        ),
        children: <TextSpan>[
          TextSpan(
            text: status,
            style: GoogleFonts.notoSansOldHungarian(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 2.4227*SizeConfig.heightMultiplier,
            ),
          )
        ],
      ),
    ),
  );
}

Widget cameraAuthenticate(void Function() onTap, BuildContext context, bool isAuthenticate, Text text) {
  return Container(
    decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.red, width: 5))),
    padding: EdgeInsets.symmetric(
        horizontal: 1.11607*SizeConfig.widthMultiplier,
        vertical:1.58008 * SizeConfig.heightMultiplier),
    child: Column(
      children: [
        SizedBox(
          height: 7.37362 * SizeConfig.heightMultiplier,
        ),
        Center(
          child: Image.asset(
            "assets/home_screen/biom.png",
            height: 15.8006*SizeConfig.heightMultiplier,
            width: 33.4821* SizeConfig.widthMultiplier,
          ),
        ),
        SizedBox(
          height: 2.3174* SizeConfig.heightMultiplier,
        ),
        cameraButton(onTap, context),
        SizedBox(
          height:2.3174* SizeConfig.heightMultiplier,
        ),
        text,
        SizedBox(
          height: 11.3*SizeConfig.heightMultiplier,
        ),
      ],
    ),
  );
}

Widget attendButtonIn(
    void Function() onTap,) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 10.2177 * SizeConfig.heightMultiplier,
      color: Colors.grey.shade900,
      child: buttonWIdget(onTap, "Punch In"),
    ),
  );
}

Widget attendButtonOut(
    void Function() onTap,) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 10.2177 * SizeConfig.heightMultiplier,
      color: Colors.grey.shade900,
      child: buttonWIdget(onTap, "Punch Out"),
    ),
  );
}

Widget buttonWIdget(
  void Function() onTap,
  String title,
) {
  return InkWell(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.symmetric(
          horizontal: 4.4642* SizeConfig.widthMultiplier ,
          vertical: 2.10674 * SizeConfig.heightMultiplier ),
      padding: EdgeInsets.symmetric(
          horizontal: 3.5714 * SizeConfig.widthMultiplier,
          vertical: 0.5266 * SizeConfig.heightMultiplier ),
      height: 3.3707*SizeConfig.heightMultiplier,
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(2),
          color: Colours.BUTTON_COLOR_1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
                color: Colors.white,
                fontSize:
                    2.42276* SizeConfig.heightMultiplier,
                fontWeight: FontWeight.bold),
          ),
          IconButton(
            icon: Icon(
              Icons.back_hand,
              color: Colors.white,
              size: 2.42276 * SizeConfig.heightMultiplier,
            ),
            onPressed: () {},
          )
        ],
      ),
    ),
  );
}

Widget locationWidget(String text) {
  return Container(
    height: 6.9522*SizeConfig.heightMultiplier,
    color: Colors.blue.shade300,
    child: Center(
      child: Text(
        text,
        style: TextStyle(
            color: Colors.black,
            fontSize: 2.4754*SizeConfig.heightMultiplier,
            fontWeight: FontWeight.bold),
      ),
    ),
  );
}





Widget attendanceReport(BuildContext context, List<dynamic> report) {
  print("List is ${report}");
  return Column(
    children: [
      ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: report.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.2321* SizeConfig.widthMultiplier, vertical: 1.2640*SizeConfig.heightMultiplier),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 3.3482*SizeConfig.widthMultiplier, vertical: 1.369*SizeConfig.heightMultiplier),
                height: 14.747*SizeConfig.heightMultiplier,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(1.0533*SizeConfig.heightMultiplier),
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
                      DateTimeFormatter.formatDate(report[index]["Date"]),
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 2.5280*SizeConfig.heightMultiplier,
                      ),
                    ),
                    SizedBox(
                      height: 1.8960*SizeConfig.heightMultiplier,
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            boxIcon(Icons.logout),
                            SizedBox(
                              width: 2.2321*SizeConfig.widthMultiplier,
                            ),
                            Text(
                                DateTimeFormatter.formatTime(
                                    report[index]["InTime"]),
                                style: GoogleFonts.montserrat(
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 2.42276*SizeConfig.heightMultiplier,
                                )),
                          ],
                        ),
                        SizedBox(
                          width: 5.58035*SizeConfig.widthMultiplier,
                        ),
                        Row(
                          children: [
                            boxIcon(Icons.logout),
                            SizedBox(
                              width: 2.2321*SizeConfig.widthMultiplier,
                            ),
                            Text(
                                DateTimeFormatter.formatTime(
                                    report[index]["OutTime"]),
                                style: GoogleFonts.montserrat(
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.bold,
                                  fontSize:2.4228*SizeConfig.heightMultiplier,
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

Widget boxIcon(IconData icon) {
  return Container(
    height: 55,
    width: 55,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: Colours.BUTTON_COLOR_2,
    ),
    child: Center(
      child: Icon(
        icon,
        size: 30,
        color: Colours.BUTTON_COLOR_1,
      ),
    ),
  );
}

Widget attendCountWidgetEmployee(String? InTime, String? OutTime, String? Status, String Date) {
  return Container(
    height: 22.6475*SizeConfig.heightMultiplier,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(0.6320*SizeConfig.heightMultiplier),
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
                horizontal: 10.044*SizeConfig.widthMultiplier ,
                vertical: 1.053*SizeConfig.heightMultiplier),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    rowCOntentEmployee1( "In", InTime),
                    rowCOntentEmployee(
                         "Out", OutTime),
                    rowCOntentEmployee(
                        "Status", Status)
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 1.2114*SizeConfig.heightMultiplier,
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: 3.34821*SizeConfig.widthMultiplier),
            child: Divider(
              color: Colors.grey.shade300,
              height: 1,
            ),
          ),
          SizedBox(
            height: 1.15871*SizeConfig.heightMultiplier,
          ),
          rowContentEMployee2( Date),
        ],
      ),
    ),
  );
}

Widget rowCOntentEmployee(
    String title, String? status) {
  return Column(
    children: [
      Text(
        title,
        style: TextStyle(
            color: Colors.white,
            fontFamily: "Tansek",
            fontSize: 4.0028*SizeConfig.heightMultiplier),
      ),
      SizedBox(
        height:1.369*SizeConfig.heightMultiplier,
      ),
      Text(
        "${status}",
        style: GoogleFonts.aDLaMDisplay(
            color: Colors.white,
            fontSize:3.0547*SizeConfig.heightMultiplier),
      )
    ],
  );
}

Widget rowCOntentEmployee1(
    String title, String? status) {
  return Column(
    children: [
      Text(
        "${title}",
        style: TextStyle(
            color: Colors.white,
            fontFamily: "Tansek",
            fontSize: 4.0028*SizeConfig.heightMultiplier),
      ),
      SizedBox(
        height: 1.3698*SizeConfig.heightMultiplier,
      ),
      Text(
        "${status}",
        style: GoogleFonts.aDLaMDisplay(
            color: Colors.white,
            fontSize: 3.0547*SizeConfig.heightMultiplier),
      )
    ],
  );
}

Widget rowContentEMployee2(
     String? Date) {
  return Container(
    padding:
        EdgeInsets.symmetric(horizontal: 4.01785*SizeConfig.widthMultiplier ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            "Today's Date : ${Date}",
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Tansek",
                fontSize: 3.47613*SizeConfig.heightMultiplier),
          ),
        )
      ],
    ),
  );
}

Widget listWidgetEMployee( BuildContext context) {
  return Column(
    children: [
      Container(
        height: 39.5015*SizeConfig.heightMultiplier,
        child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  SizedBox(
                    height: 1.053*SizeConfig.heightMultiplier,
                  ),
                  ListTile(
                    leading: Image.asset(
                      imagesEmployee[index],
                      height: 4.21349*SizeConfig.heightMultiplier,
                      width:8.92857* SizeConfig.widthMultiplier,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 2.10674*SizeConfig.heightMultiplier,
                    ),
                    title: Text(
                      titleEmployee[index],
                      style: GoogleFonts.notoSansOldHungarian(
                          color: Colors.black,
                          fontSize:
                             2.1*SizeConfig.heightMultiplier,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(subtitleEmployee[index],
                        style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize:
                             1.6853*SizeConfig.heightMultiplier,
                        )),
                  ),
                  SizedBox(
                    height: 1.264048*SizeConfig.heightMultiplier,
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

Widget companyButtonEmployee(void Function() onTap, BuildContext context) {
  return InkWell(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.symmetric(
        horizontal: 2.23214*SizeConfig.widthMultiplier ,
      ),
      padding: EdgeInsets.symmetric(
          horizontal:1.11607*SizeConfig.widthMultiplier ,
          vertical:0.526688 * SizeConfig.heightMultiplier),
      height: 6.3202468 * SizeConfig.heightMultiplier,
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(0.6320248 * SizeConfig.heightMultiplier),
          color: Colours.BUTTON_COLOR_1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Request Office Leave",
            style: TextStyle(
                color: Colors.white,
                fontSize:
                   2.52809 * SizeConfig.heightMultiplier,
                fontWeight: FontWeight.bold),
          ),
          IconButton(
            icon: Icon(
              Icons.calendar_month_rounded,
              color: Colors.white,
              size: 3.370798 * SizeConfig.heightMultiplier,
            ),
            onPressed: () {},
          )
        ],
      ),
    ),
  );
}

Widget attendCompleteText() {
  return Container(
    height: 10.1123*SizeConfig.heightMultiplier,
    color: Colors.grey.shade900,
    child: Center(
      child: Text(
        "Your Attendance for Today Is Complete",
        style: TextStyle(
            color: Colors.white,
            fontSize: 2.47543*SizeConfig.heightMultiplier,
            fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget cameraButton(void Function() onTap, BuildContext context) {
  return InkWell(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20.5357*SizeConfig.widthMultiplier,
      ),
      padding: EdgeInsets.symmetric(
          horizontal: 1.1160* SizeConfig.widthMultiplier ,
          vertical: 0.526688  * SizeConfig.heightMultiplier ),
      height: 5.6882*SizeConfig.heightMultiplier,
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(1.053 * SizeConfig.heightMultiplier),
          color: Colours.BUTTON_COLOR_1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Authenticate",
            style: TextStyle(
                color: Colors.white,
                fontSize:
                    2.6334 * SizeConfig.heightMultiplier,
                fontWeight: FontWeight.bold),
          ),
          IconButton(
            icon: Icon(
              Icons.camera,
              color: Colors.white,
              size: 2.7387 * SizeConfig.heightMultiplier,
            ),
            onPressed: () {},
          )
        ],
      ),
    ),
  );
}

Widget buttonPic(String title, IconData icon, void Function() onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 13.3928*SizeConfig.heightMultiplier,
      width: 58.035*SizeConfig.widthMultiplier,
      decoration: BoxDecoration(
          color: Colours.BUTTON_COLOR_1,
          borderRadius: BorderRadius.circular(0.6320*SizeConfig.heightMultiplier)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.125*SizeConfig.widthMultiplier),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Kumbh-Med",
                  fontSize: 2.1067*SizeConfig.heightMultiplier,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 2.2321*SizeConfig.widthMultiplier,
            ),
            Icon(
              icon,
              color: Colors.white,
              size: 3.1601*SizeConfig.heightMultiplier,
            )
          ],
        ),
      ),
    ),
  );
}
