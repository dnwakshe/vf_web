import 'package:flutter/material.dart';
import 'package:vf_app/constants/app_colors.dart';
import 'package:vf_app/constants/app_textstyle.dart';
import 'package:vf_app/constants/assets_constants.dart';
import 'package:vf_app/utils/utils.dart';
import 'package:vf_app/utils/widgets/UIComponents/svg_widget_custom.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController controller;
  const SearchTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    double screenHeight = Utils.screenHeight;
    double screenWidth = Utils.screenWidth;
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: AppColors.borderColorTextField)
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: screenHeight * 0.003),
        child: Row(
          children: [
            SvgWidgetCustom(svgPath: AssetsConstants.searchIconTextField, height: screenHeight * 0.03,),
            SizedBox(width: screenWidth * 0.03,),
            Container(
              height: screenHeight * 0.028,
              width: 1,
              color: AppColors.borderColorTextField,
            ),
            SizedBox(width: screenWidth * 0.03,),
            Expanded(
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: AppTextStyle.h6_14Px(color: AppColors.textColor3),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
