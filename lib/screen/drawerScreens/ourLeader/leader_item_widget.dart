import 'package:flutter/material.dart';
import 'package:vf_app/constants/app_colors.dart';
import 'package:vf_app/constants/text_widgets.dart';
import 'package:vf_app/screen/drawerScreens/ourLeader/model/our_leader_model.dart';
import 'package:vf_app/utils/utils.dart';

class LeaderItemWidget extends StatelessWidget {
  final OurLeaderDatum datum;
  const LeaderItemWidget({super.key, required this.datum});

  @override
  Widget build(BuildContext context) {
    String name = datum.name!.split(",z")[0];
    String designation =  datum.name!.split(",").isNotEmpty && datum.name!.split(",").length >1 ? datum.name!.split(",")[1]:
    datum.designation!;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: Utils.screenHeight * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextH5(
            title: name,
            color: AppColors.black,
            weight: FontWeight.w600,
          ),
          SizedBox(height: Utils.screenHeight * 0.008,),
          TextH6(
            title: designation,
            color: AppColors.textColor,
            weight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
