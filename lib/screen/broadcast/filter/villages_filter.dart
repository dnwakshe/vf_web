import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vf_app/constants/app_colors.dart';
import 'package:vf_app/constants/text_widgets.dart';
<<<<<<< HEAD
=======
import 'package:vf_app/screen/broadcast/model/constituency_list_model.dart';
import 'package:vf_app/screen/broadcast/model/district_list_model.dart';
import 'package:vf_app/screen/broadcast/model/state_list_model.dart';
>>>>>>> 027bce8cbfc59bc57ec502c974ca59433750a853
import 'package:vf_app/screen/broadcast/model/taluka_list_model.dart';
import 'package:vf_app/screen/broadcast/model/village_list_model.dart';
import 'package:vf_app/screen/broadcast/provider/broadcast_provider.dart';
import 'package:vf_app/utils/utils.dart';
<<<<<<< HEAD
=======
import 'package:vf_app/utils/widgets/UIComponents/custom_button.dart';
>>>>>>> 027bce8cbfc59bc57ec502c974ca59433750a853
import 'package:vf_app/utils/widgets/UIComponents/custom_text_form_field.dart';

class VillagesFilter extends StatefulWidget {
  final TalukaDatum? talukaDatum;
  final Function(VillageDatum?) onSelected;

  const VillagesFilter({super.key, required this.onSelected, this.talukaDatum});

  @override
  State<VillagesFilter> createState() => _VillagesFilterState();
}

class _VillagesFilterState extends State<VillagesFilter> {
  late BroadcastProvider broadcastProvider;
  int? selectedIndex;

  TextEditingController searchController = TextEditingController();
  bool isSearch = false;

  @override
  void initState() {
    broadcastProvider = context.read<BroadcastProvider>();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (widget.talukaDatum == null) {
        Utils.showCustomSnackBar(context, "Please select Taluka");
      } else {
        dynamic request = {
          "offset": 0,
          "limit": 1000,
          "search": "",
          "taluka_id": widget.talukaDatum!.id!
        };
        broadcastProvider.getVillageList(context: context, request: request);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    broadcastProvider = context.watch<BroadcastProvider>();
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Utils.screenWidth * 0.02),
            child: Column(
              children: [
                CustomTextFormField(
                    controller: searchController,
                    hintText: "Enter Search Text",
                    validator: (value){
                      return null;
                    },
                    labelText: "Search",
                    showSuffixIcon: true,
                    suffixIcon: isSearch ?
                    GestureDetector(
                        onTap: (){
                          if(searchController.text.isNotEmpty){
                            dynamic request = {
                              "offset": 0,
                              "limit": 1000,
                              "taluka_id": widget.talukaDatum!.id!
                            };
                            broadcastProvider.getVillageList(context: context, request: request);
                            setState(() {
                              isSearch = false;
                              searchController.clear();
                            });
                            Utils.hideKeyboard(context);
                          }else{
                            Utils.showCustomSnackBar(context, "Please enter search term");
                          }
                        },
                        child: const Icon(Icons.clear, color: AppColors.black,)):
                    GestureDetector(
                        onTap: (){
                          if(searchController.text.isNotEmpty){
                            dynamic request = {
                              "offset": 0,
                              "limit": 1000,
                              "search": searchController.text,
                              "taluka_id": widget.talukaDatum!.id!
                            };
                            broadcastProvider.getVillageList(context: context, request: request);
                            setState(() {
                              isSearch = true;
                            });
                          }else{
                            Utils.showCustomSnackBar(context, "Please enter search term");
                          }
                        },
                        child: const Icon(Icons.search, color: AppColors.black,)),
                ),
              ],
            ),
          ),
          broadcastProvider.villagesList.isNotEmpty
              ? ListView.separated(
                  itemCount: broadcastProvider.villagesList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    bool isSelected = selectedIndex ==
                        index; // Check if the current tile is selected
                    return ListTile(
                      dense: true,
                      selected: isSelected,
                      // Highlight the selected tile
                      tileColor: isSelected
                          ? AppColors.primaryWithOpacity
                          : AppColors.white,
                      // Apply different colors
                      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                      selectedTileColor: AppColors.primaryWithOpacity,
                      onTap: () {
                        setState(() {
                          // Toggle selection: if tapped again, deselect
                          if (selectedIndex == index) {
                            selectedIndex =
                                null; // Deselect if the same item is tapped
                          } else {
                            selectedIndex = index; // Select the tapped item
                            widget.onSelected(
                                broadcastProvider.villagesList[index]);
                          }
                        });
                        log("onTapFilter: ${broadcastProvider.villagesList[index].name!}");
                      },
                      title: TextH5(
                          title: broadcastProvider.villagesList[index].name!),
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
              : const Center(
                  child: TextH5(title: "No Village's Available"),
                )
        ],
      ),
    );
  }
}
