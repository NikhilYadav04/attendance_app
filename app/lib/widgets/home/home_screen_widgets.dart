import 'package:attend_ease/styling/colors.dart';
import 'package:attend_ease/styling/scale.dart';
import 'package:flutter/material.dart';

Widget backgroundContainer(double currentWidth, double currentHeight) {
  return Container(
    color: Colours.DARK_BLUE,
    height: responsiveContainerSize(650, currentWidth, currentHeight),
  );
}

Widget titleWidget(
  double currentWidth,
  double currentHeight,
  double textScale,
) {
  return Center(
    child: Text(
      "Welcome to Attend Ease",
      style: TextStyle(
          color: Color(0xFFC3FFFC),
          fontWeight: FontWeight.bold,
          fontSize:
              responsiveFontSize(33, currentWidth, currentHeight, textScale),
          fontFamily: "Kumbh-Med"),
    ),
  );
}

Widget dashboardContainer(String image,String title) {
  return Container(
    height: 200,
    width: 202,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Color(0xFFC3FFFC)
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 22),
      child: Column(
        children: [
          Center(child: Image.asset(image,height: 100,width: 100,)),
          SizedBox(height: 18,),
          Text(title,style: TextStyle(
            fontFamily: "Kumbh-Med",fontWeight: FontWeight.bold,
            fontSize: 22.5,color: Colors.black
          ),)
        ],
      ),
    ),
  );
}

Widget welcomeText(
  double currentWidth,
  double currentHeight,
  double textScale,
) {
  return Center(
    child: Text(
      "Manage your attendance in a single click.",
      style: TextStyle(
          color: Color(0xFFEEB5EB),
          fontWeight: FontWeight.bold,
          fontSize:
              responsiveFontSize(19.8, currentWidth, currentHeight, textScale),
          fontFamily: "Kumbh-Med"),
    ),
  );
}

Widget companyButton(void Function() onTap, double width, double height,
    double textScaleFactor, BuildContext context) {
  return InkWell(
    onTap: onTap,
    child: Container(
      margin:
          EdgeInsets.symmetric(horizontal: 10 * horizontalPaddingFactor(width)),
      padding: EdgeInsets.symmetric(
          horizontal: 5 * horizontalPaddingFactor(width),
          vertical: 5 * verticalPaddingFactor(height)),
      height: responsiveContainerSize(55, width, height),
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(responsiveBorderRadius(6, width, height)),
          color: Colours.DARK_BLUE),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Create Company Account",
            style: TextStyle(
                color: Colors.white,
                fontSize:
                    responsiveFontSize(24, width, height, textScaleFactor),
                fontWeight: FontWeight.bold),
          ),
          IconButton(
            icon: Icon(
              Icons.arrow_circle_right_outlined,
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

Widget existText(double width, double height, double textScaleFactor) {
  return Center(
    child: Text(
      "Join Existing Company",
      style: TextStyle(
          color: Colours.DARK_BLUE,
          fontSize: responsiveContainerSize(24, width, height),
          fontWeight: FontWeight.bold,
          fontFamily: "Transek"),
    ),
  );
}

Widget widgetDivider(double currentWidth, double currentHeight) {
  return Container(
    padding: EdgeInsets.symmetric(
        horizontal: 10 * horizontalPaddingFactor(currentWidth)),
    child: const Divider(
      color: Color.fromARGB(255, 143, 141, 141),
      thickness: 2.0,
    ),
  );
}
