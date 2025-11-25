import 'package:flutter/material.dart';
import 'package:vf_app/utils/utils.dart';

import 'app_colors.dart';

class AppTextStyle {
  static TextStyle noteText = TextStyle(
      fontSize: Utils.screenWidth * 0.035, fontWeight: FontWeight.w400);

  static TextStyle permissionRegular = TextStyle(
      fontSize: Utils.screenWidth * 0.04,
      fontWeight: FontWeight.w400,
      color: AppColors.black);

  static TextStyle buttonText = TextStyle(
      fontWeight: FontWeight.normal, fontSize: Utils.screenWidth * 0.045);

  static TextStyle titleText = TextStyle(
      fontWeight: FontWeight.w500, fontSize: Utils.screenWidth * 0.04);

  static TextStyle appbarFont = TextStyle(
      fontWeight: FontWeight.w500, fontSize: Utils.screenWidth * 0.06);

  static TextStyle sliderTitle = TextStyle(
      fontFamily: 'Outfit',
      fontWeight: FontWeight.w500,
      fontSize: Utils.screenWidth * 0.045,
      color: AppColors.white);

  static TextStyle sliderSubtext = TextStyle(
      fontFamily: 'Outfit',
      fontWeight: FontWeight.w400,
      fontSize: Utils.screenWidth * 0.04,
      color: AppColors.white);

      static TextStyle titleTextStyle({Color? color, FontWeight? weight, bool isWeb=false}){
        return TextStyle(
      fontSize:isWeb?Utils.screenWidth * 0.020: Utils.screenWidth * 0.035, fontWeight: weight ?? FontWeight.w100, color: color ?? AppColors.black);
      }

  static TextStyle h1_24Px({Color? color, FontWeight? weight}){
    return TextStyle(
        fontSize: Utils.screenWidth * 0.06, fontWeight: weight ?? FontWeight.normal, color: color ?? AppColors.black);
  }

  static TextStyle h2_22Px({Color? color, FontWeight? weight}){
    return TextStyle(
        fontSize: Utils.screenWidth * 0.05, fontWeight: weight ?? FontWeight.normal, color: color ?? AppColors.black);
  }

  static TextStyle h3_20Px({Color? color, FontWeight? weight}){
    return TextStyle(
        fontSize: Utils.screenWidth * 0.048, fontWeight: weight ?? FontWeight.normal, color: color ?? AppColors.black);
  }

  static TextStyle h4_18Px({Color? color, FontWeight? weight}){
    return TextStyle(
        fontSize: Utils.screenWidth * 0.042, fontWeight: weight ?? FontWeight.normal, color: color ?? AppColors.black);
  }

  static TextStyle h5_16Px({Color? color, FontWeight? weight, TextDecoration? textDecoration }){
    return  TextStyle(
        decoration: textDecoration ?? TextDecoration.none,
        fontSize: Utils.screenWidth * 0.04, fontWeight: weight ?? FontWeight.normal, color: color ?? AppColors.black);
  }

  static TextStyle h6_14Px({Color? color, FontWeight? weight,TextDecoration? textDecoration }){
    return TextStyle(
        decoration: textDecoration ?? TextDecoration.none,
        fontSize: Utils.screenWidth * 0.036, fontWeight: weight ?? FontWeight.normal, color: color ?? AppColors.black);
  }

  static TextStyle h7_12Px({Color? color, FontWeight? weight}){
    return  TextStyle(
        fontSize: Utils.screenWidth * 0.032, fontWeight: weight ?? FontWeight.normal, color: color ?? AppColors.black);
  }

  static TextStyle h8_10Px({Color? color, FontWeight? weight}){
    return TextStyle(
        fontSize: Utils.screenWidth * 0.026, fontWeight: weight ?? FontWeight.normal, color: color ?? AppColors.black);
  }
static TextStyle h9_8Px({Color? color, FontWeight? weight}){
    return TextStyle(
        fontSize: Utils.screenWidth * 0.018, fontWeight: weight ?? FontWeight.normal, color: color ?? AppColors.black);
  }

}
