// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:attend_ease/providers/attendance/employee_attendance_provider.dart';
import 'package:attend_ease/styling/colors.dart';
import 'package:attend_ease/services/employeeService.dart';
import 'package:attend_ease/styling/sizeconfig.dart';
import 'package:attend_ease/widgets/employee/employee_main_widgets.dart';
import 'package:flutter/material.dart';
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
  List<DateTime> redDates = [];
  List<dynamic> temp = [];

  //* Format the dates at which employee is present
  void fetchDates(List<dynamic> list) {
    redDates.clear();
    for (var record in list) {
      if (record['isPresent'] == true) {
        String dateString = record['Date'];
        List<String> parts = dateString.split('-');
        if (parts.length == 3) {
          try {
            int day = int.parse(parts[0]);
            int month = int.parse(parts[1]);
            int year = int.parse(parts[2]);
            redDates.add(DateTime(year, month, day));
          } catch (e) {
            debugPrint("Error parsing date: $e");
          }
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final provider = context.read<EmployeeAttendanceProvider>();
      await provider.fetchAttendanceList(context).then((_) {
        fetchDates(provider.attendanceRecords);
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colours.BUTTON_COLOR_2,
        body: SingleChildScrollView(
          child: Consumer<EmployeeAttendanceProvider>(
            builder: (context, provider, _) {
              return provider.isLoadingList
                  ? Center(
                      child: SpinKitFadingCircle(
                        color: Colours.DARK_BLUE,
                        size: 8.42699 * SizeConfig.heightMultiplier,
                      ),
                    )
                  : provider.attendanceRecords.isEmpty
                      ? Center(
                          child: Text("No Records Available"),
                        )
                      : Container(
                          color: Colours.BUTTON_COLOR_2,
                          padding: EdgeInsets.symmetric(
                              horizontal: 1.11607 * SizeConfig.widthMultiplier),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 2.1067 * SizeConfig.heightMultiplier,
                              ),
                              // Heading widget
                              ExpansionTile(
                                title: Center(
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
                                                blurRadius: 2),
                                          ],
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 3.3707 *
                                              SizeConfig.heightMultiplier,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                children: [
                                  Container(
                                    color: Colors.white,
                                    child: TableCalendar(
                                      rowHeight:
                                          5.2668 * SizeConfig.heightMultiplier,
                                      daysOfWeekHeight:
                                          4.21349 * SizeConfig.heightMultiplier,
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
                                        formatButtonVisible: false,
                                      ),
                                      calendarStyle: const CalendarStyle(
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
                                        weekendTextStyle:
                                            TextStyle(color: Colors.red),
                                      ),
                                      calendarBuilders: CalendarBuilders(
                                        defaultBuilder: (context, day, _) {
                                          bool isRedDate = redDates.any(
                                            (redDate) =>
                                                redDate.year == day.year &&
                                                redDate.month == day.month &&
                                                redDate.day == day.day,
                                          );

                                          return Container(
                                            decoration: BoxDecoration(
                                              color: isRedDate
                                                  ? Colors.green
                                                  : Colors.transparent,
                                              shape: BoxShape.circle,
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
                                height: 1.4747 * SizeConfig.heightMultiplier,
                              ),
                              attendanceReport(
                                context,
                                provider.attendanceRecords,
                              ),
                            ],
                          ),
                        );
            },
          ),
        ),
      ),
    );
  }
}
