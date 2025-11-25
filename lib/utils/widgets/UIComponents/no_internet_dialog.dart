import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vf_app/constants/app_colors.dart';
import 'package:vf_app/constants/assets_constants.dart';
import 'package:vf_app/constants/text_widgets.dart';
import 'package:vf_app/utils/check_connectivity.dart';
import 'package:vf_app/utils/utils.dart';

class NoInternetDialog extends StatelessWidget {
  const NoInternetDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      title: const TextH4(
        title: "No Internet Connection",
        color: AppColors.textColor,
        weight: FontWeight.w600,
      ),
      content: Lottie.asset(
        AssetsConstants.noInternetLottie,
        repeat: true,
        animate: true,
      ),
      actions: [
        TextButton(
          onPressed: () async{
            bool isInternet = await CheckConnectivity().checkConnectivity();
            if(isInternet){
              Navigator.of(context).pop();
            }else{
              Utils.showCustomSnackBar(context, "Please try again");
            }
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
