import 'package:attend_ease/helper/helper_functions.dart';
import 'package:attend_ease/providers/employee/employee_main_screen_provider.dart';
import 'package:attend_ease/screens/leave/employee_leave_list.dart';
import 'package:attend_ease/styling/colors.dart';
import 'package:attend_ease/screens/employee/employee_main_screen_1.dart';
import 'package:attend_ease/screens/employee/employee_main_screen_2.dart';
import 'package:attend_ease/screens/employee/employee_main_screen_3.dart';
import 'package:attend_ease/styling/sizeconfig.dart';
import 'package:attend_ease/widgets/employee/employee_main_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class EmployeeMainScreen extends StatefulWidget {
  const EmployeeMainScreen({super.key});

  @override
  State<EmployeeMainScreen> createState() => _EmployeeMainScreenState();
}

class _EmployeeMainScreenState extends State<EmployeeMainScreen>
    with SingleTickerProviderStateMixin {
  late final TabController? tabController;
  late String employeeName = "";

  //* for displaying employee name
  Future<void> _setName() async {
    var name = await HelperFunctions.getEmployeeName();
    setState(() {
      employeeName = name!;
    });
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    _setName();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final provider = context.read<EmployeeMainScreenProvider>();
      provider.profile_url = await HelperFunctions.getProfilePhoto() ?? "";
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentHeight = MediaQuery.of(context).size.height;
    final currentWidth = MediaQuery.of(context).size.width;
    final textScale = MediaQuery.of(context).textScaleFactor;

    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize:
                Size.fromHeight(8.42699 * SizeConfig.heightMultiplier),
            child: Consumer<EmployeeMainScreenProvider>(
              builder: (context, provider, _) {
                return AppBar(
                  elevation: 0,
                  toolbarHeight: 8.42699 * SizeConfig.heightMultiplier,
                  title: appBartitle(employeeName, context, () {
                    provider.uploadImageCameraLocalStorage(context);
                  }, () {
                    provider.uploadImageGalleryLocalStorage(context);
                  }, provider.isProfile, provider.profile_url),
                  actions: [
                    provider.isLoading
                        ? SpinKitSquareCircle(
                            color: Colors.black,
                            size: 3.1601 * SizeConfig.heightMultiplier,
                          )
                        : IconButton(
                            onPressed: () {
                              provider.logoutEmployee(context);
                            },
                            icon: Icon(
                              Icons.exit_to_app,
                              size: 3.6 * SizeConfig.heightMultiplier,
                            ),
                          ),
                  ],
                );
              },
            ),
          ),
          body: Column(
            children: [
              TabBar(
                padding:
                    EdgeInsets.only(top: 0.42134 * SizeConfig.heightMultiplier),
                indicatorColor: Colours.DARK_BLUE,
                indicatorWeight: 1,
                controller: tabController,
                tabs: [
                  Tab(
                    icon: Icon(
                      Icons.home,
                      size: 3.8974 * SizeConfig.heightMultiplier,
                      color: Colours.DARK_BLUE,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.person,
                      size: 3.8974 * SizeConfig.heightMultiplier,
                      color: Colours.DARK_BLUE,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.list_alt,
                      size: 3.8974 * SizeConfig.heightMultiplier,
                      color: Colours.DARK_BLUE,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.event_available,
                      size: 3.8974 * SizeConfig.heightMultiplier,
                      color: Colours.DARK_BLUE,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    EmployeeMainScreen1(),
                    EmployeeMainScreen2(),
                    EmployeeMainScreen3(
                      width: currentWidth,
                      height: currentHeight,
                      textScaleFactor: textScale,
                    ),
                    EmployeeLeaveList()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
