import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vf_app/constants/app_colors.dart';
import 'package:vf_app/constants/text_widgets.dart';
<<<<<<< HEAD
import 'package:vf_app/screen/broadcast/model/district_list_model.dart';
=======
import 'package:vf_app/screen/broadcast/model/constituency_list_model.dart';
import 'package:vf_app/screen/broadcast/model/district_list_model.dart';
import 'package:vf_app/screen/broadcast/model/state_list_model.dart';
>>>>>>> 027bce8cbfc59bc57ec502c974ca59433750a853
import 'package:vf_app/screen/broadcast/model/taluka_list_model.dart';
import 'package:vf_app/screen/broadcast/provider/broadcast_provider.dart';
import 'package:vf_app/utils/utils.dart';

class TalukaFilter extends StatefulWidget {
  final DistrictListDatum? districtListBody;
  final Function(TalukaDatum?) onSelected;
  const TalukaFilter({super.key, required this.onSelected, this.districtListBody});

  @override
  State<TalukaFilter> createState() => _TalukaFilterState();
}

class _TalukaFilterState extends State<TalukaFilter> {
  late BroadcastProvider broadcastProvider;
  int? selectedIndex;

  @override
  void initState() {
    broadcastProvider = context.read<BroadcastProvider>();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if(widget.districtListBody == null){
        Utils.showCustomSnackBar(context, "Please select District");
      }else{
        dynamic request = {
          "offset": 0,
          "limit": 1000,
          "search" : "",
          "district_id": widget.districtListBody!.id
          // "search":"Pune"
        };
        broadcastProvider.getTalukaList(context: context, request: request);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    broadcastProvider = context.watch<BroadcastProvider>();
    return broadcastProvider.talukaList.isNotEmpty ? ListView.separated(
      itemCount: broadcastProvider.talukaList.length,
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
                widget.onSelected(broadcastProvider.talukaList[index]);
              }
            });
            log("onTapFilter: ${broadcastProvider.talukaList[index].name!}");
          },
          title: TextH5(title: broadcastProvider.talukaList[index].name!),
        );
      },
      separatorBuilder: (context, index) {
        return Divider(
          color: AppColors.dividerColor2,
          height: Utils.screenHeight * 0.003,
          thickness: 0.5,
        );
      },
    ): const Center(child: TextH5(title: "No Taluka's Available"),);
  }
}
