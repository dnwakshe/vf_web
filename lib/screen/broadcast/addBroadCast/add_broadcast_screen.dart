import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vf_app/constants/assets_constants.dart';
import 'package:vf_app/constants/string_constants.dart';
import 'package:vf_app/screen/broadcast/addBroadCast/post%20Message/post_message_screen.dart';
import 'package:vf_app/utils/utils.dart';
import 'package:vf_app/utils/widgets/UIComponents/custom_app_bar.dart';
import 'package:vf_app/utils/widgets/UIComponents/custom_button.dart';

class AddBroadcastScreen extends StatefulWidget {
  const AddBroadcastScreen({super.key});

  @override
  State<AddBroadcastScreen> createState() => _AddBroadcastScreenState();
}

class _AddBroadcastScreenState extends State<AddBroadcastScreen> {
  int selectedIndex = -1;
  double screenHeight = Utils.screenHeight;
  double screenWidth = Utils.screenWidth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: StringConstants.newBroadcastTxt.tr(),
        showNotificationIcon: true,
      ),
      body: Column(
        children: [
          card(1),
        ],
      ),
    );
  }

  Widget card(
    int index,
  ) {
    bool isSelected = selectedIndex == index;
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: screenHeight * 0.1,
        horizontal: screenWidth * 0.1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(AssetsConstants.message),
          ),
          SizedBox(
            height: screenHeight * 0.1,
          ),
          CustomButton(
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>  const PostMessageScreen()));
              },
              buttonText: "Host Meeting"),
          SizedBox(
            height: screenHeight * 0.01,
          ),
          CustomButton(
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context)=> ));
              },
              buttonText: "Hot Message")
        ],
      ),
    );
  }
}
