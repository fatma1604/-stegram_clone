// ignore_for_file: prefer_const_constructors_in_immutables, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:istegram/core/themes/color.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String hintText;

  CustomTextField({
    required this.controller,
    required this.focusNode,
    required this.hintText,
    super.key,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isTyping = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onTextChanged);
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      isTyping = widget.controller.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Container(
        height: 80.h,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.zero,
        ),
        child: TextField(
          style: TextStyle(
            color: isDarkMode ? AppColor.pageColor : AppColor.primaryBackground,
            fontSize: 16.sp,
          ),
          controller: widget.controller,
          focusNode: widget.focusNode,
          decoration: InputDecoration(
            labelText: widget.hintText,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            labelStyle: const TextStyle(
              color: AppColor.semiWhite,
            ),
            filled: true,
            fillColor: AppColor.subtleWhite,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(
                    width: 2.w,
                    color: isDarkMode
                        ? AppColor.frostedWhite.withOpacity(0.5)
                        : AppColor.mutedWhite.withOpacity(0.5))),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                  width: 2.w,
                  color:
                      isDarkMode ? AppColor.brightWhite : AppColor.mutedWhite),
            ),
          ),
        ),
      ),
    );
  }
}
