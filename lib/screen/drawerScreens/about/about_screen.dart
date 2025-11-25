import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../constants/string_constants.dart';
import '../../../utils/utils.dart';
import '../../../utils/widgets/UIComponents/custom_app_bar.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  double screenHeight = Utils.screenHeight;
  double screenWidth = Utils.screenWidth;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: StringConstants.aboutPartyTxt.tr(),
        showNotificationIcon: true,
      ),
      body: Center(
        child: Text("Comming Soon"),
      ),
    );
  }
}
