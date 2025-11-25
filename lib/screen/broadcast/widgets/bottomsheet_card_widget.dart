import 'package:flutter/material.dart';
import 'package:vf_app/constants/app_colors.dart';
import 'package:vf_app/constants/text_widgets.dart';
import 'package:vf_app/utils/utils.dart';

class BottomSheetCardWidget extends StatefulWidget {
  const BottomSheetCardWidget({super.key});

  @override
  State<BottomSheetCardWidget> createState() => _BottomSheetCardWidgetState();
}

class _BottomSheetCardWidgetState extends State<BottomSheetCardWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextH6(
                title: "Shri. Shrirang Chandu Barne",
                color: AppColors.textColor,
                weight: FontWeight.w500,
              ),
              SizedBox(height: Utils.screenHeight * 0.008),
              TextH7(
                title: "Upnete + MP (Maval)",
                color: AppColors.textColor4,
                weight: FontWeight.w500,
              ),
            ],
          ),
        ),
        Checkbox(
          value: isSelected,
          onChanged: (bool? value) {
            setState(() {
              isSelected = value!;
            });
          },
        ),
      ],
    );
  }
}
