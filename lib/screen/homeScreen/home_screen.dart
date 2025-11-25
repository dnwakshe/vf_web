import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vf_app/constants/app_colors.dart';
import 'package:vf_app/constants/assets_constants.dart';
import 'package:vf_app/constants/string_constants.dart';
import 'package:vf_app/constants/text_widgets.dart';
import 'package:vf_app/screen/broadcast/newBroadcast/broadcast_screen.dart';
import 'package:vf_app/screen/community/community_screen.dart';
import 'package:vf_app/screen/dashboard1/dashboard_screen.dart';
import 'package:vf_app/screen/homeScreen/drawer_widget.dart';
import 'package:vf_app/screen/notifications/notifications_screen.dart';
import 'package:vf_app/utils/utils.dart';
import 'package:vf_app/utils/widgets/UIComponents/svg_widget_custom.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  double screenHeight = Utils.screenHeight;
  double screenWidth = Utils.screenWidth;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      setState(() {
        _currentIndex = tabController.index;
      });
    });
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const DrawerWidget(),
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.04),
          child: GestureDetector(
            onTap: () {
              log("onTap:");
              _scaffoldKey.currentState!.openDrawer();
            },
            child: const SvgWidgetCustom(svgPath: AssetsConstants.menuIcon),
          ),
        ),
        title: TextH4(
          title: _currentIndex == 0
              ? StringConstants.homeTxt.tr()
              : _currentIndex == 1
              ? StringConstants.communityTxt.tr()
              : StringConstants.broadcastTxt.tr(),
          color: AppColors.textColor,
          weight: FontWeight.w500,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.white,
        actions: [
          Visibility(
            visible: _currentIndex == 1 ? false : true,
            child: const SvgWidgetCustom(svgPath: AssetsConstants.searchIcon),
          ),
          SizedBox(width: screenWidth * 0.02),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NotificationsScreen(),
                ),
              );
            },
            child: const SvgWidgetCustom(
              svgPath: AssetsConstants.notificationIcon,
            ),
          ),
          SizedBox(width: screenWidth * 0.04),
        ],
      ),
      body: BottomBar(
        width: screenWidth * 1,
        borderRadius: BorderRadius.circular(50),
        body: (BuildContext context, ScrollController controller) {
          return SizedBox(
            width: double.infinity,
            child: TabBarView(
              controller: tabController,
              children: const <Widget>[
                DashboardScreen(),
                CommunityScreen(),
                NewBroadcastScreen(),
              ],
            ),
          );
        },
        child: TabBar(
          indicator: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
          indicatorPadding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.015,
            horizontal: screenWidth * 0.03,
          ),
          splashBorderRadius: BorderRadius.circular(50),
          controller: tabController,
          tabs: [
            bottomNavItem(
              StringConstants.homeTxt.tr(),
              AssetsConstants.homeIcon,
              0,
            ),
            bottomNavItem(
              StringConstants.communityTxt.tr(),
              AssetsConstants.communityIcon,
              1,
            ),
            bottomNavItem(
              StringConstants.broadcastTxt.tr(),
              AssetsConstants.broadcastIcon,
              2,
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomNavItem(String title, String icon, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              color: _currentIndex == index ? AppColors.primary : Colors.grey,
            ),
            if (_currentIndex == index)
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.01),
                child: TextH7(
                  title: title,
                  color: _currentIndex == index
                      ? AppColors.primary
                      : Colors.grey,
                  weight: FontWeight.w400,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
