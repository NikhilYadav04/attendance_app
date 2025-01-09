import 'package:attend_ease/styling/colors.dart';
import 'package:attend_ease/styling/sizeconfig.dart';
import 'package:flutter/material.dart';

AppBar appBEmployee(BuildContext context) {
  return AppBar(
    actions: [
      IconButton(onPressed: (){
        Navigator.pop(context);
      }, icon: Icon(Icons.exit_to_app))
    ],
    automaticallyImplyLeading: false,
    backgroundColor: Colors.white,
    title: Text(
      "Join Company Account",
      style: TextStyle(
          color: Colors.black,
          fontFamily: "Tansek",
          fontWeight: FontWeight.w500,
          fontSize:
              3.84481*SizeConfig.heightMultiplier),
    ),
    toolbarHeight: 8.4269*SizeConfig.heightMultiplier,
    elevation: 5,
    shadowColor: Colors.grey,
  );
}

Widget tileWidgetEmployee() {
  return Container(
    decoration: BoxDecoration(
        color: Colors.blue.shade50, borderRadius: BorderRadius.circular(0.4213*SizeConfig.heightMultiplier)),
    child: ListTile(
      title: Text(
        "Join Your Company's Group",
        style: TextStyle(
            fontFamily: "Tansek",
            fontSize:
                3.1601*SizeConfig.heightMultiplier,
            fontWeight: FontWeight.bold,
            color: Colors.blue.shade800),
      ),
      subtitle: Text(
        "Monitor your attendance digitally",
        style: TextStyle(
            fontFamily: "Tansek",
            fontSize:
                2.8*SizeConfig.heightMultiplier,
            fontWeight: FontWeight.w500,
            color: Colors.blue.shade800),
      ),
      trailing: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 3.5814*SizeConfig.heightMultiplier,
        child: Icon(
          Icons.security_update_good,
          color: Colors.blue.shade800,
          size: 2.8967*SizeConfig.heightMultiplier,
        ),
      ),
    ),
  );
}

Widget textFieldEmployee(String label, String title,TextEditingController textCOntroller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
          color: Colors.grey.shade800,
          fontSize:
              1.896*SizeConfig.heightMultiplier,
        ),
      ),
      SizedBox(
        height: 1.053*SizeConfig.heightMultiplier,
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
              borderRadius: BorderRadius.circular(0.4213*SizeConfig.heightMultiplier),
              borderSide: BorderSide(color: Colors.grey.shade500),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0.4213*SizeConfig.heightMultiplier),
              borderSide: const BorderSide(color: Colours.BUTTON_COLOR_1),
            ),
          ),
        );
      })
    ],
  );
}
