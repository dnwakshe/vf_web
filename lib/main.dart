import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
<<<<<<< HEAD
=======
import 'package:flutter/cupertino.dart';
>>>>>>> 027bce8cbfc59bc57ec502c974ca59433750a853
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vf_app/constants/app_colors.dart';
import 'package:vf_app/constants/font_constants.dart';
import 'package:vf_app/constants/string_constants.dart';
<<<<<<< HEAD
import 'package:vf_app/screen/homeScreen/home_screen.dart';
=======
import 'package:vf_app/screen/splash/splash_screen.dart';
>>>>>>> 027bce8cbfc59bc57ec502c974ca59433750a853
import 'package:vf_app/utils/utils.dart';

import 'provider/app_providers.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  HttpOverrides.global = DevHttpOverrides();
  runApp(EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('mr')],
      path: 'assets/language',
      fallbackLocale: const Locale('en', 'US'),
      child: const MyApp()));
}

class DevHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Utils.defineScreenDimensions(context);
    return MultiProvider(
      providers: AppProviders.getProviders(),
      child: MaterialApp(
        title: StringConstants.appName,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(
          fontFamily: FontConstants.inter,
          textTheme: const TextTheme(
            bodyLarge: TextStyle(fontFamily: FontConstants.inter),
            bodyMedium: TextStyle(fontFamily: FontConstants.inter),
            headlineLarge: TextStyle(fontFamily: FontConstants.inter, fontWeight: FontWeight.bold),
            headlineSmall: TextStyle(fontFamily: FontConstants.inter, fontWeight: FontWeight.w600),
            titleLarge: TextStyle(fontFamily: FontConstants.inter, fontWeight: FontWeight.w500),
          ),
          colorScheme: ColorScheme.fromSeed(
              primary: AppColors.primary, seedColor: AppColors.primary),
          useMaterial3: false,
<<<<<<< HEAD
          appBarTheme: const AppBarTheme(
            elevation: 2,
            centerTitle: false,
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.transparent,
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
=======
        ),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
>>>>>>> 027bce8cbfc59bc57ec502c974ca59433750a853
      ),
    );
  }
}
