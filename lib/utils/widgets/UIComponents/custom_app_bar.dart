import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:vf_app/constants/app_colors.dart';
import 'package:vf_app/constants/assets_constants.dart';
import 'package:vf_app/constants/text_widgets.dart';
import 'package:vf_app/screen/notifications/notifications_screen.dart';
import 'package:vf_app/utils/utils.dart';
import 'package:vf_app/utils/widgets/UIComponents/svg_widget_custom.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool? showNotificationIcon;
  final bool? popAll;
  final bool? showSearchIcon;

  const CustomAppBar(
      {super.key,
      required this.title,
      required this.showNotificationIcon,
      this.popAll,
      this.showSearchIcon});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: EdgeInsets.only(left: Utils.screenWidth * 0.04),
        child: GestureDetector(
          onTap: () {
            log("onTap:");
            Navigator.of(context).pop();
          },
          child: const SvgWidgetCustom(
            svgPath: AssetsConstants.backArrow,
          ),
        ),
      ),
      title: TextH4(
        title: title,
        color: AppColors.textColor,
        weight: FontWeight.w500,
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: AppColors.white,
      actions: [
        Visibility(
          visible: showSearchIcon ?? false,
          child: Row(
            children: [
              const SvgWidgetCustom(
                svgPath: AssetsConstants.searchIcon,
              ),
              SizedBox(
                width: Utils.screenWidth * 0.02,
              ),
            ],
          ),
        ),
        Visibility(
          visible: showNotificationIcon ?? false,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const NotificationsScreen()));
                },
                child: const SvgWidgetCustom(
                  svgPath: AssetsConstants.notificationIcon,
                ),
              ),
              SizedBox(
                width: Utils.screenWidth * 0.04,
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
