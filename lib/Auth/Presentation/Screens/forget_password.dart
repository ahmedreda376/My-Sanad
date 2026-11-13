import 'package:flutter/material.dart';
import 'package:flutter_application_1/Auth/Presentation/Widgets/custom_Button.dart';
import 'package:flutter_application_1/Auth/Presentation/Widgets/custom_appbarText.dart';
import 'package:flutter_application_1/Auth/Presentation/Widgets/custom_textFormField.dart';
import 'package:flutter_application_1/Auth/Presentation/Widgets/custom_textLabel.dart';
import 'package:flutter_application_1/core/colors.dart';
import 'package:flutter_application_1/l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final emailController = TextEditingController();

  final globKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppThemes.cremeyColor,
        //AppBar
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: AppThemes.cremeyColor,
          title: CustomAppbartext(text: AppLocalizations.of(context)!.forgotPasswordTitle),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Center(
                  child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //Email Field
              Padding(
                padding: EdgeInsets.all(8.w),
                child: CustomTextlabel(text:AppLocalizations.of(context)!.enterYourEmail ),
              ),
              Padding(
                padding: EdgeInsets.all(8.w),
                child: Form(
                  key: globKey,
                  child: CustomTextformfield(
                    controller: emailController,
                    bordercolor: AppThemes.redColor,
                    text: 'example@gmail.com',
                    icon: Icons.email_outlined,
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
          },
        ),
      ),
    );
  }
}
