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
<<<<<<< HEAD
import 'package:vf_app/screen/drawerScreens/about_screen.dart';
import 'package:vf_app/screen/notifications/notifications_screen.dart';
import 'package:vf_app/utils/utils.dart';
import 'package:vf_app/utils/widgets/UIComponents/svg_widget_custom.dart';
import 'package:vf_app/utils/widgets/footer.dart';
=======
import 'package:vf_app/screen/notifications/notifications_screen.dart';
import 'package:vf_app/utils/utils.dart';
import 'package:vf_app/utils/widgets/UIComponents/svg_widget_custom.dart';
>>>>>>> 027bce8cbfc59bc57ec502c974ca59433750a853

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
<<<<<<< HEAD
    tabController = TabController(length: 4, vsync: this);
=======
    tabController = TabController(length: 3, vsync: this);
>>>>>>> 027bce8cbfc59bc57ec502c974ca59433750a853
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
<<<<<<< HEAD
    bool isWeb = screenWidth > 800;
    
    return Scaffold(
      key: _scaffoldKey,
      drawer: !isWeb ? const DrawerWidget() : null,
      appBar: AppBar(
        leading: !isWeb
            ? Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.04),
                child: GestureDetector(
                  onTap: () {
                    log("onTap:");
                    _scaffoldKey.currentState!.openDrawer();
                  },
                  child: const SvgWidgetCustom(svgPath: AssetsConstants.menuIcon),
                ),
              )
            : null,
=======
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
>>>>>>> 027bce8cbfc59bc57ec502c974ca59433750a853
        title: TextH4(
          title: _currentIndex == 0
              ? StringConstants.homeTxt.tr()
              : _currentIndex == 1
<<<<<<< HEAD
                  ? StringConstants.communityTxt.tr()
                  : _currentIndex == 2
                      ? StringConstants.broadcastTxt.tr()
                      : StringConstants.aboutNgoTxt.tr(),
          color: AppColors.textColor,
          weight: FontWeight.w500,
        ),
        centerTitle: !isWeb,
        elevation: 2,
        shadowColor: Colors.grey.withOpacity(0.2),
=======
              ? StringConstants.communityTxt.tr()
              : StringConstants.broadcastTxt.tr(),
          color: AppColors.textColor,
          weight: FontWeight.w500,
        ),
        centerTitle: true,
        elevation: 0,
>>>>>>> 027bce8cbfc59bc57ec502c974ca59433750a853
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
<<<<<<< HEAD
      body: isWeb ? _buildWebLayout(context) : _buildMobileLayout(),
    );
  }

  Widget _buildMobileLayout() {
    return BottomBar(
      width: screenWidth * 1,
      borderRadius: BorderRadius.circular(50),
      body: (BuildContext context, ScrollController controller) {
        return SizedBox(
          width: double.infinity,
            child: Scrollbar(
              controller: controller,
              child: TabBarView(
                controller: tabController,
                children: <Widget>[
                  Column(children: const [Expanded(child: DashboardScreen()), Footer()]),
                  Column(children: const [Expanded(child: CommunityScreen()), Footer()]),
                  Column(children: const [Expanded(child: NewBroadcastScreen()), Footer()]),
                  Column(children: const [Expanded(child: AboutScreen()), Footer()]),
                ],
              ),
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
          bottomNavItem(
            StringConstants.aboutNgoTxt.tr(),
            AssetsConstants.menuIcon,
            3,
          ),
        ],
      ),
    );
  }

  Widget _buildWebLayout(BuildContext context) {
    return Row(
      children: [
        // Elegant Side Navigation for Web
        Container(
          width: 280,
          color: AppColors.white,
          child: Column(
            children: [
              // Web Logo/Branding
              Container(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      StringConstants.appName.tr(),
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(thickness: 1),
              // Navigation Items
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    _buildWebNavItem(
                      StringConstants.homeTxt.tr(),
                      AssetsConstants.homeIcon,
                      0,
                    ),
                    _buildWebNavItem(
                      StringConstants.communityTxt.tr(),
                      AssetsConstants.communityIcon,
                      1,
                    ),
                    _buildWebNavItem(
                      StringConstants.broadcastTxt.tr(),
                      AssetsConstants.broadcastIcon,
                      2,
                    ),
                    _buildWebNavItem(
                      StringConstants.aboutNgoTxt.tr(),
                      AssetsConstants.menuIcon,
                      3,
                    ),
                  ],
                ),
              ),
              const Divider(thickness: 1),
              // Bottom Actions
              Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const NotificationsScreen(),
                        ),
                      );
                    },
                    icon: const SvgWidgetCustom(
                      svgPath: AssetsConstants.notificationIcon,
                    ),
                    label: Text(StringConstants.broadcastTxt.tr()),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Vertical Divider
        Container(
          width: 1,
          color: Colors.grey.shade200,
        ),
        // Main Content Area
        Expanded(
          child: Container(
            color: Colors.grey.shade50,
            child: Scrollbar(
              child: TabBarView(
                controller: tabController,
                children: <Widget>[
                  Column(children: const [Expanded(child: DashboardScreen()), Footer()]),
                  Column(children: const [Expanded(child: CommunityScreen()), Footer()]),
                  Column(children: const [Expanded(child: NewBroadcastScreen()), Footer()]),
                  Column(children: const [Expanded(child: AboutScreen()), Footer()]),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildWebNavItem(String title, String icon, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: _currentIndex == index
            ? AppColors.primary.withOpacity(0.1)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: _currentIndex == index
              ? AppColors.primary.withOpacity(0.3)
              : Colors.transparent,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            setState(() {
              _currentIndex = index;
              tabController.animateTo(index);
            });
          },
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                child: Row(
              children: [
                SvgPicture.asset(
                  icon,
                  color: _currentIndex == index ? AppColors.primary : Colors.grey,
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: _currentIndex == index
                          ? FontWeight.w600
                          : FontWeight.w500,
                      color: _currentIndex == index
                          ? AppColors.primary
                          : Colors.grey.shade700,
                    ),
                  ),
                ),
                if (_currentIndex == index)
                  Container(
                    width: 4,
                    height: 24,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
              ],
            ),
          ),
=======
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
>>>>>>> 027bce8cbfc59bc57ec502c974ca59433750a853
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
