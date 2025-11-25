import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:vf_app/constants/shared_pref_constants.dart';
import 'package:vf_app/screen/homeScreen/home_screen.dart';
import 'package:vf_app/screen/login/model/login_model.dart';
import 'package:vf_app/screen/login/repo/login_repo.dart';
import 'package:vf_app/screen/tabScreen.dart';
import 'package:vf_app/utils/check_connectivity.dart';
import 'package:vf_app/utils/shared_prefs_singleton.dart';
import 'package:vf_app/utils/utils.dart';

class LoginProvider extends ChangeNotifier {
  final LoginRepo _loginRepo = LoginRepo();
  bool isLoading = false;
  final List<String> allowedNumbers = ["8669188256"];

  void login({required BuildContext context, required dynamic request}) async {
    bool isInternet = await CheckConnectivity().checkConnectivity();
    if (isInternet) {
      try {
        if (context.mounted) {
          // LoginResponseModel responseModel =
          //     await _loginRepo.login(context: context, request: request);
          // if (responseModel.message == "User Login successful") {
          //   storeSharedPrefData(user: responseModel.body!.user!,token: responseModel.body!.token!);
          //   if (context.mounted) {
          //     Navigator.of(context).push(
          //         MaterialPageRoute(builder: (context) => const HomeScreen()));
          //   }
          // }
          final username = request["username"]?.toString().trim();
          final password = request["password"]?.toString().trim();

          // Local check
          if (allowedNumbers.contains(username) && password == "12345") {
            // mimic login success response
            // storeSharedPrefData(user: User(), token: "");

            if (context.mounted) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const BottomNavScreen()),
              );
            }
          } else {
            // show error message
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Invalid mobile number or password"),
              ),
            );
          }
        }
      } catch (error) {
        log("Error : $error");
      } finally {
        isLoading = false;
        notifyListeners();
      }
    } else {
      Utils.showCustomSnackBar(context, "No Internet");
    }
  }

  storeSharedPrefData({required User user, required String token}) async {
    await sharedPreferencesAsync.setBool(SharedPrefConstants.isLoggedIn, true);
    await sharedPreferencesAsync.setString(
      SharedPrefConstants.userTypeKey,
      user.userType!,
    );
    await sharedPreferencesAsync.setString(
      SharedPrefConstants.accessTokenKey,
      token,
    );
    await sharedPreferencesAsync.setString(
      SharedPrefConstants.userNameKey,
      user.name!,
    );
    await sharedPreferencesAsync.setString(
      SharedPrefConstants.userEmailKey,
      user.email!,
    );
    await sharedPreferencesAsync.setString(
      SharedPrefConstants.userMobileKey,
      user.mobile!,
    );
    await sharedPreferencesAsync.setInt(
      SharedPrefConstants.userIdKey,
      user.id!,
    );
  }
}
