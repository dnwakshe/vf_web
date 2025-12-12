import 'package:flutter/cupertino.dart';
import 'package:vf_app/screen/drawerScreens/partyWings/model/party_wings_response_model.dart';
import 'package:vf_app/services/network/api_client.dart';
import 'package:vf_app/services/network/app_urls.dart';

class PartyWingsService{
  ApiClient apiClient = ApiClient();

  Future<PartyWingResponseModel> getPartyWings({required BuildContext context, required dynamic request}) async {
    var data = await apiClient.post(AppUrls.partyWings, request, context);
    PartyWingResponseModel responseModel = PartyWingResponseModel.fromJson(data);
    return responseModel;
  }
}