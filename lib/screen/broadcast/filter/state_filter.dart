import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vf_app/constants/app_colors.dart';
import 'package:vf_app/constants/text_widgets.dart';
<<<<<<< HEAD
=======
import 'package:vf_app/main.dart';
import 'package:vf_app/screen/broadcast/model/party_designations_model.dart';
>>>>>>> 027bce8cbfc59bc57ec502c974ca59433750a853
import 'package:vf_app/screen/broadcast/model/state_list_model.dart';
import 'package:vf_app/screen/broadcast/provider/broadcast_provider.dart';
import 'package:vf_app/utils/utils.dart';

class StateFilter extends StatefulWidget {
  final Function(StateBody?) onSelected;
  const StateFilter({super.key, required this.onSelected});

  @override
  State<StateFilter> createState() => _StateFilterState();
}

class _StateFilterState extends State<StateFilter> {
  late BroadcastProvider broadcastProvider;
  int? selectedIndex; // Keeps track of the selected tile index (null means no selection)

  @override
  void initState() {
    broadcastProvider = context.read<BroadcastProvider>();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
        broadcastProvider.getStateList(context: context, request: {});
    });
  }

  @override
  Widget build(BuildContext context) {
    broadcastProvider = context.watch<BroadcastProvider>();
    return ListView.separated(
      itemCount: broadcastProvider.stateList.length,
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
                widget.onSelected(broadcastProvider.stateList[index]);
              }
            });
            log("onTapFilter: ${broadcastProvider.stateList[index].name}");
          },
          title: TextH5(title: broadcastProvider.stateList[index].name!),
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
