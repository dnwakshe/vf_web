import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:vf_app/screen/drawerScreens/partyWings/model/party_wings_response_model.dart';
import 'package:vf_app/screen/drawerScreens/partyWings/repo/partyWings_repo.dart';
import 'package:vf_app/utils/check_connectivity.dart';

class PartyWingsProvider extends ChangeNotifier{
  List<PartyWingsList>? partyWingsList;

  PartyWingsRepo repo = PartyWingsRepo();
  bool isLoading = false;
  getPartyWings(BuildContext context, dynamic request) async {
    bool isInternet = await CheckConnectivity().checkConnectivity();
    if (isInternet) {
      isLoading = true;
      notifyListeners();
      await repo.getPartyWings(context: context, request: request)
          .then((value) {
       PartyWingResponseModel responseModel = value;
       partyWingsList = responseModel.body!.data!;
        isLoading = false;
        notifyListeners();
      }).onError((error, stacktrace) {
        log("Error: $error");
        isLoading = false;
        notifyListeners();
      });
    } else {

    }
  }
}