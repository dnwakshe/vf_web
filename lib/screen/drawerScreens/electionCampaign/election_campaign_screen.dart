import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vf_app/constants/app_colors.dart';
import 'package:vf_app/constants/assets_constants.dart';
import 'package:vf_app/constants/string_constants.dart';
import 'package:vf_app/utils/utils.dart';
import 'package:vf_app/utils/widgets/UIComponents/custom_app_bar.dart';
import 'package:vf_app/utils/widgets/UIComponents/svg_widget_custom.dart';

class ElectionCampaignScreen extends StatefulWidget {
  const ElectionCampaignScreen({super.key});

  @override
  State<ElectionCampaignScreen> createState() => _ElectionCampaignScreenState();
}

class _ElectionCampaignScreenState extends State<ElectionCampaignScreen> {
  double screenHeight = Utils.screenHeight;
  double screenWidth = Utils.screenWidth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: StringConstants.electionCampaignTxt.tr(),
        showNotificationIcon: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            electionCampaignCard(AssetsConstants.mask2Image,),
            SizedBox(height: screenHeight * 0.01),
            electionCampaignCard(AssetsConstants.mask1Image, ),
            SizedBox(height: screenHeight * 0.01),
            electionCampaignCard(AssetsConstants.mask3Image,),
            SizedBox(height: screenHeight * 0.01),
            electionCampaignCard(AssetsConstants.mask4Image,),
          ],
        ),
      ),
    );
  }

  Widget electionCampaignCard(String image) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: screenHeight * 0.03),
      child: Column(
        children: [
          Image.asset(
            image,
            fit: BoxFit.fitHeight,
            width: double.infinity,
            height: screenHeight * 0.29,
          ),
          SizedBox(height: screenHeight * 0.01),
          Container(
            height: screenHeight * 0.1,
            width: double.infinity,
            color: AppColors.gradient4,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03, vertical: screenHeight * 0.01),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                   CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.primary.withOpacity(0.2),
                    child:  SvgWidgetCustom(
                      svgPath: AssetsConstants.facebookIcon,
                      height: screenHeight * 0.03,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.03),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.primary.withOpacity(0.2),
                    child:  SvgWidgetCustom(
                      svgPath: AssetsConstants.downloadIcon,
                      height: screenHeight * 0.03,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.03),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.primary.withOpacity(0.2),
                    child:  SvgWidgetCustom(
                      svgPath: AssetsConstants.twitterIcon,
                      height: screenHeight * 0.03,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  }
