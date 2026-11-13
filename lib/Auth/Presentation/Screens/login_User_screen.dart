import 'package:flutter/material.dart';
import 'package:flutter_application_1/Auth/Presentation/Widgets/custom_Button.dart';
import 'package:flutter_application_1/Auth/Presentation/Widgets/custom_appbar.dart';
import 'package:flutter_application_1/Auth/Presentation/Widgets/custom_appbarText.dart';
import 'package:flutter_application_1/Auth/Presentation/Widgets/custom_sentince.dart';
import 'package:flutter_application_1/Auth/Presentation/Widgets/custom_textFormField.dart';
import 'package:flutter_application_1/Auth/Presentation/Widgets/custom_textLabel.dart';
import 'package:flutter_application_1/core/colors.dart';
import 'package:flutter_application_1/l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginUserScreen extends StatefulWidget {
  const LoginUserScreen({super.key});

  @override
  State<LoginUserScreen> createState() => _LoginUserScreenState();
}

class _LoginUserScreenState extends State<LoginUserScreen> {
  final globKey = GlobalKey<FormState>();

  final phoneController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //AppBar
        appBar: AppBar(
          backgroundColor: AppThemes.cremeyColor,
          title: Row(
            children: [
              CustomAppbar(image: 'images/Sanad house · Soft rise.png'),
              CustomAppbartext(text: AppLocalizations.of(context)!.appName),
            ],
          ),
        ),
        backgroundColor: AppThemes.cremeyColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20.h),
              CustomAppbartext(text: AppLocalizations.of(context)!.loginTitle),

              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(AppLocalizations.of(context)!.loginSubtitle,
                  style: TextStyle(color: AppThemes.hiAccount),
                ),
              ),
              SizedBox(height: 50.h),
              Form(
                key: globKey,
                child: Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      //Phone Field
                      CustomTextlabel(text: AppLocalizations.of(context)!.phoneNumber),
                      SizedBox(height: 10.h),
                      CustomTextformfield(
                        controller: phoneController,
                        bordercolor: AppThemes.redColor,
                        icon: Icons.phone_outlined,
                        text: '01135045965',
                        fillcolor: AppThemes.whiteColor,
                      ),
                      SizedBox(height: 10.h),
                      //Password Field
                      CustomTextlabel(text: AppLocalizations.of(context)!.password),
                      SizedBox(height: 10.h),
      
                      CustomTextformfield(
                        controller: passwordController,
                        bordercolor: AppThemes.redColor,
                        icon: Icons.visibility_off_outlined,
                        text: '••••••••',
                        fillcolor: AppThemes.whiteColor,
                      ),
                    ],
                  ),
                ),
              ),
      
              //Forget Password
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(AppLocalizations.of(context)!.forgotPasswordLink,
                  style: TextStyle(
                    color: AppThemes.redColor,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
      
              // Login Button
              Padding(
                padding: EdgeInsets.all(8.w),
                child: CustomButton(text: AppLocalizations.of(context)!.loginButton),
              ),
      
              SizedBox(height: 25.h),
              //  Privacy
              Padding(
                padding: EdgeInsets.all(8.w),
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppThemes.privacyColor,
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: AppThemes.redColor, width: 1.r),
                  ),
                  child: Row(
                    spacing: 2.h,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'images/shield-check.png',
                        height: 25.h,
                        width: 25.w,
                      ),
                      Expanded(
                        child: CustomTextlabel(
                          text:
                             AppLocalizations.of(context)!.dataSecurityNote,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      
              SizedBox(height: 5.h),
      
              //  New Account
              CustomSentince(
                text1:AppLocalizations.of(context)!.firstTimeHere,
                text2:AppLocalizations.of(context)!.createNewAccount,
              ),
      
              SizedBox(height: 15.h),
      
              // CopyRight
              Padding(
                padding: EdgeInsets.all(8.w),
                child: Text(
                  textAlign: TextAlign.center,
                  AppLocalizations.of(context)!.termsAgreementNote,
                  style: TextStyle(color: AppThemes.hiAccount),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
