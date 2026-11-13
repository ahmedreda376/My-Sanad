import 'package:flutter/material.dart';
import 'package:flutter_application_1/Auth/Presentation/Widgets/custom_Button.dart';
import 'package:flutter_application_1/Auth/Presentation/Widgets/custom_appbar.dart';
import 'package:flutter_application_1/Auth/Presentation/Widgets/custom_appbarText.dart';
import 'package:flutter_application_1/Auth/Presentation/Widgets/custom_textFormField.dart';
import 'package:flutter_application_1/Auth/Presentation/Widgets/custom_textLabel.dart';
import 'package:flutter_application_1/core/colors.dart';
import 'package:flutter_application_1/l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginProvider extends StatefulWidget {
  const LoginProvider({super.key});

  @override
  State<LoginProvider> createState() => _LoginProviderState();
}

class _LoginProviderState extends State<LoginProvider> {
  final globKey = GlobalKey<FormState>();

  final phoneController = TextEditingController();
  final idController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    idController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // AppBar
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
              SizedBox(height: 15.h),
              CustomAppbartext(text: AppLocalizations.of(context)!.loginTitle),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),

                child: Text(
                  AppLocalizations.of(context)!.loginSubtitle,
                  style: TextStyle(color: AppThemes.hiAccount),
                ),
              ),
              SizedBox(height: 30.h),
              Form(
                key: globKey,
                child: Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    spacing: 2.h,
                    children: [
                      //Phone Field
                      CustomTextlabel(
                        text: AppLocalizations.of(context)!.phoneNumber,
                      ),
                      SizedBox(height: 8.h),
                      CustomTextformfield(
                        controller: phoneController,
                        bordercolor: AppThemes.redColor,
                        icon: Icons.phone_outlined,
                        text: AppLocalizations.of(context)!.hintPhone,
                        fillcolor: AppThemes.whiteColor,
                      ),
                      SizedBox(height: 10.h),

                      //  Id Field
                      CustomTextlabel(
                        text: AppLocalizations.of(context)!.nationalId,
                      ),
                      SizedBox(height: 8.h),
                      CustomTextformfield(
                        controller: idController,
                        bordercolor: AppThemes.redColor,
                        icon: Icons.phone_outlined,
                        text: '152341425723',
                        fillcolor: AppThemes.whiteColor,
                      ),
                      SizedBox(height: 10.h),

                      // Email Field
                      CustomTextlabel(
                        text: AppLocalizations.of(context)!.email,
                      ),
                      SizedBox(height: 8.h),

                      CustomTextformfield(
                        controller: emailController,
                        bordercolor: AppThemes.redColor,
                        icon: Icons.email_outlined,
                        text: 'example@gmail.com',
                        fillcolor: AppThemes.whiteColor,
                      ),
                      SizedBox(height: 10.h),

                      //Password Field
                      CustomTextlabel(
                        text: AppLocalizations.of(context)!.password,
                      ),
                      SizedBox(height: 8.h),
                      CustomTextformfield(
                        controller: passwordController,
                        bordercolor: AppThemes.redColor,
                        icon: Icons.visibility_off_outlined,
                        text: '••••••••',
                        fillcolor: AppThemes.whiteColor,
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
              ),

              //Forget Password
              Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  AppLocalizations.of(context)!.forgotPasswordLink,
                  style: TextStyle(
                    color: AppThemes.redColor,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10.h),

              // Login Button
              Padding(
                padding: EdgeInsets.all(8.w),
                child: CustomButton(
                  text: AppLocalizations.of(context)!.loginButton,
                ),
              ),

              SizedBox(height: 8.h),

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
