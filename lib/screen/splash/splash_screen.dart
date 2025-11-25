import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vf_app/constants/assets_constants.dart';
import 'package:vf_app/constants/shared_pref_constants.dart';
import 'package:vf_app/screen/splash/provider/splash_provider.dart';
import 'package:vf_app/utils/shared_prefs_singleton.dart';
import 'package:vf_app/utils/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double screenHeight = Utils.screenHeight;
  double screenWidth = Utils.screenWidth;

  late SplashProvider splashProvider;

  @override
  void initState() {
    super.initState();
    splashProvider = context.read<SplashProvider>();
    WidgetsBinding.instance.addPostFrameCallback(
          (timeStamp) async {
        bool isLoggedIn = await sharedPreferencesAsync.getBool(SharedPrefConstants.isLoggedIn);
        splashProvider.startTimer(context: context, isLoggedIn: isLoggedIn);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    splashProvider = context.watch<SplashProvider>();
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFFD54F ), // #FF9B63
              Colors.white,
              Color(0xFF2E7D32),
            ],
            stops: [0.1025, 0.6741, 1.23],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
            child: Image.asset(
                height: screenHeight * 0.2586, AssetsConstants.appLogo)),
      ),
    );
  }
}
