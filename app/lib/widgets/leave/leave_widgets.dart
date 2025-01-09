import 'package:attend_ease/styling/sizeconfig.dart';
import 'package:flutter/material.dart';

AppBar appBLeave(BuildContext context) {
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
              3.8974*SizeConfig.heightMultiplier),
    ),
    toolbarHeight: 8.6376*SizeConfig.heightMultiplier,
    elevation: 5,
    shadowColor: Colors.grey,
  );
}

Widget leaveCard(BuildContext context, String name, String date, String title,
    Color border, Color bg) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 1.58006*SizeConfig.heightMultiplier),
      height: 17.9073*SizeConfig.heightMultiplier,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1.053 * SizeConfig.heightMultiplier),
        border: Border.all(color: border, width: 3),
        boxShadow: [BoxShadow(color: bg, spreadRadius: 2, blurRadius: 2)],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.125*SizeConfig.widthMultiplier, vertical: 1.89607*SizeConfig.heightMultiplier),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: style.copyWith(
                  color: Colors.black,
                  fontFamily: "Kumbh-Med",
                  fontWeight: FontWeight.bold,
                  fontSize: 2.5280*SizeConfig.heightMultiplier),
            ),
            SizedBox(
              height: 1.053* SizeConfig.heightMultiplier,
            ),
            Text(
              date,
              style: style.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 2.10674*SizeConfig.heightMultiplier),
            ),
            SizedBox(
              height: 1.053* SizeConfig.heightMultiplier,
            ),
            Text(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              title,
              style: style.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 2.31742*SizeConfig.heightMultiplier),
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
      height: 6.3202*SizeConfig.heightMultiplier,
      width: 29.0178 * SizeConfig.widthMultiplier,
      decoration: BoxDecoration(
          color: color,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(0.8426*SizeConfig.heightMultiplier)),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
              color: Colors.black, fontFamily: "Kumbh-Med", fontSize: 2.10674*SizeConfig.heightMultiplier),
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
      height: 17.9073*SizeConfig.heightMultiplier,
      width: 44.6428*SizeConfig.widthMultiplier,
      decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(2.6334*SizeConfig.heightMultiplier),
          border: Border.all(width: 3, color: border)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.7946*SizeConfig.widthMultiplier, vertical: 2.1067*SizeConfig.heightMultiplier),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 2.52809*SizeConfig.heightMultiplier,
                  fontFamily: "Kumbh-Med",
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 1.3693*SizeConfig.heightMultiplier,
            ),
            Text(
              count,
              style: TextStyle(
                  color: border,
                  fontSize:3.05478*SizeConfig.heightMultiplier,
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
      height: 5.26687*SizeConfig.heightMultiplier,
      width: 40.1785*SizeConfig.widthMultiplier,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0.8426*SizeConfig.heightMultiplier),
        color: color,
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 2.52809*SizeConfig.heightMultiplier,
            ),
            SizedBox(
              width:1.5625*SizeConfig.widthMultiplier,
            ),
            Text(
              title,
              style: style.copyWith(
                  fontSize: 1.94874*SizeConfig.heightMultiplier,
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
            fontSize: 2.52809*SizeConfig.heightMultiplier),
      ),
      SizedBox(
        height: 0.5266*SizeConfig.heightMultiplier,
      ),
      Text(
        date,
        style: style.copyWith(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 2.1067*SizeConfig.heightMultiplier),
      ),
      SizedBox(
        height: 1.5800*SizeConfig.heightMultiplier,
      ),
    ],
  );
}

TextStyle style = TextStyle(
  fontFamily: "Kumbh-Med",
);
