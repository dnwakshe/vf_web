import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:vf_app/constants/app_colors.dart';
import 'package:vf_app/constants/text_widgets.dart';
import 'package:vf_app/screen/broadcast/filter/constituency_filter.dart';
import 'package:vf_app/screen/broadcast/filter/designation_filter.dart';
import 'package:vf_app/screen/broadcast/filter/district_filter.dart';
import 'package:vf_app/screen/broadcast/filter/state_filter.dart';
import 'package:vf_app/screen/broadcast/filter/taluka_filter.dart';
import 'package:vf_app/screen/broadcast/model/constituency_list_model.dart';
import 'package:vf_app/screen/broadcast/model/district_list_model.dart';
import 'package:vf_app/screen/broadcast/model/party_designations_model.dart';
import 'package:vf_app/screen/broadcast/model/state_list_model.dart';
import 'package:vf_app/screen/broadcast/model/taluka_list_model.dart';
import 'package:vf_app/screen/broadcast/model/village_list_model.dart';
import 'package:vf_app/screen/broadcast/widgets/filter_item_widget.dart';
import 'package:vf_app/utils/utils.dart';
import 'package:vf_app/utils/widgets/UIComponents/custom_app_bar.dart';

import 'filter/villages_filter.dart';

class BroadcastFilterScreen extends StatefulWidget {
  const BroadcastFilterScreen({super.key});

  @override
  State<BroadcastFilterScreen> createState() => _BroadcastFilterScreenState();
}

class _BroadcastFilterScreenState extends State<BroadcastFilterScreen> {
  List<String> filterOptionsList = [
    "Designation",
    "Division",
    "State",
    "District",
    "Constituency",
    // "City",
    "Taluka",
    // "Block",
    "Village",
  ];

  int activeIndexFilter = 0;
  String selectedFilter = "Designation";
  PartyDesignationsDatum? selectedDesignation;
  StateBody? selectedState;
  DistrictListDatum? selectedDistrict;
  ConstituencyListDatum? selectedConstituency;
  TalukaDatum? selectedTaluka;
  VillageDatum? selectedVillage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Filter",
        showNotificationIcon: false,
        showSearchIcon: false,
      ),
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: filterOptionsList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return FilterItemWidget(
                    filter: filterOptionsList[index],
                    activeIndexFilter: activeIndexFilter,
                    currentIndex: index,
                    onTap: () {
                      log("onTapFilter: ${filterOptionsList[index]}");
                      setState(() {
                        activeIndexFilter = index;
                        selectedFilter = filterOptionsList[index];
                      });
                      log("onTapFilter: $activeIndexFilter");
                    }, isFilterSelected: false,
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: AppColors.dividerColor2,
                    height: Utils.screenHeight * 0.003,
                    thickness: 0.5,
                  );
                },
              ),
            ),
            Container(
              width: 1,
              color: AppColors.dividerColor2,
            ),
            Expanded(
              flex: 2,
              child: getFilterBody(selectedFilter),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
          height: 50,
          color: AppColors.white,
          child: Row(
            children: [
              Expanded(
                  child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const TextH6(title: "Clear"))),
              Container(
                height: 50,
                width: 1,
                color: AppColors.dividerColor2,
              ),
              Expanded(
                  child: TextButton(
                      onPressed: () {
                        handleFilterTap(selectedFilter);
                      },
                      child: const TextH6(title: "Apply")))
            ],
          )),
    );
  }

  void handleFilterTap(String selectedFilter) {
    switch (selectedFilter) {
      case 'Designation':
        dynamic args = {
          "filterType": selectedFilter,
          "selectedFilter": selectedDesignation
        };
        Navigator.of(context).pop(args);
        break;

      case 'Division':
        log("Tapped on Division Filter");
        // Perform actions specific to Division filter
        break;

      case 'State':
        dynamic args = {
          "filterType": selectedFilter,
          "selectedFilter": selectedState
        };
        Navigator.of(context).pop(args);

        break;

      case 'District':
        dynamic args = {
          "filterType": selectedFilter,
          "selectedFilter": selectedDistrict
        };
        Navigator.of(context).pop(args);
        break;

      case 'Constituency':
        dynamic args = {
          "filterType": selectedFilter,
          "selectedFilter": selectedConstituency
        };
        Navigator.of(context).pop(args);
        // Perform actions specific to Constituency filter
        break;

      case 'City':
        log("Tapped on City Filter");
        // Perform actions specific to City filter
        break;

      case 'Taluka':
        dynamic args = {
          "filterType": selectedFilter,
          "selectedFilter": selectedTaluka
        };
        Navigator.of(context).pop(args);
        break;

      case 'Block':
        log("Tapped on Block Filter");
        // Perform actions specific to Block filter
        break;

      case 'Village':
        log("Tapped on Village Filter");
        dynamic args = {
          "filterType": selectedFilter,
          "selectedFilter": selectedVillage
        };
        Navigator.of(context).pop(args);
        break;

      default:
        break;
    }
  }

  //get Filter body
  Widget getFilterBody(String selectedFilter) {
    switch (selectedFilter) {
      case "Designation":
        return DesignationFilter(
          onSelected: (PartyDesignationsDatum? value) {
            log("Selected: $value");
            setState(() {
              selectedDesignation = value;
            });
          },
        );
      case 'Division':
        return Center(
          child: TextH5(title: selectedFilter),
        );

      case 'State':
        return StateFilter(onSelected: (value) {
          log("Selected: $value");
          setState(() {
            selectedState = value;
          });
        });

      case 'District':
        // if(selectedState == null){
        // }
        return DistrictFilter(
          onSelected: (value) {
            log("Selected: $value");
            setState(() {
              selectedDistrict = value;
            });
          },
          stateBody: selectedState,
        );

      case 'Constituency':
        return ConstituencyFilter(
            stateBody: selectedState,
            districtListBody: selectedDistrict,
            onSelected: (value) {
              log("Selected: $value");
              setState(() {
                selectedConstituency = value;
              });
            });

      case 'City':
        return Center(
          child: TextH5(title: selectedFilter),
        );

      case 'Taluka':
        return TalukaFilter(
          districtListBody: selectedDistrict,
          onSelected: (TalukaDatum? taluka) {
            setState(() {
              selectedTaluka = taluka;
            });
          },
        );

      case 'Block':
        return Center(
          child: TextH5(title: selectedFilter),
        );

      case 'Village':
        return VillagesFilter(
          talukaDatum: selectedTaluka,
          onSelected: (VillageDatum? value) {
            setState(() {
              selectedVillage = value;
            });
          },
        );

      default:
        return DesignationFilter(
          onSelected: (PartyDesignationsDatum? value) {
            log("Selected: $value");
            setState(() {
              selectedDesignation = value;
            });
          },
        );
    }
  }
}
