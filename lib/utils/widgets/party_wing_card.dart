import 'package:flutter/material.dart';
import 'package:vf_app/constants/app_colors.dart';
import 'package:vf_app/constants/assets_constants.dart';
import 'package:vf_app/constants/text_widgets.dart';
import 'package:vf_app/utils/utils.dart';
import 'package:vf_app/utils/widgets/UIComponents/svg_widget_custom.dart';

class PartyWingCard extends StatelessWidget {
  final String title;
  final String description;
  const PartyWingCard( {super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Utils.screenHeight * 0.008),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.05),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: Utils.screenWidth * 0.04, vertical: Utils.screenHeight * 0.02),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextH6(title: title, color: AppColors.textColor, weight: FontWeight.w500,),
                    SizedBox(height: Utils.screenHeight * 0.01,),
                    TextH7(title: description, color: AppColors.captionColor, weight: FontWeight.w400,)
                  ],
                ),
              ),
              const SvgWidgetCustom(svgPath: AssetsConstants.forwardArrowIos)
            ],
          ),
        ),
      ),
    );
  }
}
