import 'package:flutter/material.dart';
import 'package:flutter_application_1/Auth/Presentation/Widgets/custom_Button.dart';
import 'package:flutter_application_1/Auth/Presentation/Widgets/custom_appbarText.dart';
import 'package:flutter_application_1/Auth/Presentation/Widgets/custom_textFormField.dart';
import 'package:flutter_application_1/Auth/Presentation/Widgets/custom_textLabel.dart';
import 'package:flutter_application_1/core/colors.dart';
import 'package:flutter_application_1/l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final globKey = GlobalKey<FormState>();

  final otpController = TextEditingController();

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppThemes.cremeyColor,
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: AppThemes.cremeyColor,
          title: CustomAppbartext(text: AppLocalizations.of(context)!.otpTitle),
        ),

        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Email Field
              Padding(
                padding: EdgeInsets.all(8.w),
                child: CustomTextlabel(
                  text:
                   AppLocalizations.of(context)!.otpMessage,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.w),
                child: Form(
                  key: globKey,
                  child: CustomTextformfield(
                    controller: otpController,
                    bordercolor: AppThemes.redColor,
                    text: '384591',
                    fillcolor: AppThemes.whiteColor,
                  ),
                ),
              ),

              SizedBox(height: 10.h),
              //  Send OTP Button
              Padding(
                padding: EdgeInsets.all(8.w),
                child: CustomButton(text: AppLocalizations.of(context)!.sendOtpButton),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
