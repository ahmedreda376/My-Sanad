import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSentince extends StatelessWidget {
  const CustomSentince({super.key, required this.text1, required this.text2});

  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 8.w),
      child: Text.rich(
        textAlign: TextAlign.center,
        TextSpan(
          children: [
            TextSpan(text: text1,style: TextStyle(fontSize: 11.sp)),
            TextSpan(
              text: ' $text2',
              style: TextStyle(
                fontSize: 11.sp,
                color: AppThemes.greenColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
