import 'package:attend_ease/styling/colors.dart';
import 'package:attend_ease/styling/sizeconfig.dart';
import 'package:flutter/material.dart';

AppBar appBLocation(
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
      "Setup Attendance Location",
      style: TextStyle(
          color: Colors.black,
          fontFamily: "Tansek",
          fontWeight: FontWeight.w500,
          fontSize:
              3.844*SizeConfig.heightMultiplier),
    ),
    toolbarHeight: 8.4269*SizeConfig.heightMultiplier,
    elevation: 5,
    shadowColor: Colors.grey,
  );
}

Widget mapWidget() {
  return Image.asset("assets/location_screen/map.png");
}

Widget pageText(
   String title) {
  return Text(
    title,
    style: TextStyle(
        color: Colors.black,
        fontSize:
           2.054*SizeConfig.heightMultiplier,
        fontWeight: FontWeight.w600),
  );
}

Widget geoForceText(
    ) {
  return Text(
    "& set geofence radius",
    style: TextStyle(
      color: Colors.grey.shade800,
      fontSize: 1.896*SizeConfig.heightMultiplier,
    ),
  );
}

Widget locationSetBox(void Function() onTap,String latitude,String longitude) {
  return Container(
    padding: EdgeInsets.symmetric(
        horizontal: 2.232*SizeConfig.widthMultiplier ),
    height: 6.109*SizeConfig.heightMultiplier,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0.421*SizeConfig.heightMultiplier),
        border: Border.all(color: Colors.grey.shade400)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${latitude},${longitude}",
          style: TextStyle(
              color: Colors.grey.shade700,
              fontWeight: FontWeight.bold,
              fontSize:
                  1.896*SizeConfig.heightMultiplier),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            "Set Location",
            style: TextStyle(
                color: Colors.blue.shade700,
                fontWeight: FontWeight.bold,
                fontSize:
                    2.1067*SizeConfig.heightMultiplier),
          ),
        ),
      ],
    ),
  );
}

Widget locationRadiusBox(
    ) {
  return ListTile(
    leading: Icon(
      Icons.location_on,
      color: Colors.grey.shade800,
      size: 2.738*SizeConfig.heightMultiplier,
    ),
    title: Text(
      "Maximum Attendance Radius",
      style: TextStyle(
          color: Colors.grey.shade900,
          fontSize: 1.896*SizeConfig.heightMultiplier,
          fontWeight: FontWeight.w500),
    ),
    subtitle: Text(
      "Staff can mark attendance within this radius only",
      style: TextStyle(color: Colors.grey.shade900, fontSize: 1.516*SizeConfig.heightMultiplier),
    ),
  );
}

Widget rangeWidget( ) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 1.785*SizeConfig.widthMultiplier),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "100 m",
          style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 1.685*SizeConfig.heightMultiplier,
              fontWeight: FontWeight.w500),
        ),
        Text(
          "500 m",
          style: TextStyle(
              color: Colors.grey.shade700,
              fontSize:1.685 * SizeConfig.heightMultiplier,
              fontWeight: FontWeight.w500),
        ),
      ],
    ),
  );
}

Widget continueButton(void Function() onTap, BuildContext context) {
  return InkWell(
    onTap: onTap,
    child: Container(
      margin:
          EdgeInsets.symmetric(horizontal: 0 ),
      padding: EdgeInsets.symmetric(
          horizontal: 1.116*SizeConfig.widthMultiplier,
          vertical: 0.526*SizeConfig.heightMultiplier ),
      height: 6.846*SizeConfig.heightMultiplier,
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(0.632*SizeConfig.heightMultiplier),
          color: Colours.BUTTON_COLOR_1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Continue",
            style: TextStyle(
                color: Colors.white,
                fontSize:
                    2.633*SizeConfig.heightMultiplier,
                fontWeight: FontWeight.bold),
          ),
          IconButton(
            icon: Icon(
              Icons.arrow_circle_right,
              color: Colors.white,
              size: 3.476*SizeConfig.heightMultiplier,
            ),
            onPressed: () {},
          )
        ],
      ),
    ),
  );
}