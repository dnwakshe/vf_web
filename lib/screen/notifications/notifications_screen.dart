import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vf_app/constants/app_colors.dart';
import 'package:vf_app/constants/string_constants.dart';
<<<<<<< HEAD
=======
import 'package:vf_app/constants/text_widgets.dart';
>>>>>>> 027bce8cbfc59bc57ec502c974ca59433750a853
import 'package:vf_app/screen/notifications/notification_item_widget.dart';
import 'package:vf_app/utils/utils.dart';
import 'package:vf_app/utils/widgets/UIComponents/custom_app_bar.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  double screenHeight = Utils.screenHeight;
  double screenWidth = Utils.screenWidth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: StringConstants.notification.tr(), showNotificationIcon: false),
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05, vertical: screenHeight * 0.01),
        child: ListView.separated(
          itemCount: 10,
          itemBuilder: (context, index) {
            return const NotificationItemWidget();
          },
          separatorBuilder: (context, index) {
            return const Divider(
              color: AppColors.dividerColor,
              thickness: 0.5, // Adjust the thickness as needed
            );
          },
        ),
      ),
    );
  }
}
