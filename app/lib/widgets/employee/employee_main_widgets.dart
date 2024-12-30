import 'package:attend_ease/helper/date_time_formatter.dart';
import 'package:attend_ease/styling/colors.dart';
import 'package:attend_ease/styling/scale.dart';
import 'package:attend_ease/globalobjects/variables.dart';
import 'package:attend_ease/helper/helper_functions.dart';
import 'package:attend_ease/screens/auth/otp_auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

List<String> imagesEmployee = [
  "assets/location_screen/face.png",
  "assets/location_screen/group.png",
  "assets/location_screen/list.png",
];

List<String> titleEmployee = [
  "Mark Attendance",
  "Check Other Staff",
  "Check Attendance History",
];

List subtitleEmployee = [
  "Mark your Attendance for Today ( Face )",
  "Check other employee's attendance list",
  "Check your Attendance History Report",
];

Widget appBartitle(
    double width, double height, double textScale, String? employeeName) {
  return Row(
    children: [
      Icon(
        Icons.account_circle_sharp,
        color: Colors.grey.shade800,
        size: responsiveContainerSize(32, width, height),
      ),
      SizedBox(
        width: responsiveContainerSize(12, width, height),
      ),
      Text(
        "${employeeName}",
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: responsiveFontSize(23, width, height, textScale)),
      ),
    ],
  );
}

List<Widget> actions(
    double width, double height, double textScale, BuildContext context) {
  return [
    IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(
          Icons.notifications_none,
          size: responsiveContainerSize(32, width, height),
        )),
    IconButton(
      onPressed: () async {
        // await HelperFunctions.setStatus(false);
        // await HelperFunctions.setEMployeeName("");
        // await HelperFunctions.setEMployeeID("");
        Navigator.push(
            context,
            PageTransition(
                child: OtpAuthScreen(), type: PageTransitionType.fade));
      },
      icon: Icon(
        Icons.exit_to_app,
        size: responsiveContainerSize(32, width, height),
      ),
    ),
  ];
}

Widget upperBar(double width, double height, double textScale,
    BuildContext context, String Date, String status) {
  return Container(
    decoration: const BoxDecoration(
      color: Colors.white,
      border: Border(
        bottom: BorderSide(
          color: Colors.red, // Choose your color here
          width: 5.0, // Choose the width of the border
        ),
      ),
    ),
    padding: EdgeInsets.symmetric(
        horizontal: 10 * horizontalPaddingFactor(width),
        vertical: 5 * verticalPaddingFactor(height)),
    height: responsiveContainerSize(110, width, height),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Mark Your Attendance",
                style: GoogleFonts.notoSansOldHungarian(
                  color: Colors.grey.shade900,
                  fontWeight: FontWeight.bold,
                  fontSize: responsiveFontSize(22, width, height, textScale),
                )),
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  responsiveBorderRadius(6, width, height))),
                          backgroundColor: Colours.BUTTON_COLOR_2,
                          title: Center(
                            child: Text(
                              "Stay Within Radius",
                              style: GoogleFonts.notoSansOldHungarian(
                                  fontSize: responsiveContainerSize(
                                      26, width, height),
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          content: Container(
                            height: responsiveContainerSize(130, width, height),
                            child: Center(
                              child: Text(
                                "Please stay within 100 to 500 m from office location otherwise you will be not able to mark attendance . ",
                                style: GoogleFonts.notoSansOldHungarian(
                                    fontSize: responsiveContainerSize(
                                        18, width, height),
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
                  size: responsiveContainerSize(32, width, height),
                )),
          ],
        ),
        SizedBox(
          height: responsiveContainerSize(15, width, height),
        ),
        dateWidget(width, height, textScale, Date, status)
      ],
    ),
  );
}

Widget dateWidget(
    double width, double height, double textScale, String Date, String status) {
  return Center(
    child: RichText(
      text: TextSpan(
        text: '${Date} ',
        style: GoogleFonts.notoSansOldHungarian(
          color: Colors.grey.shade900,
          fontWeight: FontWeight.w600,
          fontSize: responsiveFontSize(20, width, height, textScale),
        ),
        children: <TextSpan>[
          TextSpan(
            text: status,
            style: GoogleFonts.notoSansOldHungarian(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: responsiveFontSize(20, width, height, textScale),
            ),
          )
        ],
      ),
    ),
  );
}

Widget cameraAuthenticate(void Function() onTap, double width, double height,
    double textScale, BuildContext context, bool isAuthenticate, Text text) {
  return Container(
    decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.red, width: 5))),
    padding: EdgeInsets.symmetric(
        horizontal: 5 * horizontalPaddingFactor(width),
        vertical: 15 * verticalPaddingFactor(height)),
    child: Column(
      children: [
        SizedBox(
          height: responsiveContainerSize(64, width, height),
        ),
        Center(
          child: Image.asset(
            "assets/home_screen/biom.png",
            height: responsiveContainerSize(140, width, height),
            width: responsiveContainerSize(140, width, height),
          ),
        ),
        SizedBox(
          height: responsiveContainerSize(20, width, height),
        ),
        cameraButton(onTap, width, height, textScale, context),
        SizedBox(
          height: responsiveContainerSize(20, width, height),
        ),
        text,
        SizedBox(
          height: responsiveContainerSize(100, width, height),
        ),
      ],
    ),
  );
}

Widget attendButtonIn(
    void Function() onTap, double width, double height, double textScale) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: responsiveContainerSize(90, width, height),
      color: Colors.grey.shade900,
      child: buttonWIdget(onTap, width, height, textScale, "Punch In"),
    ),
  );
}

Widget attendButtonOut(
    void Function() onTap, double width, double height, double textScale) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: responsiveContainerSize(90, width, height),
      color: Colors.grey.shade900,
      child: buttonWIdget(onTap, width, height, textScale, "Punch Out"),
    ),
  );
}

Widget buttonWIdget(
  void Function() onTap,
  double width,
  double height,
  double textScaleFactor,
  String title,
) {
  return InkWell(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.symmetric(
          horizontal: 20 * horizontalPaddingFactor(width),
          vertical: 20 * verticalPaddingFactor(height)),
      padding: EdgeInsets.symmetric(
          horizontal: 12 * horizontalPaddingFactor(width),
          vertical: 5 * verticalPaddingFactor(height)),
      height: responsiveContainerSize(30, width, height),
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(responsiveBorderRadius(2, width, height)),
          color: Colours.BUTTON_COLOR_1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
                color: Colors.white,
                fontSize:
                    responsiveFontSize(21, width, height, textScaleFactor),
                fontWeight: FontWeight.bold),
          ),
          IconButton(
            icon: Icon(
              Icons.back_hand,
              color: Colors.white,
              size: responsiveContainerSize(23, width, height),
            ),
            onPressed: () {},
          )
        ],
      ),
    ),
  );
}

Widget locationWidget(
    double width, double height, double textScale, String text) {
  return Container(
    height: responsiveContainerSize(60, width, height),
    color: Colors.blue.shade300,
    child: Center(
      child: Text(
        text,
        style: TextStyle(
            color: Colors.black,
            fontSize: responsiveFontSize(22, width, height, textScale),
            fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget tableText(double width, double height, double textScale, String text) {
  return Center(
    child: Text(
      text,
      style: TextStyle(
          fontFamily: "Kumbh-Med",
          fontWeight: FontWeight.bold,
          fontSize: responsiveFontSize(17, width, height, textScale)),
      // style: GoogleFonts.notoSansOldHungarian(
      //   color: Colors.grey.shade900,
      //   fontWeight: FontWeight.bold,
      //   fontSize: responsiveFontSize(16, width, height, textScale),
      // )
    ),
  );
}

Widget attendanceText(
    double width, double height, double textScale, String text) {
  return Container(
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: GoogleFonts.montserrat(
                shadows: [
                  Shadow(
                      color: Colors.yellow,
                      blurRadius: responsiveBorderRadius(2, width, height))
                ],
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: responsiveFontSize(30, width, height, textScale)),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.calendar_month),
            iconSize: responsiveContainerSize(35, width, height),
          )
        ],
      ),
    ),
  );
}

Widget attendanceReport(double width, double height, double textScale,
    BuildContext context, List<dynamic> report) {
  print("List is ${report}");
  return Column(
    children: [
      ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: report.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 12),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 13),
                height: 140,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade700, spreadRadius: 1.5, blurRadius: 2)
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateTimeFormatter.formatDate(report[index]["Date"]),
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            boxIcon(Icons.logout),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                                DateTimeFormatter.formatTime(
                                    report[index]["InTime"]),
                                style: GoogleFonts.montserrat(
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23,
                                )),
                          ],
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Row(
                          children: [
                            boxIcon(Icons.logout),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                                DateTimeFormatter.formatTime(
                                    report[index]["OutTime"]),
                                style: GoogleFonts.montserrat(
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23,
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

Widget attendCountWidgetEmployee(double width, double height, double textScale,
    String? InTime, String? OutTime, String? Status, String Date) {
  return Container(
    height: responsiveContainerSize(200, width, height),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(6),
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
                horizontal: 45 *
                    horizontalPaddingFactor(
                      width,
                    ),
                vertical: 10 * verticalPaddingFactor(height)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    rowCOntentEmployee1(width, height, textScale, "In", InTime),
                    rowCOntentEmployee(
                        width, height, textScale, "Out", OutTime),
                    rowCOntentEmployee(
                        width, height, textScale, "Status", Status)
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: responsiveContainerSize(10, width, height),
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: 15 * horizontalPaddingFactor(width)),
            child: Divider(
              color: Colors.grey.shade300,
              height: 1,
            ),
          ),
          SizedBox(
            height: responsiveContainerSize(10, width, height),
          ),
          rowContentEMployee2(width, height, textScale, Date),
        ],
      ),
    ),
  );
}

Widget rowCOntentEmployee(double width, double height, double textScale,
    String title, String? status) {
  return Column(
    children: [
      Text(
        title,
        style: TextStyle(
            color: Colors.white,
            fontFamily: "Tansek",
            fontSize: responsiveFontSize(36, width, height, textScale)),
      ),
      SizedBox(
        height: responsiveContainerSize(12, width, height),
      ),
      Text(
        "${status}",
        style: GoogleFonts.aDLaMDisplay(
            color: Colors.white,
            fontSize: responsiveFontSize(28, width, height, textScale)),
      )
    ],
  );
}

Widget rowCOntentEmployee1(double width, double height, double textScale,
    String title, String? status) {
  return Column(
    children: [
      Text(
        "${title}",
        style: TextStyle(
            color: Colors.white,
            fontFamily: "Tansek",
            fontSize: responsiveFontSize(36, width, height, textScale)),
      ),
      SizedBox(
        height: responsiveContainerSize(12, width, height),
      ),
      Text(
        "${status}",
        style: GoogleFonts.aDLaMDisplay(
            color: Colors.white,
            fontSize: responsiveFontSize(28, width, height, textScale)),
      )
    ],
  );
}

Widget rowContentEMployee2(
    double width, double height, double textScale, String? Date) {
  return Container(
    padding:
        EdgeInsets.symmetric(horizontal: 18 * horizontalPaddingFactor(width)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            "Today's Date : ${Date}",
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Tansek",
                fontSize: responsiveContainerSize(28, width, height)),
          ),
        )
      ],
    ),
  );
}

Widget listWidgetEMployee(
    double width, double height, double textScale, BuildContext context) {
  return Column(
    children: [
      Container(
        height: responsiveContainerSize(350, width, height),
        child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  SizedBox(
                    height: responsiveContainerSize(10, width, height),
                  ),
                  ListTile(
                    leading: Image.asset(
                      imagesEmployee[index],
                      height: responsiveContainerSize(34, width, height),
                      width: responsiveContainerSize(34, width, height),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: responsiveContainerSize(18, width, height),
                    ),
                    title: Text(
                      titleEmployee[index],
                      style: GoogleFonts.notoSansOldHungarian(
                          color: Colors.black,
                          fontSize:
                              responsiveFontSize(18, width, height, textScale),
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(subtitleEmployee[index],
                        style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize:
                              responsiveFontSize(15, width, height, textScale),
                        )),
                  ),
                  SizedBox(
                    height: responsiveContainerSize(10, width, height),
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

Widget companyButtonEmployee(void Function() onTap, double width, double height,
    double textScaleFactor, BuildContext context) {
  return InkWell(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10 * horizontalPaddingFactor(width),
      ),
      padding: EdgeInsets.symmetric(
          horizontal: 5 * horizontalPaddingFactor(width),
          vertical: 5 * verticalPaddingFactor(height)),
      height: responsiveContainerSize(55, width, height),
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(responsiveBorderRadius(6, width, height)),
          color: Colours.BUTTON_COLOR_1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Request Office Leave",
            style: TextStyle(
                color: Colors.white,
                fontSize:
                    responsiveFontSize(22, width, height, textScaleFactor),
                fontWeight: FontWeight.bold),
          ),
          IconButton(
            icon: Icon(
              Icons.calendar_month_rounded,
              color: Colors.white,
              size: responsiveContainerSize(30, width, height),
            ),
            onPressed: () {},
          )
        ],
      ),
    ),
  );
}

Widget attendCompleteText(double width, double height, double textScale) {
  return Container(
    height: responsiveContainerSize(90, width, height),
    color: Colors.grey.shade900,
    child: Center(
      child: Text(
        "Your Attendance for Today Is Complete",
        style: TextStyle(
            color: Colors.white,
            fontSize: responsiveFontSize(21.5, width, height, textScale),
            fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget cameraButton(void Function() onTap, double width, double height,
    double textScaleFactor, BuildContext context) {
  return InkWell(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.symmetric(
        horizontal: 90 * horizontalPaddingFactor(width),
      ),
      padding: EdgeInsets.symmetric(
          horizontal: 5 * horizontalPaddingFactor(width),
          vertical: 5 * verticalPaddingFactor(height)),
      height: responsiveContainerSize(50, width, height),
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(responsiveBorderRadius(10, width, height)),
          color: Colours.BUTTON_COLOR_1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Authenticate",
            style: TextStyle(
                color: Colors.white,
                fontSize:
                    responsiveFontSize(23, width, height, textScaleFactor),
                fontWeight: FontWeight.bold),
          ),
          IconButton(
            icon: Icon(
              Icons.camera,
              color: Colors.white,
              size: responsiveContainerSize(25, width, height),
            ),
            onPressed: () {},
          )
        ],
      ),
    ),
  );
}
