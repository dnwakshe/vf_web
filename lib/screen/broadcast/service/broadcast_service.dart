import 'package:flutter/material.dart';
import 'package:vf_app/screen/broadcast/model/constituency_list_model.dart';
import 'package:vf_app/screen/broadcast/model/district_list_model.dart';
import 'package:vf_app/screen/broadcast/model/get_member_list_model.dart';
import 'package:vf_app/screen/broadcast/model/party_designations_model.dart';
import 'package:vf_app/screen/broadcast/model/state_list_model.dart';
import 'package:vf_app/screen/broadcast/model/taluka_list_model.dart';
import 'package:vf_app/screen/broadcast/model/village_list_model.dart';
import 'package:vf_app/services/network/api_client.dart';
import 'package:vf_app/services/network/app_urls.dart';

class BroadcastService{
  final ApiClient _apiClient = ApiClient();


  //get designations
  Future<PartyDesignationsResponseModel> getPartyDesignations({required BuildContext context})async{
    var data = await _apiClient.post(AppUrls.getPartyDesignationsList, {}, context);
    PartyDesignationsResponseModel responseModel = PartyDesignationsResponseModel.fromJson(data);
    return responseModel;
  }

  //get members
  Future<GetMemberListResponseModel> getMembersList({required BuildContext context, required dynamic request})async{
    var data = await _apiClient.post(AppUrls.getMemberList, request, context);
    GetMemberListResponseModel responseModel = GetMemberListResponseModel.fromJson(data);
    return responseModel;
  }

  //get state list
  Future<StateListResponseModel> getStateList({required BuildContext context, required dynamic request})async{
    var data = await _apiClient.post(AppUrls.getStateList, request, context);
    StateListResponseModel responseModel = StateListResponseModel.fromJson(data);
    return responseModel;
  }

  //get district list
  Future<DistrictListResponseModel> getDistrictList({required BuildContext context, required dynamic request})async{
    var data = await _apiClient.post(AppUrls.getDistrictList, request, context);
    DistrictListResponseModel responseModel = DistrictListResponseModel.fromJson(data);
    return responseModel;
  }

  //get constituency list
  Future<ConstituencyListResponseModel> getConstituencyList({required BuildContext context, required dynamic request})async{
    var data = await _apiClient.post(AppUrls.getConstituency, request, context);
    ConstituencyListResponseModel responseModel = ConstituencyListResponseModel.fromJson(data);
    return responseModel;
  }

  //get taluka list
  Future<TalukaListResponseModel> getTalukaList({required BuildContext context, required dynamic request})async{
    var data = await _apiClient.post(AppUrls.getTalukaList, request, context);
    TalukaListResponseModel responseModel = TalukaListResponseModel.fromJson(data);
    return responseModel;
  }

  //get village list
  Future<VillageListResponseModel> getVillagesList({required BuildContext context, required dynamic request})async{
    var data = await _apiClient.post(AppUrls.getVillagesList, request, context);
    VillageListResponseModel responseModel = VillageListResponseModel.fromJson(data);
    return responseModel;
  }

}