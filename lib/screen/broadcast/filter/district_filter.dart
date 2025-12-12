import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vf_app/constants/app_colors.dart';
import 'package:vf_app/constants/text_widgets.dart';
<<<<<<< HEAD
import 'package:vf_app/screen/broadcast/model/district_list_model.dart';
=======
import 'package:vf_app/main.dart';
import 'package:vf_app/screen/broadcast/model/district_list_model.dart';
import 'package:vf_app/screen/broadcast/model/party_designations_model.dart';
>>>>>>> 027bce8cbfc59bc57ec502c974ca59433750a853
import 'package:vf_app/screen/broadcast/model/state_list_model.dart';
import 'package:vf_app/screen/broadcast/provider/broadcast_provider.dart';
import 'package:vf_app/utils/utils.dart';

class DistrictFilter extends StatefulWidget {
  final StateBody? stateBody;
  final Function(DistrictListDatum?) onSelected;
  const DistrictFilter({super.key, required this.onSelected, this.stateBody});

  @override
  State<DistrictFilter> createState() => _DistrictFilterState();
}

class _DistrictFilterState extends State<DistrictFilter> {
  late BroadcastProvider broadcastProvider;
  int? selectedIndex; // Keeps track of the selected tile index (null means no selection)

  @override
  void initState() {
    broadcastProvider = context.read<BroadcastProvider>();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if(widget.stateBody == null){
        Utils.showCustomSnackBar(context, "Please select state");
      }else{
        dynamic request = {
          "limit":1000,
          "offset":0,
          "state_id": widget.stateBody!.id!
          // "search":"Pune"
        };
        broadcastProvider.getDistrictList(context: context, request: request);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    broadcastProvider = context.watch<BroadcastProvider>();
    return broadcastProvider.districtList.isNotEmpty ? ListView.separated(
      itemCount: broadcastProvider.districtList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        bool isSelected = selectedIndex == index; // Check if the current tile is selected
        return ListTile(
          dense: true,
          selected: isSelected, // Highlight the selected tile
          tileColor: isSelected ? AppColors.primaryWithOpacity : AppColors.white, // Apply different colors
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
          selectedTileColor: AppColors.primaryWithOpacity,
          onTap: () {
            setState(() {
              // Toggle selection: if tapped again, deselect
              if (selectedIndex == index) {
                selectedIndex = null; // Deselect if the same item is tapped
              } else {
                selectedIndex = index; // Select the tapped item
                widget.onSelected(broadcastProvider.districtList[index]);
              }
            });
            log("onTapFilter: ${broadcastProvider.districtList[index].name}");
          },
          title: TextH5(title: broadcastProvider.districtList[index].name!),
        );
      },
      separatorBuilder: (context, index) {
        return Divider(
          color: AppColors.dividerColor2,
          height: Utils.screenHeight * 0.003,
          thickness: 0.5,
        );
      },
    ): const Center(child: TextH5(title: "No Districts Available"),);
  }
}
