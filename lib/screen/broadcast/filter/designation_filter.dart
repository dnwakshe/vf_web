import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vf_app/constants/app_colors.dart';
import 'package:vf_app/constants/text_widgets.dart';
<<<<<<< HEAD
=======
import 'package:vf_app/main.dart';
>>>>>>> 027bce8cbfc59bc57ec502c974ca59433750a853
import 'package:vf_app/screen/broadcast/model/party_designations_model.dart';
import 'package:vf_app/screen/broadcast/provider/broadcast_provider.dart';
import 'package:vf_app/utils/utils.dart';

class DesignationFilter extends StatefulWidget {
  final Function(PartyDesignationsDatum?) onSelected;
  const DesignationFilter({super.key, required this.onSelected});

  @override
  State<DesignationFilter> createState() => _DesignationFilterState();
}

class _DesignationFilterState extends State<DesignationFilter> {
  late BroadcastProvider broadcastProvider;
  int? selectedIndex; // Keeps track of the selected tile index (null means no selection)

  @override
  void initState() {
    broadcastProvider = context.read<BroadcastProvider>();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {

    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: broadcastProvider.partyDesignationsList.length,
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
                widget.onSelected(broadcastProvider.partyDesignationsList[index]);
              }
            });
            log("onTapFilter: ${broadcastProvider.partyDesignationsList[index].name}");
          },
          title: TextH5(title: broadcastProvider.partyDesignationsList[index].name!),
        );
      },
      separatorBuilder: (context, index) {
        return Divider(
          color: AppColors.dividerColor2,
          height: Utils.screenHeight * 0.003,
          thickness: 0.5,
        );
      },
    );
  }
}
