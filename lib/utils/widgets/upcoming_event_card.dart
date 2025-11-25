import 'package:flutter/material.dart';
import 'package:vf_app/constants/app_colors.dart';
import 'package:vf_app/constants/assets_constants.dart';
import 'package:vf_app/constants/text_widgets.dart';
import 'package:vf_app/utils/utils.dart';
import 'package:vf_app/utils/widgets/UIComponents/svg_widget_custom.dart';

class UpcomingEventCard extends StatefulWidget {
  const UpcomingEventCard({super.key});

  @override
  State<UpcomingEventCard> createState() => _UpcomingEventCardState();
}

class _UpcomingEventCardState extends State<UpcomingEventCard> {
  double screenHeight = Utils.screenHeight;
  double screenWidth = Utils.screenWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: screenHeight * 0.09,
              decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  )),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.03,
                    vertical: screenHeight * 0.01),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextH6(
                        title: "Dasara Melava",
                        color: AppColors.primary,
                        weight: FontWeight.w500),
                    SizedBox(
                      height: screenHeight * 0.0050,
                    ),
                    const TextH7(
                        title:
                            "Shiv Sena has evolved into a formidable political entity championing the cause of Marathi...",
                        color: AppColors.textColor2,
                        weight: FontWeight.w400)
                  ],
                ),
              ),
            ),
            Container(
              height: screenHeight * 0.09,
              decoration: const BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  )),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.03,
                    vertical: screenHeight * 0.01),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SvgWidgetCustom(
                            height: screenHeight * 0.03,
                            svgPath: AssetsConstants.clockIcon),
                        SizedBox(
                          width: screenWidth * 0.03,
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              const TextH7(
                                title: "02 Oct 2025",
                                color: AppColors.primary,
                                weight: FontWeight.w500,
                              ),
                              SizedBox(
                                width: screenWidth * 0.015,
                              ),
                              Container(
                                height: 16,
                                width: 1.5,
                                decoration:
                                    const BoxDecoration(color: AppColors.black),
                              ),
                              SizedBox(
                                width: screenWidth * 0.015,
                              ),
                              const TextH7(
                                title: "5:00 pm - 10:00 pm",
                                color: AppColors.textColor3,
                                weight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                        SvgWidgetCustom(
                          height: screenHeight * 0.03,
                          svgPath: AssetsConstants.shareIcon,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    Row(
                      children: [
                        SvgWidgetCustom(
                            height: screenHeight * 0.03,
                            svgPath: AssetsConstants.locationIcon),
                        SizedBox(
                          width: screenWidth * 0.03,
                        ),
                        const Expanded(
                          child: TextH7(
                            title: "Shivtirth Dadar",
                            color: AppColors.textColor3,
                            weight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
