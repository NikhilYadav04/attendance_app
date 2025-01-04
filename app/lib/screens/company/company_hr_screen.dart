import 'package:attend_ease/helper/helper_functions.dart';
import 'package:attend_ease/providers/company/company_main_screen_provider.dart';
import 'package:attend_ease/screens/leave/hr_leave_list.dart';
import 'package:attend_ease/styling/colors.dart';
import 'package:attend_ease/styling/scale.dart';
import 'package:attend_ease/screens/company/approval_req_screen.dart';
import 'package:attend_ease/screens/company/company_hr_screen_1.dart';
import 'package:attend_ease/screens/company/staff_list_screen.dart';
import 'package:attend_ease/widgets/company/company_hr_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class CompanyHrScreen extends StatefulWidget {
  const CompanyHrScreen({super.key});

  @override
  State<CompanyHrScreen> createState() => _CompanyHrScreenState();
}

class _CompanyHrScreenState extends State<CompanyHrScreen>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;
  String? companyName = "";

  void _getName() async {
    String? name = await HelperFunctions.getCompanyName();
    setState(() {
      companyName = name;
    });
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    _getName();
     WidgetsBinding.instance.addPostFrameCallback((_) async{
      final provider = context.read<CompanyMainScreenProvider>();
      provider.profile_url = await HelperFunctions.getProfilePhoto() ?? "";
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabController.dispose();
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
            preferredSize: Size.fromHeight(
                responsiveContainerSize(75, currentWidth, currentHeight)),
            child: Consumer<CompanyMainScreenProvider>(
              builder: (context, provider, _) {
                return AppBar(
                  automaticallyImplyLeading: false,
                  elevation: 0,
                  toolbarHeight:
                      responsiveContainerSize(75, currentWidth, currentHeight),
                  title: appBtitleHR(
                      currentWidth, currentHeight, textScale, companyName,context,(){
                        provider.uploadImageGalleryLocalStorage(context);
                      },(){
                        provider.uploadImageGalleryLocalStorage(context);
                      },provider.isProfile,provider.profile_url),
                  actions: [
                    provider.isLoading
                        ? SpinKitSquareCircle(
                            color: Colors.black,
                            size: 30,
                          )
                        : IconButton(
                            onPressed: () {
                              provider.logoutCompany(context);
                            },
                            icon: Icon(
                              Icons.exit_to_app_rounded,
                              size: responsiveContainerSize(
                                  32, currentWidth, currentHeight),
                            ),
                          )
                  ],
                );
              },
            ),
          ),
          body: Consumer<CompanyMainScreenProvider>(
            builder: (context, provider, _) {
              return Column(
                children: [
                  TabBar(
                    padding: EdgeInsets.only(
                        top: 4 * verticalPaddingFactor(currentHeight)),
                    indicatorColor: Colours.DARK_BLUE,
                    indicatorWeight: 1,
                    controller: tabController,
                    tabs: [
                      Tab(
                        icon: Icon(
                          Icons.home,
                          size: responsiveContainerSize(
                              34, currentWidth, currentHeight),
                          color: Colours.DARK_BLUE,
                        ),
                      ),
                      Tab(
                        icon: Icon(
                          Icons.list,
                          size: responsiveContainerSize(
                              34, currentWidth, currentHeight),
                          color: Colours.DARK_BLUE,
                        ),
                      ),
                      Tab(
                        icon: Icon(
                          Icons.list_alt_sharp,
                          size: responsiveContainerSize(
                              34, currentWidth, currentHeight),
                          color: Colours.DARK_BLUE,
                        ),
                      ),
                       Tab(
                        icon: Icon(
                          Icons.event_available,
                          size: responsiveContainerSize(
                              34, currentWidth, currentHeight),
                          color: Colours.DARK_BLUE,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: tabController,
                      children: const [
                        CompanyHrScreen1(),
                        ApprovalReqScreen(),
                        StaffListScreen(),
                        HrLeaveList()
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
