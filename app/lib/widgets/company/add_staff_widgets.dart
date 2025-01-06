import 'package:attend_ease/styling/colors.dart';
import 'package:attend_ease/styling/sizeconfig.dart';
import 'package:flutter/material.dart';

AppBar appBStaff( BuildContext context) {
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
      "Add Employee Details",
      style: TextStyle(
          color: Colors.black,
          fontFamily: "Tansek",
          fontWeight: FontWeight.w500,
          fontSize:
              3.897*SizeConfig.heightMultiplier),
    ),
    toolbarHeight: 8.6376*SizeConfig.heightMultiplier,
    elevation: 5,
    shadowColor: Colors.grey,
  );
}

AppBar appBRemStaff(
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
      "Remove Employee Record",
      style: TextStyle(
          color: Colors.black,
          fontFamily: "Tansek",
          fontWeight: FontWeight.w500,
          fontSize:
              3.792*SizeConfig.heightMultiplier),
    ),
    toolbarHeight: 8.6376*SizeConfig.heightMultiplier,
    elevation: 5,
    shadowColor: Colors.grey,
  );
}

Widget textFieldStaff(
    String label,
    String title,
    TextEditingController textCOntroller,
    String value) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
          color: Colors.grey.shade700,
          fontSize:
              1.9*SizeConfig.heightMultiplier,
        ),
      ),
      SizedBox(
        height: 1.2113*SizeConfig.heightMultiplier,
      ),
      FormField(builder: (context) {
        return TextField(
          controller: textCOntroller,
          decoration: InputDecoration(
            label: Text(
              label,
              style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize:
                     1.9487*SizeConfig.heightMultiplier),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0.421*SizeConfig.heightMultiplier),
              borderSide: BorderSide(color: Colors.grey.shade500),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0.421*SizeConfig.heightMultiplier),
              borderSide: const BorderSide(color:Colours.BUTTON_COLOR_1),
            ),
          ),
        );
      })
    ],
  );
}

Widget multipleWidget() {
  return Container(
    height: 6.846*SizeConfig.heightMultiplier,
    decoration: BoxDecoration(
        color:Colours.BUTTON_COLOR_2, borderRadius: BorderRadius.circular(0.632*SizeConfig.heightMultiplier)),
    child: Center(
      child: Text(
        "Now Add Multiple Staff using Attend Ease App",
        style: TextStyle(
            color: Colours.BUTTON_COLOR_1,
            fontSize:
                1.9382*SizeConfig.heightMultiplier,
            fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget numberFieldStaff(
    
    String label,
    String title,
    TextEditingController textCOntroller,
    String value) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
          color: Colors.grey.shade700,
          fontSize:
            1.843*SizeConfig.heightMultiplier
        ),
      ),
      SizedBox(
        height:1.2113*SizeConfig.heightMultiplier,
      ),
      Row(
        children: [
          Container(
            height: 6.1622*SizeConfig.heightMultiplier,
            width: 15.848*SizeConfig.widthMultiplier,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0.6320*SizeConfig.heightMultiplier),
                border: Border.all(color: Colors.grey.shade500)),
            child: Center(
              child: Text(
                "+91 ",
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontFamily: "Tansek",
                  fontSize: 3.5288*SizeConfig.heightMultiplier,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 4.6875*SizeConfig.widthMultiplier,
          ),
          Expanded(
            child: FormField(builder: (context) {
              return TextField(
                keyboardType: TextInputType.phone,
                controller: textCOntroller,
                decoration: InputDecoration(
                  label: Text(
                    label,
                    style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 1.948*SizeConfig.heightMultiplier),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0.4213*SizeConfig.heightMultiplier),
                    borderSide: BorderSide(color: Colors.grey.shade500),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0.4213*SizeConfig.heightMultiplier),
                    borderSide: const BorderSide(color: Colours.BUTTON_COLOR_1),
                  ),
                ),
              );
            }),
          ),
        ],
      )
    ],
  );
}

Widget addText() {
  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.contacts_rounded,
          color: Colours.BUTTON_COLOR_1,
          size: 3.1601*SizeConfig.heightMultiplier,
        ),
        Text(
          "  Add from Contacts",
          style: TextStyle(
            color: Colours.BUTTON_COLOR_1,
            fontWeight: FontWeight.bold,
            fontSize:
                2.528*SizeConfig.heightMultiplier,
          ),
        ),
      ],
    ),
  );
}

Widget addEmployeeButton(void Function() onTap, BuildContext context,String text) {
  return InkWell(
    onTap: onTap,
    child: Container(
      margin:
          EdgeInsets.symmetric(horizontal: 0 ),
      padding: EdgeInsets.symmetric(
          horizontal: 1.1160*SizeConfig.widthMultiplier,
          vertical: 0.5266*SizeConfig.heightMultiplier),
      height: 6.5311*SizeConfig.heightMultiplier,
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(0.632*SizeConfig.heightMultiplier),
          color:Colours.BUTTON_COLOR_1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
                color: Colors.white,
                fontSize:
                   2.5280*SizeConfig.heightMultiplier,
                fontWeight: FontWeight.bold),
          ),
          IconButton(
            icon: Icon(
              Icons.arrow_circle_right,
              color: Colors.white,
              size: 3.3181*SizeConfig.heightMultiplier,
            ),
            onPressed: () {},
          )
        ],
      ),
    ),
  );
}