import 'package:flutter/material.dart';
import 'package:vf_app/constants/app_colors.dart';
import 'package:vf_app/constants/assets_constants.dart';
import 'package:vf_app/constants/text_widgets.dart';
import 'package:vf_app/utils/utils.dart';

class UpcomingMeetingItem extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final bool isOnline;
  const UpcomingMeetingItem({super.key, required this.title, required this.description, required this.date, required this.isOnline});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Utils.screenHeight * 0.01),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            AssetsConstants.shivSenaImage,
            height: Utils.screenHeight * 0.052,
          ),
          SizedBox(width: Utils.screenWidth * 0.03),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextH7(title: title,
                      weight: FontWeight.w500,
                    ),
                    TextH7(title: isOnline ? "Online" : "Offline", color: AppColors.primary),
                  ],
                ),
                SizedBox(height: Utils.screenHeight * 0.01),
                TextH7(title: description,
                  weight: FontWeight.w500,
                  color: AppColors.textColor4,
                ),
                SizedBox(height: Utils.screenHeight * 0.001),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextH7(title: date,
                      weight: FontWeight.w500,
                      color: AppColors.textColor4,
                    ),
                    InkWell(
                      onTap: () {
                        // Define action when "Join" is tapped
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: Utils.screenHeight * 0.01, horizontal: Utils.screenHeight * 0.02),
                        decoration: BoxDecoration(
                          color: AppColors.primaryWithOpacity,
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: const TextH7(
                          title: "Join",
                          weight: FontWeight.w500,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class UpcomingMeetingModel {
  final String title;
  final String description;
  final String date;
  final bool isOnline;
  UpcomingMeetingModel(this.title, this.description, this.date, this.isOnline);
}
