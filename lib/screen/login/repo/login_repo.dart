import 'package:flutter/material.dart';
import 'package:vf_app/screen/login/model/login_model.dart';
import 'package:vf_app/screen/login/service/login_service.dart';

class LoginRepo {
  final LoginService _service = LoginService();

  Future<LoginResponseModel> login(
      {required BuildContext context, required dynamic request}) async {
    return await _service.login(context: context, request: request);
  }
}
