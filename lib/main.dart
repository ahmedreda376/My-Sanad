import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Auth/Presentation/Screens/finish_otp_screen.dart';
import 'package:flutter_application_1/Auth/Presentation/Screens/forget_password.dart';
import 'package:flutter_application_1/Auth/Presentation/Screens/login_User_screen.dart';
import 'package:flutter_application_1/Auth/Presentation/Screens/login_Provider.dart';
import 'package:flutter_application_1/Auth/Presentation/Screens/new_Password.dart';
import 'package:flutter_application_1/Auth/Presentation/Screens/otp_screen.dart';
import 'package:flutter_application_1/Auth/Presentation/Screens/signup_screen.dart';
import 'package:flutter_application_1/Auth/Presentation/Screens/splash_Screen.dart';
import 'package:flutter_application_1/l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(DevicePreview(builder: (context) => const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        locale:  Locale('ar'),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: SignupScreen(),
      ),
    );
  }
}
