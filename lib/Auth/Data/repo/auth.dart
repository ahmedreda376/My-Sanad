import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/widgets/custom_SnakBar.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Auth {
  final supa = Supabase.instance.client.auth;


// Login
Future<bool> login(
  String email,
  String password,
  BuildContext context,
) async {
  try {
    await supa.signInWithPassword(email: email, password: password);
    if (!context.mounted) return false;
    return true;
  } on AuthException catch (e) {
    if (!context.mounted) return false;

    String message;
    if (e.code == 'invalid_credentials' ||
        e.message.toLowerCase().contains('invalid login credentials')) {
      message = 'Incorrect email or password.';
    } else if (e.code == 'email_not_confirmed' ||
        e.message.toLowerCase().contains('email not confirmed')) {
      message = 'Please confirm your email first. Check your inbox.';
    } else {
      message = 'Login failed. Please try again.';
    }

    customSnakbar(context, message, Colors.red);
    return false;
  } catch (e) {
    if (!context.mounted) return false;
    customSnakbar(
      context,
      'Login failed. Please check your connection and try again.',
      Colors.red,
    );
    return false;
  }
}









  // SignUp
  Future<bool> signup(
    String name,
    String email,
    String city,
    String region,
    String password,
    BuildContext context,
  ) async {
    try {
      final res = await supa.signUp(
        password: password,
        email: email,
        data: {'name': name, 'city': city, 'region': region},
      );

      if (!context.mounted) return false;

      // إيميل متسجل قبل كده
      if (res.user != null && (res.user!.identities?.isEmpty ?? false)) {
        customSnakbar(
          context,
          'This email is already registered. Try logging in instead.',
          Colors.red,
        );
        return false;
      }

      customSnakbar(
        context,
        'Account created. Please check your email to confirm it.',
        Colors.green,
      );

      return true;
    } on AuthException catch (e) {
      if (!context.mounted) return false;
      customSnakbar(context, e.message, Colors.red);
      return false;
    } catch (e) {
      if (!context.mounted) return false;
      customSnakbar(
        context,
        'Sign up failed. Please check your connection and try again.',
        Colors.red,
      );
      return false;
    }
  }

  // Send Otp
  Future<bool> sendOtp(String email, BuildContext context) async {
    try {
      await supa.resetPasswordForEmail(email);
      if (!context.mounted) return false;

      customSnakbar(context, 'We sent a code to your email', Colors.green);

      return true;
    } on AuthException catch (e) {
      if (!context.mounted) return false;

      customSnakbar(context, e.message, Colors.red);

      return false;
    } catch (e) {
      if (!context.mounted) return false;

      customSnakbar(
        context,
        'Could not send the code. Please check your connection and try again.',
        Colors.red,
      );

      return false;
    }
  }

  // verifyOtp
  Future<void> verifyOtp(String email, String otp, BuildContext context) async {
    try {
      await supa.verifyOTP(email: email, token: otp, type: OtpType.recovery);
      if (!context.mounted) return;
      context.go('/newPassword');
    } on AuthException catch (e) {
      if (!context.mounted) return;
      customSnakbar(context, e.message, Colors.red);
    } catch (e) {
      if (!context.mounted) return;
      customSnakbar(
        context,
        'Could not verify the code. Please check your connection and try again.',
        Colors.red,
      );
    }
  }

  // Reset Password
  Future<void> resetPassword(String newpass, BuildContext context) async {
    try {
      await supa.updateUser(UserAttributes(password: newpass));
      await supa.signOut();
      if (!context.mounted) return;
      customSnakbar(context, 'Password updated successfully', Colors.green);
      context.go('/finishOtp');
    } on AuthException catch (e) {
      if (!context.mounted) return;
      customSnakbar(context, e.message, Colors.red);
    } catch (e) {
      if (!context.mounted) return;
      customSnakbar(
        context,
        'Could not update your password. Please check your connection and try again.',
        Colors.red,
      );
    }
  }
}