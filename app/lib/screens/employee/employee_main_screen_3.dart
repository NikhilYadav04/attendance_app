// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:attend_ease/providers/attendance/employee_attendance_provider.dart';
import 'package:attend_ease/styling/colors.dart';
import 'package:attend_ease/globalobjects/variables.dart';
import 'package:attend_ease/services/employeeService.dart';
import 'package:attend_ease/widgets/employee/employee_main_widgets.dart';
import 'package:flutter/material.dart';

import 'package:attend_ease/styling/scale.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

// ignore: must_be_immutable
class EmployeeMainScreen3 extends StatefulWidget {
  double width;
  double height;
  double textScaleFactor;

  EmployeeMainScreen3({
    Key? key,
    required this.width,
    required this.height,
    required this.textScaleFactor,
  }) : super(key: key);

  @override
  State<EmployeeMainScreen3> createState() => _EmployeeMainScreen3State();
}

class _EmployeeMainScreen3State extends State<EmployeeMainScreen3> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  final Employeeservice employeeservice = Employeeservice();
  List<dynamic> redDates = [];

  //* Format the dates at which employee is present
  void fetchDates(List<dynamic> list) {
    for (int i = 0; i < list.length; i++) {
      if (list[i]['isPresent'] == true) {
        String DateString = list[i]['Date'];
        List<String> parts = DateString.split('/');
        // splits the date sring by '/'
        int day = int.parse(parts[0]);
        int month = int.parse(parts[1]);
        int year = int.parse('20${parts[2]}');
        redDates.add(DateTime.utc(year, month, day));
        print("list is ${list}");
        print("list is $redDates}");
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() {
      final provider = context.read<EmployeeAttendanceProvider>();
      fetchDates(provider.attendanceRecords);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: Consumer<EmployeeAttendanceProvider>(
      builder: (context, provider, _) {
        return provider.isLoadingList
            ? SpinKitFadingCircle(
                color: Colours.DARK_BLUE,
                size: 80,
              )
            : provider.attendanceRecords.isEmpty
                ? Center(
                    child: Text("No Records Available"),
                  )
                : Container(
                    color: Colours.BUTTON_COLOR_2,
                    padding: EdgeInsets.symmetric(
                        horizontal: 3 * horizontalPaddingFactor(widget.height)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: responsiveContainerSize(
                              18, widget.width, widget.height),
                        ),
                        // heading widget
                        ExpansionTile(
                          title: Container(
                            child: Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Attendance Report",
                                    style: GoogleFonts.montserrat(
                                        shadows: [
                                          Shadow(
                                              color: Colors.yellow,
                                              blurRadius:
                                                  responsiveBorderRadius(
                                                      2,
                                                      widget.width,
                                                      widget.height))
                                        ],
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: responsiveFontSize(
                                            30,
                                            widget.width,
                                            widget.height,
                                            widget.textScaleFactor)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          children: [
                            Container(
                              color: Colors.white,
                              child: TableCalendar(
                                rowHeight: 50,
                                daysOfWeekHeight: 40,
                                firstDay: DateTime.utc(2024, 1, 1),
                                lastDay: DateTime.utc(2025, 12, 1),
                                focusedDay: _focusedDay,
                                calendarFormat: _calendarFormat,
                                selectedDayPredicate: (day) {
                                  return isSameDay(_selectedDay, day);
                                },
                                onDaySelected: (selectedDay, focusedDay) {
                                  setState(() {
                                    _selectedDay = selectedDay;
                                    _focusedDay = focusedDay;
                                  });
                                },
                                headerStyle: const HeaderStyle(
                                    titleCentered: true,
                                    formatButtonVisible: false),
                                calendarStyle: const CalendarStyle(
                                  // Customizing the appearance of the calendar
                                  todayDecoration: BoxDecoration(
                                    color: Colors.blue,
                                    shape: BoxShape.rectangle,
                                  ),
                                  selectedDecoration: BoxDecoration(
                                    color: Colors.yellow,
                                    shape: BoxShape.rectangle,
                                  ),
                                  defaultDecoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                  ),
                                  weekendTextStyle: TextStyle(
                                      color: Colors
                                          .red), // Example of weekend text color
                                ),
                                calendarBuilders: CalendarBuilders(
                                  defaultBuilder: (context, day, focusedDay) {
                                    bool isRedDate = redDates.contains(day);

                                    return Container(
                                      decoration: BoxDecoration(
                                        color: isRedDate
                                            ? Colors.green
                                            : Colors.transparent,
                                        shape: BoxShape.circle,
                                        // borderRadius: BorderRadius.circular(8.0),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        day.day.toString(),
                                        style: TextStyle(
                                          color: isRedDate
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: responsiveContainerSize(
                              20, widget.width, widget.height),
                        ),
                        attendanceReport(
                            widget.width,
                            widget.height,
                            widget.textScaleFactor,
                            context,
                            provider.attendanceRecords)
                      ],
                    ),
                  );
      },
    ));
  }
}
