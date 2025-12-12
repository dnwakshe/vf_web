import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vf_app/constants/app_colors.dart';
import 'package:vf_app/constants/assets_constants.dart';
import 'package:vf_app/constants/string_constants.dart';
import 'package:vf_app/constants/text_widgets.dart';
import 'package:vf_app/screen/drawerScreens/leadership/leader_ship_screen.dart';
import 'package:vf_app/screen/drawerScreens/liveScreen/live_screen.dart';
import 'package:vf_app/screen/drawerScreens/neteScreen/nete_screen.dart';
import 'package:vf_app/screen/drawerScreens/ourLeader/our_leader_screen.dart';
import 'package:vf_app/screen/drawerScreens/partyWings/party_wings_screen.dart';
import 'package:vf_app/screen/drawerScreens/upcomingEvents/upcoming_events_screen.dart';
import 'package:vf_app/screen/login/login_screen.dart';
import 'package:vf_app/utils/utils.dart';
import 'package:vf_app/utils/widgets/UIComponents/svg_widget_custom.dart';

<<<<<<< HEAD
=======
import '../dashboard1/dashboard_screen.dart';
>>>>>>> 027bce8cbfc59bc57ec502c974ca59433750a853
import '../drawerScreens/about/about_screen.dart';
import '../drawerScreens/electionCampaign/election_campaign_screen.dart';
import '../drawerScreens/media/media_screen.dart';
import 'home_screen.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  int _selectedIndex = 0;

  double screenHeight = Utils.screenHeight;
  double screenWidth = Utils.screenWidth;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Utils.screenWidth * 0.04),
          child: Column(
            children: <Widget>[
              drawerHeader(),
              SizedBox(height: Utils.screenHeight * 0.02),
              _buildDrawerItem(AssetsConstants.dashboardIcon,
                  StringConstants.homeTxt.tr(), 0,
                  screen: HomeScreen()),
              _buildDrawerItem(AssetsConstants.aboutPartyIcon,
                  StringConstants.aboutPartyTxt.tr(), 1,
                  screen: AboutScreen()),
              _buildDrawerItem(AssetsConstants.ourLeaderIcon,
                  StringConstants.ourLeaderTxt.tr(), 2,
                  screen: const OurLeaderScreen()),
              _buildDrawerItem(AssetsConstants.leadershipIcon,
                  StringConstants.leadershipTxt.tr(), 3,
                  screen: const LeaderShipScreen()),
              _buildDrawerItem(AssetsConstants.partyWingsIcon,
                  StringConstants.partyWingsTxt.tr(), 4,
                  screen: const PartyWingsScreen()),
              _buildDrawerItem(AssetsConstants.partyWingsIcon,
                  StringConstants.liveTxt.tr(), 5,
                  screen: const LiveScreen()),
              _buildDrawerItem(
                  AssetsConstants.galleryIcon, StringConstants.mediaTxt.tr(), 6,
                  screen: MediaScreen()),
              _buildDrawerItem(AssetsConstants.drawerClockIcon,
                  StringConstants.upcomingEventsTxt.tr(), 7,
                  screen: const UpcomingEventsScreen()),
              _buildDrawerItem(AssetsConstants.electionIcon,
                  StringConstants.electionCampaignTxt.tr(), 11,
                  screen: const ElectionCampaignScreen()),
              _buildDrawerItem(
                  AssetsConstants.neteIcon, StringConstants.neteTxt.tr(), 8,
                  screen: const NeteScreen()),
              const Spacer(),
              _buildDrawerItem(AssetsConstants.logoutIcon,
                  StringConstants.changeLanguage.tr(), 9, isFunctions: true,
                  onTap: () {
                // Navigator.of(context).pop();
                showChangeLanguageBottomSheet(context);
              }),
              _buildDrawerItem(AssetsConstants.logoutIcon,
                  StringConstants.logoutTxt.tr(), 10, isFunctions: true,
                  onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget drawerHeader() {
    return Row(
      children: [
        CircleAvatar(
          radius: 35,
          backgroundColor: AppColors.circleAvatarBackground,
          child: Image.asset(
            AssetsConstants.personIcon,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: Utils.screenWidth * 0.01),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextH5(
                title: "Aniket Dhanak",
                weight: FontWeight.w600,
                color: AppColors.semiBoldTextColor,
              ),
              SizedBox(height: Utils.screenHeight * 0.005),
              const TextH7(
                title: "aniket.dhanak@choicetechlab.com",
                weight: FontWeight.w500,
                color: AppColors.captionColor,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDrawerItem(String icon, String title, int index,
      {Widget? screen, bool? isFunctions, Function()? onTap}) {
    return Expanded(
      child: ListTile(
        leading: SvgWidgetCustom(
          svgPath: icon,
        ),
        title: TextH5(
          title: title,
          weight: _selectedIndex == index ? FontWeight.w600 : FontWeight.w400,
          color:
              _selectedIndex == index ? AppColors.white : AppColors.textColor,
        ),
        selected: _selectedIndex == index,
        selectedTileColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        onTap: isFunctions ?? false
            ? onTap
            : () {
                setState(() {
                  _selectedIndex = index;
                });
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        screen ??
                        TextH5(
                          title: title,
                          color: Colors.white,
                        )));
              },
      ),
    );
  }

  void showChangeLanguageBottomSheet(BuildContext context) {
    var result = showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
            // height: Utils.screenHeight * 0.,
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextH3(
                  title: "Choose Language",
                  weight: FontWeight.w600,
                  color: AppColors.textColor,
                ),
                SizedBox(
                  height: Utils.screenHeight * 0.01,
                ),
                const Divider(
                  thickness: 1,
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.language),
                  title: const TextH5(title: "English"),
                  onTap: () async {
                    setState(() {
                      EasyLocalization.of(context)?.setLocale(Locale("en"));
                    });
                    // changeLanguage("en");
                    Navigator.pop(context);
                  },
                ),
                const Divider(
                  thickness: 1,
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.language),
                  title: const TextH5(title: "मराठी"),
                  onTap: () async {
                    setState(() {
                      EasyLocalization.of(context)!.setLocale(Locale("mr"));
                    });
                    // changeLanguage("mr");
                    Navigator.pop(context);
                  },
                ),
              ],
            ));
      },
    ).then((value) {
      Navigator.of(context).pop();
    });
  }
}
