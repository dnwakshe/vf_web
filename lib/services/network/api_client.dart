import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'package:vf_app/constants/shared_pref_constants.dart';
import 'package:vf_app/constants/string_constants.dart';
import 'package:vf_app/screen/login/login_screen.dart';
import 'package:vf_app/services/network/api_base.dart';
import 'package:vf_app/utils/shared_prefs_singleton.dart';
import 'package:vf_app/utils/utils.dart';

class ApiClient extends HttpMethod {
  static final _instance = ApiClient._internal();

  factory ApiClient() {
    return _instance;
  }

  ApiClient._internal();

//retry client
  RetryClient _getHttpClient(context) {
    return RetryClient(
      http.Client(),
      retries: 2,
      when: (response) {
        return response.statusCode == 401;
      },
      onRetry: (req, res, retryCount) async {
        if (res?.statusCode == 401) {
          req.headers.remove('Authorization');
          // var token = await callRefreshTokenApi(context);
          // req.headers['Authorization'] = token!;
          navigateToLogin(context);
        }
      },
    );
  }

  final header = {
    'Content-Type': 'application/json',
    'accept': 'application/json'
  };

  //POST Request
  @override
  Future<dynamic> post(String route, dynamic body, BuildContext? context,
      {dynamic type,
        isBearerToken = false,
        isHardcodedToken = false,
        bool isForClientList = false,
        String? hashValue,
        Map<String, String> additionalHeaders = const {}}) async {
    header['Content-Type'] = 'application/json';

    header['Authorization'] =
        await sharedPreferencesAsync.getString(SharedPrefConstants.accessTokenKey);
    log('HEADERS: $header');
    var response;
    http.Response? resp;
    try {
      debugPrint("=========================================");
      debugPrint("###: $route");
      debugPrint("###: ${body.toString()}");
      resp = await _getHttpClient(context)
          .post(Uri.parse(route), body: jsonEncode(body), headers: header)
          .timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          Utils.showCustomSnackBar(context!, 'Something went wrong. Try again later.');
          return http.post(Uri.parse(route));
        },
      ).onError((error, stackTrace) {
        Utils.showCustomSnackBar(context!,'Something went wrong. Try again later.');
        return http.post(Uri.parse(route));
      });

      debugPrint("###: ${resp.body.toString()}");
      debugPrint("=========================================");

      response = json.decode(resp.body);

    } catch (e, s) {
      // EasyLoading.dismiss();
      log('API CLIENT EXE: ${e.toString()}');
      log('API CLIENT EXE: $s');
    }
    return response;
  }

  @override
  Future<http.StreamedResponse> multipartPostRequest(
      String route, Map<String, dynamic> body, BuildContext context,
      {List<File>? files,
        List<http.MultipartFile> multiPartFile = const []}) async {
    var request = http.MultipartRequest('POST', Uri.parse(route));
    header['Content-Type'] = 'multipart/form-data';
    header['accept'] = '*/*';
    header['Authorization'] =
        await sharedPreferencesAsync.getString(SharedPrefConstants.accessTokenKey);
    request.headers.addAll(header);

    if (body.isNotEmpty) {
      for (int i = 0; i < body.length; i++) {
        if (body.values.toList()[i] != null || body.values.toList()[i] != '') {
          request.fields[body.keys.toList()[i]] =
              body.values.toList()[i].toString();
        }
      }
    }
    if (multiPartFile.isNotEmpty) {
      for (var x in multiPartFile) {
        // log("$x");
        request.files.add(x);
      }
    }
    debugPrint("=========================================");
    debugPrint(route);
    debugPrint(body.toString());
    var response = await request.send().timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        Utils.showCustomSnackBar(context!,'Something went wrong. Try again later.');
        // EasyLoading.dismiss();
        return request.send();
      },
    ).onError((error, stackTrace) {
      Utils.showCustomSnackBar(context!,'Something went wrong. Try again later.');
      // EasyLoading.dismiss();
      return request.send();
    }).catchError((error) {
      log("Error: $error");
    });

    debugPrint(response.toString());
    debugPrint("=========================================");

    if (response.statusCode == 401) {
      // callRefreshTokenApi(context);
      navigateToLogin(context);
    } else if (response.statusCode == 500) {
      // EasyLoading.dismiss();
      log("API_CLIENT_MULTIPART: 500");
    } else if (response.statusCode == 422) {
      // Handle 422 Unprocessable Entity
      var responseString = await response.stream.bytesToString();
      var errorBody = jsonDecode(responseString);
      String errorMessage = errorBody['message'] ?? 'Validation error';
      Utils.showCustomSnackBar(context!,errorMessage);
    } else if (response.statusCode == 500) {
      log("API_CLIENT_MULTIPART: 500");
      Utils.showCustomSnackBar(context!,'Server error. Please try again later.');
    } else {
      log("API_CLIENT_MULTIPART: ${response.statusCode}");
      // Handle other status codes as needed
      // Utils.showCustomSnackBar(context!,'Something went wrong. Please try again.');
    }
    return response;
  }

  navigateToLogin(context) async{
    await sharedPreferencesAsync.clear();

    Navigator.of(context).pushAndRemoveUntil(
      CupertinoPageRoute(
        builder: (BuildContext context) {
          return LoginScreen();
        },
      ),
      (_) => false,
    );
  }

  Future<String?> callRefreshTokenApi(context) async {
    var response;
    String route = '';
    http.Response? resp;
    var body = {'refresh_token': ""};
    try {
      resp = await _getHttpClient(context)
          .post(Uri.parse(route), body: jsonEncode(body), headers: header)
          .timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          Utils.showCustomSnackBar(context!,'Something went wrong. Try again later.');
          return http.post(Uri.parse(route));
        },
      ).onError((error, stackTrace) {
        Utils.showCustomSnackBar(context!,'Something went wrong. Try again later.');
        return http.post(Uri.parse(route));
      });
      response = json.decode(resp.body);
      var token = json.decode(response['token']);
      return token;
    } on SocketException {
      return Future.error('No Internet connection 😑');
    } on FormatException {
      return Future.error('Bad Response Format');
    } on Exception {
      return Future.error(StringConstants.somethingWentWrong);
    } catch (e, s) {
      // EasyLoading.dismiss();
      log('API CLIENT EXE: ${e.toString()}');
      log('API CLIENT EXE: $s');
    }
    return null;
  }

  @override
  Future<dynamic> get(String route, BuildContext context, {type}) async {
    header['Content-Type'] = 'application/json';
    header['Authorization'] =
        await sharedPreferencesAsync.getString(SharedPrefConstants.accessTokenKey);
    log('HEADERS: $header');
    var response;
    http.Response? resp;
    try {
      debugPrint("=========================================");
      debugPrint("###: $route");
      // debugPrint("###: ${body.toString()}");
      resp = await _getHttpClient(context)
          .get(Uri.parse(route), headers: header)
          .timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          Utils.showCustomSnackBar(context!,'Something went wrong. Try again later.');
          return http.post(Uri.parse(route));
        },
      ).onError((error, stackTrace) {
        Utils.showCustomSnackBar(context!,'Something went wrong. Try again later.');
        return http.post(Uri.parse(route));
      });

      debugPrint("###: ${resp.body.toString()}");
      debugPrint("=========================================");
      response = json.decode(resp.body);
    } catch (e, s) {
      // EasyLoading.dismiss();
      log('API CLIENT EXE: ${e.toString()}');
      log('API CLIENT EXE: $s');
    }
    return response;
  }
}
