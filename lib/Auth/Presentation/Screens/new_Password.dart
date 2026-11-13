import 'package:flutter/material.dart';
import 'package:flutter_application_1/Auth/Presentation/Widgets/custom_Button.dart';
import 'package:flutter_application_1/Auth/Presentation/Widgets/custom_appbarText.dart';
import 'package:flutter_application_1/Auth/Presentation/Widgets/custom_textFormField.dart';
import 'package:flutter_application_1/Auth/Presentation/Widgets/custom_textLabel.dart';
import 'package:flutter_application_1/core/colors.dart';
import 'package:flutter_application_1/l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final passControllerOne = TextEditingController();

  final passControllerTwo = TextEditingController();

  final globKey = GlobalKey<FormState>();

  @override
  void dispose() {
    passControllerOne.dispose();
    passControllerTwo.dispose();
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
          title: CustomAppbartext(text: AppLocalizations.of(context)!.newPasswordTitle),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            
            return SingleChildScrollView(
              
              child: ConstrainedBox(constraints: BoxConstraints(
                minHeight: constraints.maxHeight
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Email Field
                    Padding(
                      padding: EdgeInsets.all(8.w),
                      child: CustomTextlabel(
                        text: AppLocalizations.of(context)!.enterNewPassword
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.w),
                      child: Form(
                        key: globKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            //password 1
                            CustomTextformfield(
                              controller: passControllerOne,
                              bordercolor: AppThemes.redColor,
                              fillcolor: AppThemes.whiteColor,
                              icon: Icons.visibility_off_outlined,
                              text: '••••••••',
                            ),
                            SizedBox(height: 20.h),

                            //  password 2
                            CustomTextlabel(text: AppLocalizations.of(context)!.confirmPassword),
                            SizedBox(height: 10.h),
                            CustomTextformfield(
                              controller: passControllerTwo,
                              bordercolor: AppThemes.redColor,
                              fillcolor: AppThemes.whiteColor,
                              icon: Icons.visibility_off_outlined,
                              text: '••••••••',
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 10.h),
                    //Done Button
                    Padding(
                      padding:  EdgeInsets.all(8.w),
                      child: CustomButton(text: AppLocalizations.of(context)!.doneButton),
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
