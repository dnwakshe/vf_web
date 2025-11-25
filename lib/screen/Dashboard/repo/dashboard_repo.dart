// import 'package:flutter/material.dart';
// import 'package:web_test/UI/Dashboard/dataModels/weatherDataModel.dart';
// import 'package:web_test/UI/Dashboard/services/dashboard_service.dart';

// class DashboardRepo {
//   DashboardService dashboardService = DashboardService();
//   Future<WeatherDataModel?> getWeatherData(
//       {required String url, required BuildContext context}) async {
//     try {
//       var data =
//           await dashboardService.getWeatherData(url: url, context: context);
//           print("data $data");
//       if (data != null) {
//         WeatherDataModel weatherDataModel = WeatherDataModel();
//         weatherDataModel = WeatherDataModel.fromJson(data);
//         return weatherDataModel;
//       } else {
//         return null;
//       }
//     } catch (e,s) {
//       print("error $e $s");
//       return null;
//     }
//   }
// }
