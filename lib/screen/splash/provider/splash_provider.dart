import 'package:flutter/material.dart';
import 'package:vf_app/screen/homeScreen/home_screen.dart';
import 'package:vf_app/screen/login/login_screen.dart';
import 'package:vf_app/screen/tabScreen.dart';

class SplashProvider extends ChangeNotifier {



  startTimer({required BuildContext context, required bool isLoggedIn}) {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      if (context.mounted) {
        if(isLoggedIn){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const HomeScreen()));
        }else{
          // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const LoginScreen()));
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const BottomNavScreen()));
        }
      }
    });
  }
}
