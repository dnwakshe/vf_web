import 'package:flutter/material.dart';
import 'package:vf_app/screen/drawerScreens/ourLeader/model/our_leader_model.dart';
import 'package:vf_app/services/network/api_client.dart';
import 'package:vf_app/services/network/app_urls.dart';

class OurLeaderService{
  final ApiClient _apiClient = ApiClient();

  Future<OurLeaderResponseModel> getOurLeaders({required BuildContext context, required dynamic request})async{
    var data = await _apiClient.post(AppUrls.getLeadersList, request, context);
    OurLeaderResponseModel responseModel = OurLeaderResponseModel.fromJson(data);
    return responseModel;
  }

}