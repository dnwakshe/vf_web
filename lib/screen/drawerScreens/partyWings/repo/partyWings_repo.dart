import 'package:flutter/cupertino.dart';
import 'package:vf_app/screen/drawerScreens/partyWings/model/party_wings_response_model.dart';
import 'package:vf_app/screen/drawerScreens/partyWings/service/partyWings_service.dart';

class PartyWingsRepo{
  PartyWingsService  service = PartyWingsService();

  Future<PartyWingResponseModel> getPartyWings(
      {required BuildContext context, required dynamic request}) async {
    return await service.getPartyWings(context: context, request: request);
  }
}