import 'package:flutter/material.dart';
import 'package:vf_app/services/network/api_client.dart';


class DashboardService {
  ApiClient rest = ApiClient();
  getWeatherData({required String url, required BuildContext context}) async {
    return rest.get(url, context);
  }
}
