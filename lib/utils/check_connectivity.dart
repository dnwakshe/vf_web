import 'package:connectivity_plus/connectivity_plus.dart';

class CheckConnectivity{
  static final CheckConnectivity _singleton = CheckConnectivity._internal();


  factory CheckConnectivity() {
    return _singleton;
  }

  CheckConnectivity._internal();


  // Function to check internet connectivity
  Future<bool> checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    var result = false;
    for (var element in connectivityResult) {
      if (element == ConnectivityResult.mobile ||
          element == ConnectivityResult.wifi) {
        result =  true;
      } else {
        result = false;
      }
    }
    return result;
  }
}