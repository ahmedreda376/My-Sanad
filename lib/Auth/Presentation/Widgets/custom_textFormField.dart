import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextformfield extends StatefulWidget {
  const CustomTextformfield({
    super.key,
    required this.controller,
    required this.bordercolor,
     this.icon,
    required this.text,
    required this.fillcolor,
  });

  final TextEditingController controller;
  final Color bordercolor;
  final Color fillcolor;

  final IconData? icon;
  final String text;

  @override
  State<CustomTextformfield> createState() => _CustomTextformfieldState();
}

class _CustomTextformfieldState extends State<CustomTextformfield> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: widget.fillcolor,
        suffixIcon: Icon(widget.icon),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(width: 1.w, color: widget.bordercolor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(width: 1.w, color: widget.bordercolor),
        ),
        hintText: widget.text,
      ),
    );
  }
}
