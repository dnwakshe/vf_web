import 'package:flutter/material.dart';
import 'package:vf_app/constants/app_colors.dart';
import 'package:vf_app/constants/text_widgets.dart';
import 'package:vf_app/utils/utils.dart';

class CustomButton extends StatelessWidget {
  final void Function() onPressed;
  final String buttonText;
  final bool? isWeb;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    this.isWeb,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        minimumSize: Size(double.infinity, Utils.screenHeight * 0.06),
        elevation: 0,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: isWeb ?? false
              ? TextH9(
                  title: buttonText,
                  color: AppColors.white,
                  weight: FontWeight.w600,
                )
              : TextH5(
                  title: buttonText,
                  color: AppColors.white,
                  weight: FontWeight.w600,
                ),
        ),
      ),
    );
  }
}
