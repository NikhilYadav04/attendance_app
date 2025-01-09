import 'package:attend_ease/styling/colors.dart';
import 'package:attend_ease/styling/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

AppBar appB(BuildContext context, void Function() onTap) {
  return AppBar(
    actions: [
      IconButton(
          onPressed: () async {
            // await HelperFunctions.setStatus(false);
            // await HelperFunctions.setCompanyName("");
            onTap;
            Navigator.pop(context);
          },
          icon: Icon(Icons.exit_to_app))
    ],
    automaticallyImplyLeading: false,
    backgroundColor: Colors.white,
    title: Text(
      "Setup your company account",
      style: TextStyle(
          color: Colors.black,
          fontFamily: "Tansek",
          fontWeight: FontWeight.w500,
          fontSize: 3.686 * SizeConfig.heightMultiplier),
    ),
    toolbarHeight: 8.1109 * SizeConfig.heightMultiplier,
    elevation: 5,
    shadowColor: Colors.grey,
  );
}

Widget tileWidget() {
  return Container(
    decoration: BoxDecoration(
        color: Colors.blue.shade50, borderRadius: BorderRadius.circular(4)),
    child: ListTile(
      title: Text(
        "Register Your Company Here",
        style: TextStyle(
            fontFamily: "Tansek",
            fontSize: 3 * SizeConfig.heightMultiplier,
            fontWeight: FontWeight.bold,
            color: Colors.blue.shade800),
      ),
      subtitle: Text(
        "Enter your company details to proceed.",
        style: TextStyle(
            fontFamily: "Tansek",
            fontSize: 2.6 * SizeConfig.heightMultiplier,
            fontWeight: FontWeight.w500,
            color: Colors.blue.shade800),
      ),
      trailing: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 2.5280 * SizeConfig.heightMultiplier,
        child: Icon(
          Icons.security_update_good,
          color: Colors.blue.shade800,
          size: 2.949 * SizeConfig.heightMultiplier,
        ),
      ),
    ),
  );
}

Widget textField(
  String label,
  String title,
  TextEditingController textCOntroller,
) {
  return Form(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.grey.shade800,
            fontSize: 1.790 * SizeConfig.heightMultiplier,
          ),
        ),
        SizedBox(
          height: 1.1587 * SizeConfig.heightMultiplier,
        ),
        FormField(builder: (context) {
          return TextField(
            controller: textCOntroller,
            decoration: InputDecoration(
              label: Text(
                label,
                style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 1.896 * SizeConfig.heightMultiplier),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(0.4213 * SizeConfig.heightMultiplier),
                borderSide: BorderSide(color: Colors.grey.shade500),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(0.4213 * SizeConfig.heightMultiplier),
                borderSide: const BorderSide(color: Colours.BUTTON_COLOR_1),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(0.4213 * SizeConfig.heightMultiplier),
                borderSide: const BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(0.4213 * SizeConfig.heightMultiplier),
                borderSide: const BorderSide(color: Colors.red),
              ),
            ),
          );
        })
      ],
    ),
  );
}

Widget companyButton(void Function() onTap, BuildContext context) {
  return InkWell(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 0),
      padding: EdgeInsets.symmetric(
          horizontal: 1.1160 * SizeConfig.widthMultiplier,
          vertical: 0.5266 * SizeConfig.heightMultiplier),
      height: 6.3202 * SizeConfig.heightMultiplier,
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(0.632 * SizeConfig.heightMultiplier),
          color: Colours.BUTTON_COLOR_1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Continue",
            style: TextStyle(
                color: Colors.white,
                fontSize: 2.528 * SizeConfig.heightMultiplier,
                fontWeight: FontWeight.bold),
          ),
          IconButton(
            icon: Icon(
              Icons.arrow_circle_right,
              color: Colors.white,
              size: 3.3707 * SizeConfig.heightMultiplier,
            ),
            onPressed: () {},
          )
        ],
      ),
    ),
  );
}

Widget companyLoginButton(void Function() onTap, BuildContext context) {
  return InkWell(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 0),
      padding: EdgeInsets.symmetric(
          horizontal: 1.11607 * SizeConfig.widthMultiplier,
          vertical: 0.5266 * SizeConfig.heightMultiplier),
      height: 6.3202 * SizeConfig.heightMultiplier,
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(0.6320 * SizeConfig.heightMultiplier),
          color: Colours.BUTTON_COLOR_1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Login as HR",
            style: TextStyle(
                color: Colors.white,
                fontSize: 2.4754 * SizeConfig.heightMultiplier,
                fontWeight: FontWeight.bold),
          ),
          IconButton(
            icon: Icon(
              Icons.arrow_circle_right,
              color: Colors.white,
              size: 3.3707 * SizeConfig.heightMultiplier,
            ),
            onPressed: () {},
          )
        ],
      ),
    ),
  );
}

Widget LoadingAnimationWidget() {
  return Container(
    padding:
        EdgeInsets.symmetric(horizontal: 4.0178 * SizeConfig.widthMultiplier),
    height: 10.0070 * SizeConfig.heightMultiplier,
    color: Colors.white,
    child: Row(
      children: [
        LottieBuilder.asset(
          "assets/animations/food.json",
          height: 20.089*SizeConfig.widthMultiplier,
        ),
        SizedBox(width: 3.3482*SizeConfig.widthMultiplier,),
        Text("Getting Your Location...",
            style: GoogleFonts.notoSansOldHungarian(
                fontWeight: FontWeight.bold,
                fontSize: 6.0267*SizeConfig.widthMultiplier,
                color: Colors.black))
      ],
    ),
  );
}

Widget textFieldNumber(
  String label,
  String title,
  TextEditingController textCOntroller,
) {
  return Form(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.grey.shade800,
            fontSize: 1.79073 * SizeConfig.heightMultiplier,
          ),
        ),
        SizedBox(
          height: 1.264 * SizeConfig.heightMultiplier,
        ),
        FormField(builder: (context) {
          return TextField(
            keyboardType: TextInputType.phone,
            controller: textCOntroller,
            decoration: InputDecoration(
              label: Text(
                label,
                style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 1.79073 * SizeConfig.heightMultiplier),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(0.4213 * SizeConfig.heightMultiplier),
                borderSide: BorderSide(color: Colors.grey.shade500),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(0.4213 * SizeConfig.heightMultiplier),
                borderSide: const BorderSide(color: Colours.BUTTON_COLOR_1),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(0.4213 * SizeConfig.heightMultiplier),
                borderSide: const BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(0.4213 * SizeConfig.heightMultiplier),
                borderSide: const BorderSide(color: Colors.red),
              ),
            ),
          );
        })
      ],
    ),
  );
}
