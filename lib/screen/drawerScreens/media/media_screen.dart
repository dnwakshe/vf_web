import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../constants/string_constants.dart';
import '../../../utils/utils.dart';
import '../../../utils/widgets/UIComponents/custom_app_bar.dart';

class MediaScreen extends StatefulWidget {
  const MediaScreen({super.key});

  @override
  State<MediaScreen> createState() => _MediaScreenState();
}

class _MediaScreenState extends State<MediaScreen> {
  double screenHeight = Utils.screenHeight;
  double screenWidth = Utils.screenWidth;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: StringConstants.mediaTxt.tr(),
        showNotificationIcon: true,
      ),
      body: Center(
        child: Text("Comming Soon"),
      ),
    );
  }
}
