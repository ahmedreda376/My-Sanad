import 'package:flutter/material.dart';
import 'package:flutter_application_1/Auth/Presentation/Widgets/custom_Button.dart';
import 'package:flutter_application_1/Auth/Presentation/Widgets/custom_appbarText.dart';
import 'package:flutter_application_1/Auth/Presentation/Widgets/custom_sentince.dart';
import 'package:flutter_application_1/Auth/Presentation/Widgets/custom_textFormField.dart';
import 'package:flutter_application_1/Auth/Presentation/Widgets/custom_textLabel.dart';
import 'package:flutter_application_1/core/colors.dart';
import 'package:flutter_application_1/l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});


  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final globKey = GlobalKey<FormState>();

  final nameController = TextEditingController();

  final phoneController = TextEditingController();

  final cityController = TextEditingController();

  final regionController = TextEditingController();

  final passwordController = TextEditingController();

  bool isChecked = false;

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    cityController.dispose();
    regionController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: AppThemes.cremeyColor,
          title: CustomAppbartext(
            text: AppLocalizations.of(context)!.registerTitle,
          ),
        ),
        backgroundColor: AppThemes.cremeyColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  AppLocalizations.of(context)!.registerSubtitle,
                  style: TextStyle(color: AppThemes.hiAccount),
                ),
              ),

              SizedBox(height: 20.h),
              Form(
                key: globKey,
                child: Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      //Name Field
                      CustomTextlabel(
                        text: AppLocalizations.of(context)!.fullName,
                      ),
                      SizedBox(height: 10.h),
                      CustomTextformfield(
                        controller: nameController,
                        bordercolor: AppThemes.redColor,
                        icon: Icons.person,
                        text: AppLocalizations.of(context)!.hintFullName,
                        fillcolor: AppThemes.whiteColor,
                      ),
                      SizedBox(height: 15.h),

                      //  Phone Field
                      CustomTextlabel(
                        text: AppLocalizations.of(context)!.phoneNumber,
                      ),
                      SizedBox(height: 10.h),

                      CustomTextformfield(
                        controller: phoneController,
                        bordercolor: AppThemes.redColor,
                        icon: Icons.phone_outlined,
                        text: '01135045965',
                        fillcolor: AppThemes.whiteColor,
                      ),
                      SizedBox(height: 15.h),

                      // City Field
                      CustomTextlabel(text: AppLocalizations.of(context)!.city),
                      SizedBox(height: 10.h),

                      CustomTextformfield(
                        controller: cityController,
                        bordercolor: AppThemes.redColor,
                        icon: Icons.location_on_outlined,
                        text: AppLocalizations.of(context)!.hintCity,
                        fillcolor: AppThemes.whiteColor,
                      ),

                      SizedBox(height: 15.h),
                      //Region Field
                      CustomTextlabel(text: AppLocalizations.of(context)!.area),
                      SizedBox(height: 10.h),
                      CustomTextformfield(
                        controller: regionController,
                        bordercolor: AppThemes.redColor,
                        icon: Icons.location_on_outlined,
                        text: AppLocalizations.of(context)!.hintArea,
                        fillcolor: AppThemes.whiteColor,
                      ),

                      SizedBox(height: 15.h),
                      //Password Field
                      CustomTextlabel(
                        text: AppLocalizations.of(context)!.password,
                      ),
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

              SizedBox(height: 15.h),
              //Piracy Password
              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value ?? false;
                      });
                    },
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Text(
                        AppLocalizations.of(context)!.agreeToPrivacyAndTerms,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: AppThemes.greenColor,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Create Account Button
              Padding(
                padding: EdgeInsets.all(8.w),
                child: CustomButton(
                  text: AppLocalizations.of(context)!.createAccountButton,
                ),
              ),

              SizedBox(height: 10.h),

              // Do You Have Account
              Padding(
                padding: EdgeInsets.all(8.w),
                child: CustomSentince(
                  text1: AppLocalizations.of(context)!.haveAccount,
                  text2: AppLocalizations.of(context)!.loginButton,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
