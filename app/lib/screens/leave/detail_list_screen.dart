import 'package:attend_ease/styling/sizeconfig.dart';
import 'package:attend_ease/widgets/company/company_hr_widgets.dart';
import 'package:attend_ease/widgets/leave/leave_widgets.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailListScreen extends StatefulWidget {
  DetailListScreen(
      {super.key,
      required this.title,
      required this.bgColor,
      required this.borderColor,
      required this.list});
  String title;
  Color borderColor;
  Color bgColor;
  List<dynamic> list;

  @override
  State<DetailListScreen> createState() => _DetailListScreenState();
}

class _DetailListScreenState extends State<DetailListScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: widget.list.length == 0
            ? Center(
                child: Text(
                  "No Leave Records Founds",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Kumbh-Med",
                      fontWeight: FontWeight.bold,
                      fontSize: 2.1067*SizeConfig.heightMultiplier),
                ),
              )
            : Column(
                children: [
                  SizedBox(
                    height: 3.1601*SizeConfig.heightMultiplier,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.6785*SizeConfig.widthMultiplier),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          approveTextEmployee( "${widget.title} Leaves"),
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(
                                Icons.logout,
                                size: 4.0028*SizeConfig.heightMultiplier,
                                color: Colors.black,
                              ))
                        ]),
                  ),
                  SizedBox(
                    height: 1.5800*SizeConfig.heightMultiplier,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.6785*SizeConfig.widthMultiplier),
                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: widget.list.length,
                        itemBuilder: (context, index) {
                          return leaveCard(
                              context,
                              widget.list[index]["employeeID"],
                              "${widget.list[index]["Start_Date"]} - ${widget.list[index]["End_Date"]}",
                              "${widget.list[index]["Leave_Title"]}",
                              widget.borderColor,
                              widget.bgColor);
                        }),
                  )
                ],
              ),
      ),
    ));
  }
}
