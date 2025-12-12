import 'package:flutter/material.dart';
import 'package:vf_app/screen/login/model/login_model.dart';
import 'package:vf_app/services/network/api_client.dart';
import 'package:vf_app/services/network/app_urls.dart';

class LoginService {
  final ApiClient _apiClient = ApiClient();

  Future<LoginResponseModel> login(
      {required BuildContext context, required dynamic request}) async {
    var data = await _apiClient.post(AppUrls.login, request, context);
    LoginResponseModel responseModel = LoginResponseModel.fromJson(data);
    return responseModel;
  }
}
