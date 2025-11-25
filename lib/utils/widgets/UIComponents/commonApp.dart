import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vf_app/constants/app_colors.dart';
import 'package:vf_app/constants/app_textstyle.dart';

class CommonAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CommonAppBar({
    Key? key,
    this.onleadingPressed,
    required this.title,
    this.actions,
  }) : super(key: key);
  final Function()? onleadingPressed;
  final String title;
  final List<Widget>? actions;

  @override
  State<CommonAppBar> createState() => _CommonAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CommonAppBarState extends State<CommonAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: AppColors.secondry,
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Text(widget.title, maxLines: 2, style: AppTextStyle.appbarFont),
      leading: widget.onleadingPressed == null
          ? const SizedBox()
          : IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: AppColors.secondry,
              ),
              onPressed: widget.onleadingPressed,
            ),
      actions: widget.actions,
    );
  }
}
