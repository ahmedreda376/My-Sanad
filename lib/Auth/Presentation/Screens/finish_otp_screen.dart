import 'package:flutter/material.dart';
import 'package:flutter_application_1/Auth/Presentation/Widgets/custom_Button.dart';
import 'package:flutter_application_1/Auth/Presentation/Widgets/custom_sentince.dart';
import 'package:flutter_application_1/core/colors.dart';
import 'package:flutter_application_1/l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FinishOtpScreen extends StatelessWidget {
  const FinishOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppThemes.cremeyColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomSentince(
              text1: AppLocalizations.of(context)!.passwordResetSuccessPrefix,
              text2:  AppLocalizations.of(context)!.loginButton,
            ),
            SizedBox(height: 10.h),
      
            Padding(
              padding:  EdgeInsets.all(8.w),
              child: CustomButton(text:  AppLocalizations.of(context)!.goToLoginButton),
            ),
          ],
        ),
      ),
    );
  }
}
