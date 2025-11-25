import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vf_app/constants/app_colors.dart';
import 'package:vf_app/constants/text_widgets.dart';
import 'package:vf_app/screen/broadcast/model/constituency_list_model.dart';
import 'package:vf_app/screen/broadcast/model/district_list_model.dart';
import 'package:vf_app/screen/broadcast/model/state_list_model.dart';
import 'package:vf_app/screen/broadcast/provider/broadcast_provider.dart';
import 'package:vf_app/utils/utils.dart';

class ConstituencyFilter extends StatefulWidget {
  final StateBody? stateBody;
  final DistrictListDatum? districtListBody;
  final Function(ConstituencyListDatum?) onSelected;
  const ConstituencyFilter({super.key, required this.onSelected, this.stateBody,this.districtListBody});

  @override
  State<ConstituencyFilter> createState() => _ConstituencyFilterState();
}

class _ConstituencyFilterState extends State<ConstituencyFilter> {
  late BroadcastProvider broadcastProvider;
  int? selectedIndex;

  @override
  void initState() {
    broadcastProvider = context.read<BroadcastProvider>();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if(widget.stateBody == null){
        if(widget.districtListBody == null){
          Utils.showCustomSnackBar(context, "Please select state");
        }
      }else{
        if(widget.districtListBody != null){
          dynamic request = {
            "offset": 0,
            "limit": 1000,
            "constituency_type": "legislative",
            "state_id": widget.stateBody!.id!,
            "search" : "",
            "district_id": widget.districtListBody!.id
            // "search":"Pune"
          };
          broadcastProvider.getConstituencyList(context: context, request: request);
        }else{
          dynamic request = {
            "offset": 0,
            "limit": 1000,
            "constituency_type": "legislative",
            "state_id": widget.stateBody!.id!,
            "search" : "",
          };
          broadcastProvider.getConstituencyList(context: context, request: request);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    broadcastProvider = context.watch<BroadcastProvider>();
    return broadcastProvider.constituencyList.isNotEmpty ? ListView.separated(
      itemCount: broadcastProvider.constituencyList.length,
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
                widget.onSelected(broadcastProvider.constituencyList[index]);
              }
            });
            log("onTapFilter: ${broadcastProvider.constituencyList[index].name!}");
          },
          title: TextH5(title: broadcastProvider.constituencyList[index].name!),
        );
      },
      separatorBuilder: (context, index) {
        return Divider(
          color: AppColors.dividerColor2,
          height: Utils.screenHeight * 0.003,
          thickness: 0.5,
        );
      },
    ): const Center(child: TextH5(title: "No Constituency Available"),);
  }
}
