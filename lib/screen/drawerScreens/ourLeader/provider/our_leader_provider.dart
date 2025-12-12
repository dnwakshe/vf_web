import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:vf_app/constants/string_constants.dart';
import 'package:vf_app/screen/drawerScreens/ourLeader/model/our_leader_model.dart';
import 'package:vf_app/screen/drawerScreens/ourLeader/repo/our_leader_repo.dart';
import 'package:vf_app/utils/check_connectivity.dart';
import 'package:vf_app/utils/utils.dart';

class OurLeaderProvider extends ChangeNotifier {
  bool isLoading = false;

  final OurLeaderRepo _leaderRepo = OurLeaderRepo();
  List<OurLeaderDatum> leadersList = [];

  getLeadersList(
      {required BuildContext context, required dynamic request}) async {
    bool isInternet = await CheckConnectivity().checkConnectivity();
    if (isInternet) {
      isLoading = true;
      leadersList.clear();
      notifyListeners();
      try {
        OurLeaderResponseModel responseModel =
            await _leaderRepo.getOurLeaders(context: context, request: request);
        if (responseModel.message!.contains("Successfully")) {
          leadersList.addAll(responseModel.body!.data!);
        } else {
          Utils.showCustomSnackBar(
              context, StringConstants.somethingWentWrong.tr());
        }
      } catch (e) {
        log("Error: $e");
      } finally {
        isLoading = false;
        notifyListeners();
      }
    } else {
      Utils.showNoInternetDialog(context);
    }
  }
}
