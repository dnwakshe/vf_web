import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vf_app/constants/app_colors.dart';
import 'package:vf_app/utils/widgets/UIComponents/no_internet_dialog.dart';

class Utils {
  static final Utils _utils = Utils._internal();

  factory Utils() => _utils;

  Utils._internal();

  static double screenHeight = 0.0;
  static double screenWidth = 0.0;

  static String deviceID = '';
  static String deviceName = '';
  static String uatUrl = '';
  static String liveUrl = '';

  static int success = 200;
  static int failure = 201;
  static int notFound = 400;
  static int tokenExpired = 401;
  static int serverError = 500;

  static defineScreenDimensions(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    log("screen_height: $screenHeight");
    log("screen_width: $screenWidth");
  }

  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }



  static void showCustomSnackBar(BuildContext context, String message,
      {Color backgroundColor = AppColors.primary, Color textColor = Colors.white}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: TextStyle(color: textColor)),
        backgroundColor: backgroundColor,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  static void openKeyboard(BuildContext context, FocusNode inputNode) {
    FocusScope.of(context).requestFocus(inputNode);
  }

  static String formatDate(String dateTime, String? dateFormat) {
    DateTime date = DateTime.parse(dateTime);
    final DateFormat formatter = DateFormat(dateFormat ?? 'dd-MM-yyyy');
    final String formatted = formatter.format(date);
    var selectedDate = formatted;
    log("date: $selectedDate");
    return selectedDate;
  }

  static void showNoInternetDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const NoInternetDialog();
      },
    );
  }


}
