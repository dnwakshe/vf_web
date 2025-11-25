import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vf_app/constants/app_colors.dart';
import 'package:vf_app/constants/assets_constants.dart';
import 'package:vf_app/constants/string_constants.dart';
import 'package:vf_app/constants/text_widgets.dart';
import 'package:vf_app/utils/utils.dart';
import 'package:vf_app/utils/widgets/UIComponents/svg_widget_custom.dart';

class CommunityItemCard extends StatelessWidget {
  const CommunityItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = Utils.screenHeight;
    double screenWidth = Utils.screenWidth;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
      child: Row(
        children: [
          Image.asset(AssetsConstants.shivSenaImage, height: screenHeight * 0.065,),
          SizedBox(width: screenWidth * 0.04,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    TextH6(title: "Shivsena", color: AppColors.textColor, weight: FontWeight.w500,),
                    SizedBox(width: screenWidth * 0.02,),
                    SvgWidgetCustom(svgPath: AssetsConstants.verifiedIcon, height: screenHeight * 0.025,),
                  ],
                ),
                SizedBox(height: screenHeight * 0.005,),
                TextH7(title: "13K Followers", color: AppColors.textColor2, weight: FontWeight.w400,),
              ],
            ),
          ),
          Container(
            height: screenHeight * 0.065,
            // width:screenWidth * 0.25,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: AppColors.cardBackground
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
              child: Center(child: TextH5(title: StringConstants.followTxt.tr(), color: AppColors.primary, weight: FontWeight.w600,)),
            ),
          )
        ],
      ),
    );
  }
}
