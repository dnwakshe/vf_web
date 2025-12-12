import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:vf_app/screen/broadcast/model/constituency_list_model.dart';
import 'package:vf_app/screen/broadcast/model/district_list_model.dart';
import 'package:vf_app/screen/broadcast/model/get_member_list_model.dart';
import 'package:vf_app/screen/broadcast/model/party_designations_model.dart';
import 'package:vf_app/screen/broadcast/model/state_list_model.dart';
import 'package:vf_app/screen/broadcast/model/taluka_list_model.dart';
import 'package:vf_app/screen/broadcast/model/village_list_model.dart';
import 'package:vf_app/screen/broadcast/repo/broadcast_repo.dart';
import 'package:vf_app/utils/check_connectivity.dart';
import 'package:vf_app/utils/utils.dart';

class BroadcastProvider extends ChangeNotifier {
  bool isLoading = false;
  final BroadcastRepo _broadcastRepo = BroadcastRepo();

  List<PartyDesignationsDatum> partyDesignationsList = [];
  List<GetMemberDatum> membersList = [];
  List<StateBody> stateList = [];
  List<DistrictListDatum> districtList = [];
  List<ConstituencyListDatum> constituencyList =[];
  List<TalukaDatum> talukaList =[];
  List<VillageDatum> villagesList =[];

  //get designations
  Future<bool> getPartyDesignations({required BuildContext context}) async {
    bool isInternet = await CheckConnectivity().checkConnectivity();
    if (isInternet) {
      isLoading = true;
      notifyListeners();
      try {
        PartyDesignationsResponseModel responseModel =
            await _broadcastRepo.getPartyDesignations(context: context);
        if (responseModel.body != null) {
          partyDesignationsList = responseModel.body!.data!;
          return true;
        } else {
          return false;
        }
      } catch (error) {
        log("Error: $error");
        return false;
      } finally {
        isLoading = false;
        notifyListeners();
      }
    } else {
      Utils.showNoInternetDialog(context);
      return false;
    }
  }

  //get members
  Future<bool> getMembersList(
      {required BuildContext context, required dynamic request}) async {bool isInternet = await CheckConnectivity().checkConnectivity();
    if (isInternet) {
      isLoading = true;
      membersList.clear();
      notifyListeners();
      try {
        GetMemberListResponseModel responseModel =
            await _broadcastRepo.getMembers(context: context, request: request);
        if (responseModel.body != null) {
          membersList = responseModel.body!.data!;
          return true;
        } else {
          return false;
        }
      } catch (error) {
        log("Error: $error");
        return false;
      } finally {
        isLoading = false;
        notifyListeners();
      }
    } else {
      Utils.showNoInternetDialog(context);
      return false;
    }
  }

  //get states
  Future<bool> getStateList(
      {required BuildContext context, required dynamic request}) async {
  bool isInternet = await CheckConnectivity().checkConnectivity();
  if (isInternet) {
    isLoading = true;
    stateList.clear();
    notifyListeners();
    try {
      StateListResponseModel responseModel =
      await _broadcastRepo.getStateList(context: context, request: request);
      if (responseModel.body != null) {
        stateList = responseModel.body!;
        return true;
      } else {
        return false;
      }
    } catch (error) {
      log("Error: $error");
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  } else {
    Utils.showNoInternetDialog(context);
    return false;
  }
  }

  //get district list
  Future<bool> getDistrictList(
      {required BuildContext context, required dynamic request}) async {
    bool isInternet = await CheckConnectivity().checkConnectivity();
    if (isInternet) {
      isLoading = true;
      districtList.clear();
      notifyListeners();
      try {
        DistrictListResponseModel responseModel =
        await _broadcastRepo.getDistrictList(context: context, request: request);
        if (responseModel.body != null) {
          districtList = responseModel.body!.data!;
          return true;
        } else {
          return false;
        }
      } catch (error) {
        log("Error: $error");
        return false;
      } finally {
        isLoading = false;
        notifyListeners();
      }
    } else {
      Utils.showNoInternetDialog(context);
      return false;
    }
  }

  // get Constituency List
  Future<bool> getConstituencyList(
      {required BuildContext context, required dynamic request}) async {
    bool isInternet = await CheckConnectivity().checkConnectivity();
    if (isInternet) {
      isLoading = true;
      constituencyList.clear();
      notifyListeners();
      try {
        ConstituencyListResponseModel responseModel =
        await _broadcastRepo.getConstituencyList(context: context, request: request);
        if (responseModel.body != null) {
          constituencyList = responseModel.body!.data!;
          return true;
        } else {
          return false;
        }
      } catch (error) {
        log("Error: $error");
        return false;
      } finally {
        isLoading = false;
        notifyListeners();
      }
    } else {
      Utils.showNoInternetDialog(context);
      return false;
    }
  }

  // get taluka List
  Future<bool> getTalukaList(
      {required BuildContext context, required dynamic request}) async {
    bool isInternet = await CheckConnectivity().checkConnectivity();
    if (isInternet) {
      isLoading = true;
      talukaList.clear();
      notifyListeners();
      try {
        TalukaListResponseModel responseModel =
        await _broadcastRepo.getTalukaList(context: context, request: request);
        if (responseModel.body != null) {
          talukaList = responseModel.body!.data!;
          return true;
        } else {
          return false;
        }
      } catch (error) {
        log("Error: $error");
        return false;
      } finally {
        isLoading = false;
        notifyListeners();
      }
    } else {
      Utils.showNoInternetDialog(context);
      return false;
    }
  }

  // get villages List
  Future<bool> getVillageList(
      {required BuildContext context, required dynamic request}) async {
    bool isInternet = await CheckConnectivity().checkConnectivity();
    if (isInternet) {
      isLoading = true;
      villagesList.clear();
      notifyListeners();
      try {
        VillageListResponseModel responseModel =
        await _broadcastRepo.getVillagesList(context: context, request: request);
        if (responseModel.body != null) {
          villagesList = responseModel.body!.data!;
          return true;
        } else {
          return false;
        }
      } catch (error) {
        log("Error: $error");
        return false;
      } finally {
        isLoading = false;
        notifyListeners();
      }
    } else {
      Utils.showNoInternetDialog(context);
      return false;
    }
  }
}


