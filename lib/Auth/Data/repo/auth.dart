import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/widgets/custom_SnakBar.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Auth {
  final supa = Supabase.instance.client.auth;

  // Login
  Future<void> login(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      await supa.signInWithPassword(email: email, password: password);
      customSnakbar(context, 'Success', Colors.green);
    } on AuthException catch (e) {
      customSnakbar(context, e.message, Colors.red);
    } catch (e) {
      customSnakbar(context, 'Failed To Login', Colors.red);
    }
  }

  // SignUp
  Future<void> signup(
    String name,
    String email,
    String city,
    String region,
    String password,
    BuildContext context,
  ) async {
    try {
      await supa.signUp(
        password: password,
        email: email,
        data: {'name': name, 'city': city, 'region': region},
      );
      customSnakbar(context, 'Success', Colors.green);
    } on AuthException catch (e) {
      customSnakbar(context, e.message, Colors.red);
    } catch (e) {
      customSnakbar(context, 'Fialed To SignUp', Colors.red);
    }
  }

  // Send Otp
  Future<void> sendOtp(String email, BuildContext context) async {
    try {
      await supa.resetPasswordForEmail(email);

      customSnakbar(context, 'OTP Sent Successfully', Colors.green);
    } on AuthException catch (e) {
      customSnakbar(context, e.message, Colors.red);
    } catch (e) {
      customSnakbar(context, 'Failed To Send OTP', Colors.red);
    }
  }

  // verifyOtp
  Future<void> verifyOtp(String email, String otp, BuildContext context) async {
    try {
      await supa.verifyOTP(email: email, token: otp, type: OtpType.recovery);
      context.go('/newPassword');
    } on AuthException catch (e) {
      customSnakbar(context, e.message, Colors.red);
    } catch (e) {
      customSnakbar(context, 'Failed To Verify OTP', Colors.red);
    }
  }

  // Reset Password
  resetPassword(String newpass, BuildContext context) async {
    try {
      await supa.updateUser(UserAttributes(password: newpass));
      customSnakbar(context, "Password Updated Successfully", Colors.green);
      context.go('/finishOtp');
    } on AuthException catch (e) {
      customSnakbar(context, e.message, Colors.red);
    } catch (e) {
      customSnakbar(context, e.toString(), Colors.red);
    }
  }
}
