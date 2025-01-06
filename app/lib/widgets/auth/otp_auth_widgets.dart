import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:attend_ease/styling/colors.dart';
import 'package:attend_ease/screens/auth/modal_sheet_1.dart';
import 'package:attend_ease/styling/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pinput/pinput.dart';
import 'package:toastification/toastification.dart';

final Toastification toastification = Toastification();

Widget imageSlider() {
  return Container(
    padding: EdgeInsets.only(top: 1.588 * SizeConfig.heightMultiplier),
    height: 75.842 * SizeConfig.heightMultiplier,
    color: Colours.DARK_BLUE,
    child: AnotherCarousel(
      images: [
        Image.asset("assets/login_screen/vector_1.png"),
        Image.asset("assets/login_screen/vector_2.png"),
        Image.asset("assets/login_screen/vector_3.png"),
      ],
      boxFit: BoxFit.fill,
    ),
  );
}

Widget loginButton(BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          PageTransition(
              child: SheetScreen1(), type: PageTransitionType.bottomToTop));
    },
    child: Container(
      margin:
          EdgeInsets.symmetric(horizontal: 2.232 * SizeConfig.widthMultiplier),
      padding: EdgeInsets.symmetric(
          horizontal: 1.116 * SizeConfig.widthMultiplier,
          vertical: 0.526 * SizeConfig.heightMultiplier),
      height: 7.373 * SizeConfig.heightMultiplier,
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(0.632 * SizeConfig.heightMultiplier),
          color: Colours.DARK_BLUE),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Login With OTP ",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontFamily: "Tansek",
              fontSize: 4.3188 * SizeConfig.heightMultiplier,
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.arrow_circle_right_outlined,
              color: Colors.white,
              size: 3.5814 * SizeConfig.heightMultiplier,
            ),
            onPressed: () {},
          )
        ],
      ),
    ),
  );
}

Widget bottomText() {
  return RichText(
    text: TextSpan(
      style: TextStyle(
        fontFamily: "Tansek",
        fontSize: 2.84411 * SizeConfig.heightMultiplier,
        color: Colors.grey.shade800,
      ),
      children: const [
        TextSpan(text: "By continuing, You agree to Our "),
        TextSpan(
          text: "Terms & Conditions",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
      ],
    ),
  );
}

ToastificationItem toastMessage(BuildContext context, String title,
    String description, ToastificationType type) {
  return toastification.show(
    context: context,
    alignment: Alignment.bottomCenter,
    type: type,
    style: ToastificationStyle.flatColored,
    autoCloseDuration: const Duration(seconds: 5),
    title: Text(
      title,
      style: TextStyle(fontSize: 1.896 * SizeConfig.heightMultiplier),
    ),
    description: Text(
      description,
    ),
  );
}

Widget continueButton2(void Function() onTap, BuildContext context) {
  return InkWell(
    onTap: onTap,
    child: Container(
      margin:
          EdgeInsets.symmetric(horizontal: 2.232*SizeConfig.widthMultiplier),
      padding: EdgeInsets.symmetric(
          horizontal: 1.116*SizeConfig.widthMultiplier ,
          vertical: 0.5266*SizeConfig.heightMultiplier ),
      height: 6.8469*SizeConfig.heightMultiplier,
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
                   3*SizeConfig.heightMultiplier,
                fontWeight: FontWeight.bold),
          ),
          IconButton(
            icon: Icon(
              Icons.arrow_circle_right_outlined,
              color: Colors.white,
              size: 3.8*SizeConfig.heightMultiplier,
            ),
            onPressed: () {},
          )
        ],
      ),
    ),
  );
}

Widget titleText(String title) {
  return Text(
    title,
    style: TextStyle(
        color: Colors.black,
        fontFamily: "Tansek",
        fontSize: 4.634 * SizeConfig.heightMultiplier),
  );
}

Widget descriptionText(String description) {
  return Text(
    description,
    style: TextStyle(
        color: Colors.grey.shade800,
        fontFamily: "Tansek",
        fontSize: 3.3181 * SizeConfig.heightMultiplier),
  );
}

Widget phoneNumberField(
    GlobalKey<FormState> formKey, TextEditingController numberController) {
  return Container(
    padding:
        EdgeInsets.symmetric(horizontal: 1.339 * SizeConfig.widthMultiplier),
    child: Form(
      key: formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            "assets/login_screen/flag.png",
            height: 3.3707 * SizeConfig.heightMultiplier,
            width: 7.1428 * SizeConfig.widthMultiplier,
          ),
          Text(
            " +91  ",
            style: TextStyle(
                fontSize: 2.738 * SizeConfig.heightMultiplier,
                fontWeight: FontWeight.w500),
          ),
          Expanded(
            child: IntrinsicHeight(
              child: TextFormField(
                controller: numberController,
                keyboardType: TextInputType.number,
                style: TextStyle(
                    fontSize: 2.4 * SizeConfig.heightMultiplier,
                    color: Colors.black),
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  label: Center(
                    child: Text(
                      "Enter your Phone Number",
                      style: TextStyle(
                          fontSize: 2.3 * SizeConfig.heightMultiplier,
                          color: Colors.grey.shade800),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        0.421 * SizeConfig.heightMultiplier),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        0.421 * SizeConfig.heightMultiplier),
                    borderSide: const BorderSide(color: Colours.BUTTON_COLOR_1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        0.421 * SizeConfig.heightMultiplier),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        0.421 * SizeConfig.heightMultiplier),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        0.421 * SizeConfig.heightMultiplier),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Phone number cannot be empty';
                  } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                    return 'Please enter a valid 10-digit phone number';
                  }
                  return null;
                },
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget otpField(
    TextEditingController otpController) {
  return Pinput(
    controller: otpController,
    length: 6,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    defaultPinTheme: PinTheme(
        height: 6.1147*SizeConfig.heightMultiplier,
        width: 12.1607*SizeConfig.widthMultiplier,
        textStyle: TextStyle(
          fontSize: 2.5*SizeConfig.heightMultiplier,
          color: Colors.black,
        ),
        decoration: BoxDecoration(
            color: Colors.blue.shade100,
            border: Border.all(color: Colors.grey.shade800),
            boxShadow: const [
              BoxShadow(
                  color: Colors.transparent, blurRadius: 100, spreadRadius: 100)
            ])),
  );
}

ToastificationItem toastMessageSuccess(
    BuildContext context, String title, String description) {
  return toastification.show(
    context: context,
    alignment: Alignment.bottomCenter,
    type: ToastificationType.success,
    style: ToastificationStyle.flatColored,
    autoCloseDuration: const Duration(seconds: 5),
    title: Text(
      title,
      style: const TextStyle(fontSize: 18),
    ),
    description: Text(
      description,
    ),
  );
}

ToastificationItem toastMessageError(
    BuildContext context, String title, String description) {
  return toastification.show(
    context: context,
    alignment: Alignment.bottomCenter,
    type: ToastificationType.error,
    style: ToastificationStyle.flatColored,
    autoCloseDuration: const Duration(seconds: 5),
    title: Text(
      title,
      style: const TextStyle(fontSize: 18),
    ),
    description: Text(
      description,
    ),
  );
}
