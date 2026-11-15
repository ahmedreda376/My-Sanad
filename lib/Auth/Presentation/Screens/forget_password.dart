import 'package:flutter/material.dart';
import 'package:flutter_application_1/Auth/Data/repo/auth.dart';
import 'package:flutter_application_1/Auth/Presentation/Widgets/custom_Button.dart';
import 'package:flutter_application_1/Auth/Presentation/Widgets/custom_appbarText.dart';
import 'package:flutter_application_1/Auth/Presentation/Widgets/custom_textFormField.dart';
import 'package:flutter_application_1/Auth/Presentation/Widgets/custom_textLabel.dart';
import 'package:flutter_application_1/core/colors.dart';
import 'package:flutter_application_1/l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final emailController = TextEditingController();
  final globKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future<void> _sendOtp() async {
    if (isLoading) return;
    if (!globKey.currentState!.validate()) return;

    setState(() => isLoading = true);
    final email = emailController.text.trim();
    final ok = await Auth().sendOtp(email, context);
    if (!mounted) return;
    setState(() => isLoading = false);

    if (ok) context.push('/otpScreen', extra: email);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppThemes.cremeyColor,
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: AppThemes.cremeyColor,
          title: CustomAppbartext(
            text: AppLocalizations.of(context)!.forgotPasswordTitle,
          ),
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
                      Padding(
                        padding: EdgeInsets.all(8.w),
                        child: CustomTextlabel(
                          text: AppLocalizations.of(context)!.enterYourEmail,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.w),
                        child: Form(
                          key: globKey,
                          child: CustomTextformfield(
                            validator: Validators.email,
                            keyboardType: TextInputType.emailAddress,
                            isPassword: false,
                            controller: emailController,
                            bordercolor: AppThemes.redColor,
                            text: 'example@gmail.com',
                            icon: Icons.email_outlined,
                            fillcolor: AppThemes.whiteColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      GestureDetector(
                        onTap: _sendOtp,
                        child: Padding(
                          padding: EdgeInsets.all(8.w),
                          child: CustomButton(
                            text: AppLocalizations.of(context)!.sendOtpButton,
                            isLoading: isLoading,
                          ),
                        ),
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