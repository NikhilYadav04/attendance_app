import 'package:attend_ease/styling/colors.dart';
import 'package:attend_ease/styling/scale.dart';
import 'package:flutter/material.dart';

AppBar appBLeave(double currentWidth, double currentHeight, double textScale,
    BuildContext context) {
  return AppBar(
    actions: [
      IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.exit_to_app))
    ],
    automaticallyImplyLeading: false,
    backgroundColor: Colors.white,
    title: Text(
      "Fill Leave Details",
      style: TextStyle(
          color: Colors.black,
          fontFamily: "Tansek",
          fontWeight: FontWeight.w500,
          fontSize:
              responsiveFontSize(34, currentWidth, currentHeight, textScale)),
    ),
    toolbarHeight: responsiveContainerSize(75, currentWidth, currentHeight),
    elevation: 5,
    shadowColor: Colors.grey,
  );
}

Widget leaveCard(BuildContext context, String name, String date, String title,
    Color border, Color bg) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: border, width: 3),
        boxShadow: [BoxShadow(color: bg, spreadRadius: 2, blurRadius: 2)],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: style.copyWith(
                  color: Colors.black,
                  fontFamily: "Kumbh-Med",
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              date,
              style: style.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              title,
              style: style.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget button(String title, Color color, void Function() ontap) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      height: 60,
      width: 130,
      decoration: BoxDecoration(
          color: color,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
              color: Colors.black, fontFamily: "Kumbh-Med", fontSize: 20),
        ),
      ),
    ),
  );
}

Widget cards(
    String title, String count, Color border, Color bg, void Function() onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 170,
      width: 200,
      decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(width: 3, color: border)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontFamily: "Kumbh-Med",
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 13,
            ),
            Text(
              count,
              style: TextStyle(
                  color: border,
                  fontSize: 29,
                  fontFamily: "Kumbh-Med",
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget buttons(String title, IconData icon, Color color,void Function() onTap) {
  return GestureDetector(
    onTap:onTap,
    child: Container(
      height: 50,
      width: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color,
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 24,
            ),
            SizedBox(
              width: 7,
            ),
            Text(
              title,
              style: style.copyWith(
                  fontSize: 18.5,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    ),
  );
}

Widget bottomCard(
    String name, String date, String title, String reason, String count) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 28),
    height: 480,
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 40,
        ),
        Text(
          "Employee Name",
          style: style.copyWith(
              color: Colors.grey.shade700,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          name,
          style: style.copyWith(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          "Title",
          style: style.copyWith(
              color: Colors.grey.shade700,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          title,
          style: style.copyWith(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          "Date",
          style: style.copyWith(
              color: Colors.grey.shade700,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          date,
          style: style.copyWith(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          "Reason",
          style: style.copyWith(
              color: Colors.grey.shade700,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          reason,
          style: style.copyWith(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          "Leave Counts",
          style: style.copyWith(
              color: Colors.grey.shade700,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          count,
          style: style.copyWith(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

Widget leaveCardPending(String name, String date) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        name,
        style: style.copyWith(
            color: Colors.black,
            fontFamily: "Kumbh-Med",
            fontWeight: FontWeight.bold,
            fontSize: 24),
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        date,
        style: style.copyWith(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      SizedBox(
        height: 15,
      ),
    ],
  );
}

TextStyle style = TextStyle(
  fontFamily: "Kumbh-Med",
);
