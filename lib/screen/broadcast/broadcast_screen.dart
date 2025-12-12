// import 'dart:convert';
// import 'dart:developer';
//
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:vf_app/constants/app_colors.dart';
// import 'package:vf_app/constants/string_constants.dart';
// import 'package:vf_app/constants/text_widgets.dart';
// import 'package:vf_app/screen/broadcast/model/constituency_list_model.dart';
// import 'package:vf_app/screen/broadcast/model/district_list_model.dart';
// import 'package:vf_app/screen/broadcast/model/party_designations_model.dart';
// import 'package:vf_app/screen/broadcast/model/state_list_model.dart';
// import 'package:vf_app/screen/broadcast/model/taluka_list_model.dart';
// import 'package:vf_app/screen/broadcast/model/village_list_model.dart';
// import 'package:vf_app/screen/broadcast/provider/broadcast_provider.dart';
// import 'package:vf_app/screen/broadcast/widgets/bottomsheet_card_widget.dart';
// import 'package:vf_app/screen/broadcast/broadcast_filter_screen.dart';
// import 'package:vf_app/screen/broadcast/widgets/member_item_card_widget.dart';
// import 'package:vf_app/utils/utils.dart';
// import 'package:vf_app/utils/widgets/loader.dart';
//
// class BroadcastScreen extends StatefulWidget {
//   const BroadcastScreen({super.key});
//
//   @override
//   State<BroadcastScreen> createState() => _BroadcastScreenState();
// }
//
// class _BroadcastScreenState extends State<BroadcastScreen>
//     with SingleTickerProviderStateMixin {
//   double screenHeight = Utils.screenHeight;
//   double screenWidth = Utils.screenWidth;
//
//   late TabController tabController;
//   late BroadcastProvider broadcastProvider;
//   List<Tab> tabsList = [];
//   int activeIndex = 0;
//   int previousIndex = 0;
//   bool isFilter = false;
//
//   @override
//   void initState() {
//     broadcastProvider = context.read<BroadcastProvider>();
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
//       broadcastProvider.getPartyDesignations(context: context).then((value) {
//         if (value) {
//           for (var element in broadcastProvider.partyDesignationsList) {
//             int index =
//                 broadcastProvider.partyDesignationsList.indexOf(element);
//             setState(() {
//               tabsList.add(Tab(
//                 child: TextH6(
//                   title: element.name!,
//                   color: index == 0 ? AppColors.primary : AppColors.textColor3,
//                   weight: index == 0 ? FontWeight.w600 : FontWeight.w500,
//                 ),
//               ));
//             });
//           }
//           setState(() {
//             tabController = TabController(length: tabsList.length, vsync: this);
//             tabController.addListener(() {
//               setState(() {
//                 var element =
//                     broadcastProvider.partyDesignationsList[activeIndex];
//                 tabsList[activeIndex] = Tab(
//                   child: TextH6(
//                     title: element.name!,
//                     color: AppColors.primary,
//                     weight: FontWeight.w600,
//                   ),
//                 );
//                 var previousElement =
//                     broadcastProvider.partyDesignationsList[previousIndex];
//                 tabsList[previousIndex] = Tab(
//                   child: TextH6(
//                     title: previousElement.name!,
//                     color: AppColors.textColor3,
//                     weight: FontWeight.w500,
//                   ),
//                 );
//                 log("message: $element");
//                 log("message: $activeIndex");
//                 previousIndex = activeIndex;
//               });
//             });
//           });
//         }
//       });
//
//       dynamic request = {};
//       broadcastProvider.getMembersList(context: context, request: request);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     broadcastProvider = context.watch<BroadcastProvider>();
//     return Loader(
//         isCallInProgress: broadcastProvider.isLoading,
//         child: mainUi(
//           context,
//         ));
//   }
//
//   Widget mainUi(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.white,
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
//         child: ListView(
//           children: [
//             SizedBox(
//               height: screenHeight * 0.05,
//               child: tabsList.isNotEmpty
//                   ? TabBar(
//                       controller: tabController,
//                       physics: const ScrollPhysics(),
//                       isScrollable: true,
//                       onTap: (value) {
//                         setState(() {
//                           activeIndex = value;
//                         });
//                       },
//                       indicatorColor: AppColors.primary,
//                       tabs: tabsList)
//                   : Container(),
//             ),
//             SizedBox(
//               height: screenHeight * 0.02,
//             ),
//             filterOption(),
//             SizedBox(
//               height: screenHeight * 0.02,
//             ),
//             broadcastProvider.membersList.isNotEmpty
//                 ? ListView.separated(
//                     itemCount: broadcastProvider.membersList.length,
//                     physics: const NeverScrollableScrollPhysics(),
//                     shrinkWrap: true,
//                     itemBuilder: (context, index) {
//                       return MemberItemCardWidget(
//                         datum: broadcastProvider.membersList[index],
//                       );
//                     },
//                     separatorBuilder: (context, index) {
//                       return Divider(
//                         color: AppColors.dividerColor2,
//                         height: screenHeight * 0.03,
//                         thickness: 1,
//                       );
//                     },
//                   )
//                 : const Center(child: TextH5(title: "No Members Available")),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget filterOption() {
//     return Row(
//       children: [
//         Expanded(
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   // openFilterBottomSheet();
//                   Navigator.of(context)
//                       .push(MaterialPageRoute(
//                       builder: (context) => const BroadcastFilterScreen()))
//                       .then((value) {
//                     if (value != null) {
//                       setState(() {
//                         isFilter = true;
//                       });
//                       var filterType = value['filterType'];
//                       var selectedFilter = value['selectedFilter'];
//                       log("Result : $filterType, $selectedFilter");
//                       handleFilterTap(filterType, selectedFilter);
//                       // Map<String, dynamic> requestResult = getRequestType(filterType, selectedFilter);
//                       // String requestKey = "";
//                       // dynamic value2;
//                       // requestResult.forEach((key, value) {
//                       //   setState(() {
//                       //     requestKey = key;
//                       //     value2 = value;
//                       //   });
//                       // });
//                       // dynamic request ={
//                       //   requestKey: value2
//                       // };
//                       // log("request: $request");
//                       // broadcastProvider.getMembersList(
//                       //     context: context, request: jsonEncode(request));
//                     }
//                   });
//                 },
//                 child: const TextH5(
//                   title: "Filter",
//                   color: AppColors.textColor,
//                   weight: FontWeight.w600,
//                 ),
//               ),
//               SizedBox(
//                 width: screenWidth * 0.02,
//               ),
//               Visibility(
//                 visible: isFilter,
//                 child: GestureDetector(
//                   onTap: (){
//                     setState(() {
//                       isFilter = false;
//                     });
//                     dynamic request = {};
//                     broadcastProvider.getMembersList(context: context, request: request);
//                   },
//                   child: const TextH6(
//                     title: "(Clear)",
//                     color: AppColors.red,
//                     weight: FontWeight.w400,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         GestureDetector(
//           onTap: () {
//             openBottomSheet();
//           },
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               TextH5(
//                 title: StringConstants.excludedTxt.tr(),
//                 color: AppColors.textColor2,
//                 weight: FontWeight.w400,
//               ),
//               SizedBox(
//                 width: screenWidth * 0.02,
//               ),
//               Container(
//                   height: screenHeight * 0.03,
//                   width: screenHeight * 0.03,
//                   decoration: BoxDecoration(
//                       color: AppColors.primaryWithOpacity,
//                       borderRadius: BorderRadius.circular(4)),
//                   child: const Center(
//                       child: TextH7(
//                     title: "2",
//                     color: AppColors.primary,
//                     weight: FontWeight.w500,
//                   ))),
//             ],
//           ),
//         )
//       ],
//     );
//   }
//
//   void openBottomSheet() {
//     showModalBottomSheet(
//       context: context,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(
//           top: Radius.circular(25.0),
//         ),
//       ),
//       builder: (BuildContext context) {
//         return Container(
//           height: 400, // Adjust the height as needed
//           padding: const EdgeInsets.all(16.0),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 TextH6(
//                   title: StringConstants.mPsTxt.tr(),
//                   color: AppColors.textColor,
//                   weight: FontWeight.w600,
//                 ),
//                 ListView.separated(
//                   itemCount: 7,
//                   physics: const NeverScrollableScrollPhysics(),
//                   shrinkWrap: true,
//                   itemBuilder: (context, index) {
//                     return const BottomSheetCardWidget();
//                   },
//                   separatorBuilder: (context, index) {
//                     return Divider(
//                       color: AppColors.dividerColor2,
//                       height: screenHeight * 0.03,
//                       thickness: 1,
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   Map<String, dynamic> getRequestType(String filterType, dynamic filter) {
//       switch (filterType) {
//         case 'Designation':
//           PartyDesignationsDatum designationsDatum =
//           filter as PartyDesignationsDatum;
//           return {"designation": designationsDatum.id};
//         case 'Division':
//           // Perform actions specific to Division filter
//           return {};
//         case 'State':
//           // Perform actions specific to State filter
//           StateBody stateBody = filter as StateBody;
//           var req = {
//             "State": {
//               "Key": "state",
//               "Value": stateBody.id
//             },
//           };
//           return req;
//
//         case 'District':
//           log("Tapped on District Filter");
//           DistrictListDatum districtListBody = filter as DistrictListDatum;
//           var req = {
//             "State": {
//               "Key": "District",
//               "Value": districtListBody.id
//             },
//           };
//           return req;
//
//         case 'Constituency':
//           log("Tapped on Constituency Filter");
//           ConstituencyListDatum constituencyListDatum = filter as ConstituencyListDatum;
//           var req = {
//             "State": {
//               "Key": "Constituency",
//               "Value": constituencyListDatum.id
//             },
//           };
//           return req;
//         case 'City':
//           log("Tapped on City Filter");
//
//           // Perform actions specific to City filter
//           return {};
//
//         case 'Taluka':
//           log("Tapped on Taluka Filter");
//           TalukaDatum talukaDatum = filter as TalukaDatum;
//           var req = {
//             "State": {
//               "Key": "Taluka",
//               "Value": talukaDatum.id
//             },
//           };
//           return req;
//
//         case 'Block':
//           log("Tapped on Block Filter");
//           // Perform actions specific to Block filter
//           return {};
//
//         case 'Village':
//           log("Tapped on Village Filter");
//           VillageDatum villageDatum = filter as VillageDatum;
//           var req = {
//             "State": {
//               "Key": "Village",
//               "Value": villageDatum.id
//             },
//           };
//           return req;
//
//         default:
//           log("Tapped on unknown filter");
//           return {};
//       }
//   }
//
//   void handleFilterTap(String filterType, dynamic selectedFilter) {
//     switch (filterType) {
//       case 'Designation':
//         log("Tapped on Designation Filter");
//         // Perform actions specific to Designation filter
//         applyFilter(filterType, selectedFilter);
//         break;
//       case 'Division':
//         log("Tapped on Division Filter");
//         // Perform actions specific to Division filter
//         break;
//
//       case 'State':
//         applyFilter2(filterType, selectedFilter);
//         break;
//
//       case 'District':
//         log("Tapped on District Filter");
//         applyFilter2(filterType, selectedFilter);
//         break;
//
//       case 'Constituency':
//         log("Tapped on Constituency Filter");
//         applyFilter2(filterType, selectedFilter);
//         break;
//
//       case 'City':
//         log("Tapped on City Filter");
//         // applyFilter2(filterType, selectedFilter);
//         break;
//
//       case 'Taluka':
//         log("Tapped on Taluka Filter");
//         applyFilter2(filterType, selectedFilter);
//         break;
//
//       case 'Block':
//         log("Tapped on Block Filter");
//         // applyFilter2(filterType, selectedFilter);
//         break;
//
//       case 'Village':
//         log("Tapped on Village Filter");
//         applyFilter2(filterType, selectedFilter);
//         break;
//
//       default:
//         log("Tapped on unknown filter");
//         break;
//     }
//   }
//
//   void applyFilter2(String filterType, selectedFilter) {
//     Map<String, dynamic> requestResult = getRequestType(filterType, selectedFilter);
//     String requestKey = "";
//     dynamic value2;
//     log("requestResult: $requestResult");
//     requestResult.forEach((key, value) {
//       log("requestResult: $key, $value");
//       setState(() {
//         requestKey = key;
//         value2 = value;
//       });
//     });
//     dynamic request ={
//       requestKey: value2
//     };
//     log("request: $request");
//     broadcastProvider.getMembersList(
//         context: context, request: request);
//   }
//
//   void applyFilter(String filterType, selectedFilter) {
//     Map<String, dynamic> requestResult = getRequestType(filterType, selectedFilter);
//     String requestKey = "";
//     dynamic value2;
//     requestResult.forEach((key, value) {
//       setState(() {
//         requestKey = key;
//         value2 = value.toString();
//       });
//     });
//     dynamic request ={
//       requestKey: value2
//     };
//     log("request: $request");
//     broadcastProvider.getMembersList(
//         context: context, request: request);
//   }
//
// }
