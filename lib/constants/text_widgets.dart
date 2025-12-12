import 'package:flutter/material.dart';
import 'package:vf_app/constants/app_colors.dart';
import 'package:vf_app/constants/app_textstyle.dart';

class TitleText extends StatelessWidget {
  final String title;
  final Color? color;
  final FontWeight? weight;
  final TextAlign? textAlign;
  final bool? isWeb;
  const TitleText({
    super.key,
    required this.title,
    this.color,
    this.weight,
    this.textAlign,
    this.isWeb = false,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign ?? TextAlign.start,
      style: AppTextStyle.titleTextStyle(
        color: color ?? AppColors.textColor,
        weight: weight,
        isWeb: isWeb??false,
      ),
    );
  }
}

class TextH1 extends StatelessWidget {
  final String title;
  final Color? color;
  final FontWeight? weight;
  final TextAlign? textAlign;

  const TextH1({
    super.key,
    required this.title,
    this.color,
    this.weight,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign ?? TextAlign.start,
      style: AppTextStyle.h1_24Px(
        color: color ?? AppColors.textColor,
        weight: weight,
      ),
    );
  }
}

class TextH2 extends StatelessWidget {
  final String title;
  final Color? color;
  final FontWeight? weight;
  final TextAlign? textAlign;

  const TextH2({
    super.key,
    required this.title,
    this.color,
    this.weight,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign ?? TextAlign.start,
      style: AppTextStyle.h2_22Px(
        color: color ?? AppColors.textColor,
        weight: weight,
      ),
    );
  }
}

class TextH3 extends StatelessWidget {
  final String title;
  final Color? color;
  final FontWeight? weight;
  final TextAlign? textAlign;

  const TextH3({
    super.key,
    required this.title,
    this.color,
    this.weight,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign ?? TextAlign.start,
      style: AppTextStyle.h3_20Px(
        color: color ?? AppColors.textColor,
        weight: weight,
      ),
    );
  }
}

class TextH4 extends StatelessWidget {
  final String title;
  final Color? color;
  final FontWeight? weight;
  final TextAlign? textAlign;

  const TextH4({
    super.key,
    required this.title,
    this.color,
    this.weight,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign ?? TextAlign.start,
      style: AppTextStyle.h4_18Px(
        color: color ?? AppColors.textColor,
        weight: weight,
      ),
    );
  }
}

class TextH5 extends StatelessWidget {
  final String title;
  final Color? color;
  final FontWeight? weight;
  final TextAlign? textAlign;

  const TextH5({
    super.key,
    required this.title,
    this.weight,
    this.color,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign ?? TextAlign.start,
      style: AppTextStyle.h5_16Px(
        color: color ?? AppColors.textColor,
        weight: weight,
      ),
    );
  }
}

class TextH6 extends StatelessWidget {
  final String title;
  final Color? color;
  final FontWeight? weight;
  final TextAlign? textAlign;

  const TextH6({
    super.key,
    required this.title,
    this.color,
    this.weight,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign ?? TextAlign.start,
      style: AppTextStyle.h6_14Px(
        color: color ?? AppColors.textColor,
        weight: weight,
      ),
    );
  }
}

class TextH7 extends StatelessWidget {
  final String title;
  final Color? color;
  final FontWeight? weight;
  final TextAlign? textAlign;

  const TextH7({
    super.key,
    required this.title,
    this.color,
    this.weight,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign ?? TextAlign.start,
      style: AppTextStyle.h7_12Px(
        color: color,
        weight: weight ?? FontWeight.w400,
      ),
    );
  }
}

class TextH8 extends StatelessWidget {
  final String title;
  final Color? color;
  final FontWeight? weight;
  final TextAlign? textAlign;

  const TextH8({
    super.key,
    required this.title,
    this.color,
    this.weight,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign ?? TextAlign.start,
      style: AppTextStyle.h8_10Px(
        color: color ?? AppColors.textColor,
        weight: weight,
      ),
    );
  }
}
class TextH9 extends StatelessWidget {
  final String title;
  final Color? color;
  final FontWeight? weight;
  final TextAlign? textAlign;

  const TextH9({
    super.key,
    required this.title,
    this.color,
    this.weight,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign ?? TextAlign.start,
      style: AppTextStyle.h9_8Px(
        color: color ?? AppColors.textColor,
        weight: weight,
      ),
    );
  }
}

class SubmitButtonText extends StatelessWidget {
  final String title;

  const SubmitButtonText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyle.h5_16Px(
        color: AppColors.white,
        weight: FontWeight.w700,
      ),
    );
  }
}
