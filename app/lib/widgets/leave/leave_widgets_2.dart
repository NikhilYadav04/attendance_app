import 'package:attend_ease/helper/date_time_formatter.dart';
import 'package:attend_ease/styling/colors.dart';
import 'package:attend_ease/styling/sizeconfig.dart';
import 'package:attend_ease/widgets/leave/leave_widgets.dart';
import 'package:flutter/material.dart';

Widget dateField(
    String label,
    String title,
    TextEditingController textCOntroller,
    String value,
    BuildContext context1) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
          color: Colors.grey.shade700,
          fontSize:
              1.8434*SizeConfig.heightMultiplier,
        ),
      ),
      SizedBox(
        height:1.2640*SizeConfig.heightMultiplier,
      ),
      FormField(builder: (context) {
        return TextField(
          controller: textCOntroller,
          decoration: InputDecoration(
            suffixIcon: IconButton(
                onPressed: () {
                  _selectDate(context1, textCOntroller);
                  textCOntroller.text =
                      DateTimeFormatter.formatDate(textCOntroller.text);
                },
                icon: Icon(
                  Icons.calendar_month,
                  size: 2.5280*SizeConfig.heightMultiplier,
                  color: Colors.grey.shade700,
                )),
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

Future<void> _selectDate(
    BuildContext context, TextEditingController textController) async {
  DateTime? date = await showDatePicker(
    context: context,
    firstDate: DateTime(2000),
    initialDate: DateTime.now(),
    lastDate: DateTime(2100),
  );

  if (date != null) {
    String formattedDate =
        date.toString().split(" ")[0].split("-").reversed.join("-");
    textController.text = formattedDate;
    textController.text = DateTimeFormatter.formatDate(textController.text);
  }
}

Widget leaveCardList(BuildContext context, Color border, Color bg, List<dynamic> list) {
  return ListView.builder(
    itemCount: list.length,
    itemBuilder: (context, index) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 1.58006*SizeConfig.heightMultiplier),
        height: 16.8539*SizeConfig.heightMultiplier,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1.053 * SizeConfig.heightMultiplier),
          border: Border.all(color: border, width: 3),
          boxShadow: [BoxShadow(color: bg, spreadRadius: 2, blurRadius: 2)],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.125*SizeConfig.widthMultiplier, vertical:1.8960*SizeConfig.heightMultiplier),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                list[index]["employeeID"],
                style: style.copyWith(
                    color: Colors.black,
                    fontFamily: "Kumbh-Med",
                    fontWeight: FontWeight.bold,
                    fontSize: 2.5280*SizeConfig.heightMultiplier),
              ),
              SizedBox(
                height: 1.053 * SizeConfig.heightMultiplier,
              ),
              Text(
                "${list[index]["Start_Date"]} - ${list[index]["End_Date"]}",
                style: style.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 2.10674*SizeConfig.heightMultiplier),
              ),
              SizedBox(
                height: 1.053 * SizeConfig.heightMultiplier,
              ),
              Text(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                list[index]["Leave_Title"],
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
  });
}
