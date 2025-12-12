import 'package:flutter/material.dart';
import 'package:vf_app/constants/app_colors.dart';
import 'package:vf_app/constants/text_widgets.dart';
import 'package:vf_app/screen/broadcast/model/get_member_list_model.dart';

class MemberItemCardWidget extends StatefulWidget {
  final GetMemberDatum datum;

  const MemberItemCardWidget({super.key, required this.datum});

  @override
  _MemberItemCardWidgetState createState() => _MemberItemCardWidgetState();
}

class _MemberItemCardWidgetState extends State<MemberItemCardWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextH6(
                title: widget.datum.memberName!,
                color: AppColors.textColor,
                weight: FontWeight.w500,
              ),
            ),
            Checkbox(
              value: isChecked,
              onChanged: (bool? newValue) {
                setState(() {
                  isChecked = newValue!;
                });
              },
            ),
          ],
        ),
        TextH7(
          title: widget.datum.memberDesignation!,
          color: AppColors.textColor4,
          weight: FontWeight.w500,
        ),
      ],
    );
  }
}
