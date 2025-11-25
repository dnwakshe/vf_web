import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vf_app/constants/assets_constants.dart';
import 'package:vf_app/constants/string_constants.dart';
import 'package:vf_app/utils/utils.dart';
import 'package:vf_app/utils/widgets/UIComponents/custom_app_bar.dart';
class LiveScreen extends StatefulWidget {
  const LiveScreen({super.key});

  @override
  State<LiveScreen> createState() => _LiveScreenState();
}

class _LiveScreenState extends State<LiveScreen> {
  double screenHeight = Utils.screenHeight;
  double screenWidth = Utils.screenWidth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: StringConstants.liveTxt.tr(),
        showNotificationIcon: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
        child: SingleChildScrollView(
          child: Column(
            children: [
              liveCard(AssetsConstants.eknathImage),
              liveCard(AssetsConstants.eknathImage),
              liveCard(AssetsConstants.eknathImage),
              liveCard(AssetsConstants.eknathImage),
            ],
          ),
        ),
      ),
    );
  }
  Widget liveCard(String image) {
    return Column(
      children: [
        Image.asset(
          image,
          fit: BoxFit.scaleDown,
          width: double.infinity,
          height: screenHeight * 0.29,
        ),
      ],
    );
  }
}
