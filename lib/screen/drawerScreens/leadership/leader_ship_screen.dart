import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vf_app/constants/app_colors.dart';
import 'package:vf_app/constants/assets_constants.dart';
import 'package:vf_app/constants/string_constants.dart';
import 'package:vf_app/constants/text_widgets.dart';
import 'package:vf_app/utils/utils.dart';
import 'package:vf_app/utils/widgets/UIComponents/custom_app_bar.dart';

class LeaderShipScreen extends StatefulWidget {
  const LeaderShipScreen({super.key});

  @override
  State<LeaderShipScreen> createState() => _LeaderShipScreenState();
}

class _LeaderShipScreenState extends State<LeaderShipScreen> {
  double screenHeight = Utils.screenHeight;
  double screenWidth = Utils.screenWidth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomAppBar(
        title: StringConstants.leadershipTxt.tr(),
        showNotificationIcon: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.04, vertical: screenHeight * 0.01),
        child: ListView(
          children: [
            Image.asset(AssetsConstants.leadershipImage),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            const TextH6(
              title: "Shri Eknath Shinde",
              weight: FontWeight.w600,
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            const TextH6(
              title:
                  "Eknath Sambhaji Shinde is an Indian politician serving as the 20th and Current Chief Minister of Maharashtra He was earlier the Cabinet Minister of Urban Development and Public Works (Public Undertakings) in the Government Of Maharashtra. He is a Member of Legislative Assembly from Kopri-Pachpakhadi constituency of Thane, Maharashtra. He has been elected consecutively for 4 terms in the Maharashtra Legislative Assembly in 2004, 2009, 2014 and 2019.",
              weight: FontWeight.w400,
              color: AppColors.captionColor,
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            const TextH6(
              title:
                  "Shinde was introduced to politics by then Thane Shivsena President Anand Dighe in early 1980. Shinde became successor to Dighe's legacy after his death in 2001. He is elected as Member of Legislative Assembly since 2004 for four consecutive terms.",
              weight: FontWeight.w400,
              color: AppColors.captionColor,
            ),
          ],
        ),
      ),
    );
  }
}
