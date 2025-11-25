import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vf_app/constants/app_colors.dart';
import 'package:vf_app/constants/text_widgets.dart';
import 'package:vf_app/main.dart';
import 'package:vf_app/screen/drawerScreens/ourLeader/leader_item_widget.dart';
import 'package:vf_app/screen/drawerScreens/ourLeader/provider/our_leader_provider.dart';
import 'package:vf_app/utils/utils.dart';
import 'package:vf_app/utils/widgets/UIComponents/custom_app_bar.dart';

class OurLeaderScreen extends StatefulWidget {
  const OurLeaderScreen({super.key});

  @override
  State<OurLeaderScreen> createState() => _OurLeaderScreenState();
}

class _OurLeaderScreenState extends State<OurLeaderScreen> {
  double screenHeight = Utils.screenHeight;
  double screenWidth = Utils.screenWidth;

  late OurLeaderProvider ourLeaderProvider;

  @override
  void initState() {
    super.initState();
    ourLeaderProvider = context.read<OurLeaderProvider>();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        dynamic request = {"search": ""};
        await ourLeaderProvider.getLeadersList(
            context: context, request: request);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ourLeaderProvider = context.watch<OurLeaderProvider>();
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Our Leaders",
        showNotificationIcon: false,
        showSearchIcon: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.04, vertical: screenHeight * 0.01),
        child: ourLeaderProvider.isLoading
            ? const CircularProgressIndicator()
            : ListView(
                children: [
                  if (ourLeaderProvider.leadersList.isNotEmpty)
                    ListView.separated(
                        shrinkWrap: true,
                        itemCount: ourLeaderProvider.leadersList.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return LeaderItemWidget(
                            datum: ourLeaderProvider.leadersList[index],
                          );
                        },
                      separatorBuilder: (context, index) {
                        return Divider(
                          color: AppColors.dividerColor2,
                          height: Utils.screenHeight * 0.003,
                          thickness: 0.5,
                        );
                      },
                    )
                  else
                    const Center(
                      child: TextH5(title: "No Data Found"),
                    )
                ],
              ),
      ),
    );
  }
}
