import 'package:flutter_application_1/Auth/Presentation/Screens/finish_otp_screen.dart';
import 'package:flutter_application_1/Auth/Presentation/Screens/forget_password.dart';
import 'package:flutter_application_1/Auth/Presentation/Screens/home_screen.dart';
import 'package:flutter_application_1/Auth/Presentation/Screens/login_Provider.dart';
import 'package:flutter_application_1/Auth/Presentation/Screens/login_User_screen.dart';
import 'package:flutter_application_1/Auth/Presentation/Screens/new_Password.dart';
import 'package:flutter_application_1/Auth/Presentation/Screens/otp_screen.dart';
import 'package:flutter_application_1/Auth/Presentation/Screens/signup_screen.dart';
import 'package:flutter_application_1/Auth/Presentation/Screens/splash_Screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/splash',
  routes: [

    GoRoute(path: '/home', builder: (context, state) => HomeScreen()),


    GoRoute(path: '/splash', builder: (context, state) => SplashScreen()),
    GoRoute(path: '/signUp', builder: (context, state) => SignupScreen()),
    GoRoute(
      path: '/otpScreen',
      builder: (context, state) =>
          OtpScreen(email: (state.extra as String?) ?? ''),
    ),
    GoRoute(path: '/newPassword', builder: (context, state) => NewPassword()),
    GoRoute(path: '/loginUser', builder: (context, state) => LoginUserScreen()),
    GoRoute(
      path: '/loginProvider',
      builder: (context, state) => LoginProvider(),
    ),
    GoRoute(
      path: '/forgetPassword',
      builder: (context, state) => ForgetPassword(),
    ),
    GoRoute(path: '/finishOtp', builder: (context, state) => FinishOtpScreen()),
  ],
);
