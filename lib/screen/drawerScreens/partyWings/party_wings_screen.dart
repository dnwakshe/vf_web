import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vf_app/constants/string_constants.dart';
import 'package:vf_app/screen/drawerScreens/partyWings/model/party_wings_response_model.dart';
import 'package:vf_app/screen/drawerScreens/partyWings/provider/partyWings_provider.dart';
import 'package:vf_app/utils/utils.dart';
import 'package:vf_app/utils/widgets/UIComponents/custom_app_bar.dart';
import 'package:vf_app/utils/widgets/party_wing_card.dart';

class PartyWingsScreen extends StatefulWidget {
  const PartyWingsScreen({super.key, });

  @override
  State<PartyWingsScreen> createState() => _PartyWingsScreenState();
}

class _PartyWingsScreenState extends State<PartyWingsScreen> {
  double screenHeight = Utils.screenHeight;
  double screenWidth = Utils.screenWidth;

  late PartyWingsProvider partyWingProvider;
  List<PartyWingsList>? partyWingsList;

  @override
  void initState() {
    partyWingProvider = context.read<PartyWingsProvider>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      dynamic request ={
        "search": ""
      };
        await partyWingProvider.getPartyWings(context, request);
      },
    );
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    partyWingProvider = context.watch<PartyWingsProvider>();
    return Scaffold(
      appBar:  CustomAppBar(
        title: StringConstants.partyWingsTxt.tr(),
        showNotificationIcon: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.04, vertical: screenHeight * 0.01),
        child: ListView.builder(
            itemCount: partyWingProvider.partyWingsList?.length,
            itemBuilder: (context,index){
            return PartyWingCard(
              title: partyWingProvider.partyWingsList != null
                  ? partyWingProvider.partyWingsList![index].name!.split("(")[0]
                  : "No Name",
              description: partyWingProvider.partyWingsList != null
                   ? partyWingProvider.partyWingsList![index].name!.substring(partyWingProvider.partyWingsList![index].name!.indexOf("(") + 1,
                  partyWingProvider.partyWingsList![index].name!.indexOf(")"))
                  :"NO description"
            );
            })
      ),
    );
  }
}
