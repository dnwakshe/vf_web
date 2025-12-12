import 'package:flutter/material.dart';
import 'package:vf_app/screen/drawerScreens/ourLeader/model/our_leader_model.dart';
import 'package:vf_app/screen/drawerScreens/ourLeader/service/our_leader_service.dart';

class OurLeaderRepo{
  final OurLeaderService _leaderService = OurLeaderService();

  Future<OurLeaderResponseModel> getOurLeaders({required BuildContext context, required dynamic request})async{
    return _leaderService.getOurLeaders(context: context, request: request);
  }
}