import 'package:attend_ease/styling/colors.dart';
import 'package:attend_ease/styling/sizeconfig.dart';
import 'package:flutter/material.dart';

Widget backgroundContainer() {
  return Container(
    color: Colours.DARK_BLUE,
    height: 68.469 * SizeConfig.heightMultiplier,
  );
}

Widget titleWidget() {
  return Center(
    child: FittedBox(
      child: Text(
        "Welcome to Attend Ease",
        style: TextStyle(
            color: Color(0xFFC3FFFC),
            fontWeight: FontWeight.bold,
            fontSize: 3.8 * SizeConfig.heightMultiplier,
            fontFamily: "Kumbh-Med"),
      ),
    ),
  );
}

Widget dashboardContainer(String image, String title) {
  return Container(
    height: 21.067 * SizeConfig.heightMultiplier,
    width: 45.089 * SizeConfig.widthMultiplier,
    decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(2.1067 * SizeConfig.heightMultiplier),
        color: Color(0xFFC3FFFC)),
    child: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 2 * SizeConfig.heightMultiplier,
          vertical: 2.3174 * SizeConfig.heightMultiplier),
      child: Column(
        children: [
          Center(
              child: Image.asset(
            image,
            height: 10.5337 * SizeConfig.heightMultiplier,
            width: 22.321 * SizeConfig.widthMultiplier,
          )),
          SizedBox(
            height: 1.896 * SizeConfig.heightMultiplier,
          ),
          FittedBox(
            child: Text(
              title,
              style: TextStyle(
                  fontFamily: "Kumbh-Med",
                  fontWeight: FontWeight.bold,
                  fontSize: 2.16 * SizeConfig.heightMultiplier,
                  color: Colors.black),
            ),
          )
        ],
      ),
    ),
  );
}

Widget welcomeText() {
  return Center(
    child: FittedBox(
      child: Text(
        "Manage your attendance in a single click.",
        style: TextStyle(
            color: Color(0xFFEEB5EB),
            fontWeight: FontWeight.bold,
            fontSize: 2.2120 * SizeConfig.heightMultiplier,
            fontFamily: "Kumbh-Med"),
      ),
    ),
  );
}

Widget companyButton(void Function() onTap, BuildContext context) {
  return InkWell(
    onTap: onTap,
    child: Container(
      margin:
          EdgeInsets.symmetric(horizontal: 2.232 * SizeConfig.widthMultiplier),
      padding: EdgeInsets.symmetric(
          horizontal: 1.116 * SizeConfig.widthMultiplier,
          vertical: 0.5266 * SizeConfig.heightMultiplier),
      height: 7 * SizeConfig.heightMultiplier,
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(0.632 * SizeConfig.heightMultiplier),
          color: Colours.DARK_BLUE),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Create Company Account",
            style: TextStyle(
                color: Colors.white,
                fontSize: 2.7387 * SizeConfig.heightMultiplier,
                fontWeight: FontWeight.bold),
          ),
          IconButton(
            icon: Icon(
              Icons.arrow_circle_right_outlined,
              color: Colors.white,
              size: 3.4761 * SizeConfig.heightMultiplier,
            ),
            onPressed: () {},
          )
        ],
      ),
    ),
  );
}

Widget existText() {
  return Center(
    child: Text(
      "Join Existing Company",
      style: TextStyle(
          color: Colours.DARK_BLUE,
          fontSize: 2.9 * SizeConfig.heightMultiplier,
          fontWeight: FontWeight.bold,
          fontFamily: "Transek"),
    ),
  );
}

Widget widgetDivider() {
  return Container(
    padding:
        EdgeInsets.symmetric(horizontal: 2.232 * SizeConfig.widthMultiplier),
    child: const Divider(
      color: Color.fromARGB(255, 143, 141, 141),
      thickness: 2.0,
    ),
  );
}
