import 'package:flutter/material.dart';
import 'package:vf_app/screen/broadcast/model/constituency_list_model.dart';
import 'package:vf_app/screen/broadcast/model/district_list_model.dart';
import 'package:vf_app/screen/broadcast/model/get_member_list_model.dart';
import 'package:vf_app/screen/broadcast/model/party_designations_model.dart';
import 'package:vf_app/screen/broadcast/model/state_list_model.dart';
import 'package:vf_app/screen/broadcast/model/taluka_list_model.dart';
import 'package:vf_app/screen/broadcast/model/village_list_model.dart';
import 'package:vf_app/screen/broadcast/service/broadcast_service.dart';

class BroadcastRepo{
  final BroadcastService _service = BroadcastService();

  Future<PartyDesignationsResponseModel> getPartyDesignations({required BuildContext context})async{
    return await _service.getPartyDesignations(context: context);
  }
  Future<GetMemberListResponseModel> getMembers({required BuildContext context, required dynamic request})async{
    return await _service.getMembersList(context: context, request: request);
  }

  Future<StateListResponseModel> getStateList({required BuildContext context, required dynamic request})async{
    return await _service.getStateList(context: context, request: request);
  }

  Future<DistrictListResponseModel> getDistrictList({required BuildContext context, required dynamic request})async{
    return await _service.getDistrictList(context: context, request: request);
  }
  Future<ConstituencyListResponseModel> getConstituencyList({required BuildContext context, required dynamic request})async{
    return await _service.getConstituencyList(context: context, request: request);
  }

  Future<TalukaListResponseModel> getTalukaList({required BuildContext context, required dynamic request})async{
    return await _service.getTalukaList(context: context, request: request);
  }

  Future<VillageListResponseModel> getVillagesList({required BuildContext context, required dynamic request})async{
    return await _service.getVillagesList(context: context, request: request);
  }

}