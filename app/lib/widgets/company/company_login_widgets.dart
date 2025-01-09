import 'package:attend_ease/styling/sizeconfig.dart';
import 'package:flutter/material.dart';

AppBar appBLoginCompany(BuildContext context,void Function() onTap) {
  return AppBar(
    actions: [
      IconButton(onPressed: (){
        onTap;
        Navigator.pop(context);
      }, icon: Icon(Icons.exit_to_app))
    ],
    automaticallyImplyLeading: false,
    backgroundColor: Colors.white,
    title: Text(
      "Join Company as HR",
      style: TextStyle(
          color: Colors.black,
          fontFamily: "Tansek",
          fontWeight: FontWeight.w500,
          fontSize:
              3.8448*SizeConfig.heightMultiplier),
    ),
    toolbarHeight: 8.6376*SizeConfig.heightMultiplier,
    elevation: 5,
    shadowColor: Colors.grey,
  );
}

Widget tileWidgetLoginCompany() {
  return Container(
    decoration: BoxDecoration(
        color: Colors.blue.shade50, borderRadius: BorderRadius.circular(0.42134*SizeConfig.heightMultiplier)),
    child: ListTile(
      title: Text(
        "Lead Your Company's Group",
        style: TextStyle(
            fontFamily: "Tansek",
            fontSize:
                3.1601*SizeConfig.heightMultiplier,
            fontWeight: FontWeight.bold,
            color: Colors.blue.shade800),
      ),
      subtitle: Text(
        "Monitor your staff's attendance",
        style: TextStyle(
            fontFamily: "Tansek",
            fontSize:
                2.7387*SizeConfig.heightMultiplier,
            fontWeight: FontWeight.w500,
            color: Colors.blue.shade800),
      ),
      trailing: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 2.4227*SizeConfig.heightMultiplier,
        child: Icon(
          Icons.security_update_good,
          color: Colors.blue.shade800,
          size: 2.7387*SizeConfig.heightMultiplier,
        ),
      ),
    ),
  );
}