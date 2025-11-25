import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vf_app/constants/app_colors.dart';
import 'package:vf_app/constants/app_textstyle.dart';
import 'package:vf_app/constants/text_widgets.dart';
import 'package:vf_app/utils/utils.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final TextInputType? textInputType;
  final int? maxLength;
  final Color? labelColor;
  final FontWeight? labelFontWeight;
  final bool? showSuffixIcon;
  final Widget? suffixIcon;
  final bool? readOnly;
  final bool? isObscureText;
  final void Function()? onTap;
  final void Function(String)? onSubmit;
  final void Function()? onEditingComplete;
  final void Function(String)? onChanged;
  final TextCapitalization? textCapitalization;
  final String? Function(String?)? validator;
  final int? maxLine;
  final List<TextInputFormatter>? inputFormatters;
  final bool? isWeb;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.textInputType,
    this.maxLength,
    required this.validator,
    this.showSuffixIcon,
    this.labelColor,
    this.labelFontWeight,
    required this.labelText,
    this.suffixIcon,
    this.readOnly,
    this.onTap,
    this.onChanged,
    this.isObscureText,
    this.textCapitalization,
    this.inputFormatters,
    this.maxLine,
    this.onSubmit,
    this.onEditingComplete,
    this.isWeb,
  });

  @override
  Widget build(BuildContext context) {
    var height = isWeb ?? false ? Utils.screenWidth : Utils.screenHeight;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isWeb ?? false
            ? TextH9(
                title: labelText,
                color: labelColor ?? AppColors.textGreyHint,
                textAlign: TextAlign.left,
                weight: labelFontWeight ?? FontWeight.w400,
              )
            : TextH6(
                title: labelText,
                color: labelColor ?? AppColors.textGreyHint,
                textAlign: TextAlign.left,
                weight: labelFontWeight ?? FontWeight.w400,
              ),
        SizedBox(height: height * 0.0050),
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: TextFormField(
            controller: controller,
            readOnly: readOnly ?? false,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onTap: onTap,
            maxLines: maxLine ?? 1,
            inputFormatters: inputFormatters,
            textCapitalization: textCapitalization ?? TextCapitalization.none,
            onChanged: onChanged,
            style: isWeb ?? false
                ? AppTextStyle.h9_8Px(
                    color: AppColors.hintColor,
                    weight: FontWeight.w400,
                  )
                : AppTextStyle.h6_14Px(
                    color: AppColors.inputFieldColor,
                    weight: FontWeight.w500,
                  ),
            onFieldSubmitted: onSubmit,
            onEditingComplete: onEditingComplete,
            decoration: InputDecoration(
              hintText: hintText,
              isDense: true,
              fillColor: AppColors.white,
              filled: true,
              counterText: '',
              hintStyle: isWeb ?? false
                  ? AppTextStyle.h9_8Px(
                      color: AppColors.hintColor,
                      weight: FontWeight.w400,
                    )
                  : AppTextStyle.h6_14Px(
                      color: AppColors.hintColor,
                      weight: FontWeight.w400,
                    ),
              errorStyle: const TextStyle(height: 0),
              border: border(),
              focusedBorder: border(),
              enabledBorder: border(),
              suffixIcon: Visibility(
                visible: showSuffixIcon ?? false,
                child: suffixIcon ?? const Icon(Icons.remove_red_eye),
              ),
            ),
            validator: validator,
            obscureText: isObscureText ?? false,
            keyboardType: textInputType ?? TextInputType.text,
            maxLength: maxLength ?? 50,
          ),
        ),
      ],
    );
  }

  OutlineInputBorder border() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.borderColor),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
