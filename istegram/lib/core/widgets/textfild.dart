// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:istegram/core/constant/text_them.dart';
import 'package:istegram/core/themes/color.dart';

class CustomTextField extends StatelessWidget {
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
          style: AppTextTheme.noMediaFound(context),
          controller: controller,
          focusNode: focusNode,
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: isDarkMode
                ? const Color.fromARGB(166, 5, 31, 53)
                : AppColor
                    .pageColor, // Light gray for dark mode // Slightly transparent black for light mode
            contentPadding: EdgeInsets.symmetric(
                horizontal: 30.w, vertical: 30.h), // Adjusted vertical padding
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r), // Oval corners
              borderSide: BorderSide(
                width: 2.w,
                color: isDarkMode
                    ? Colors.white
                        .withOpacity(0.5) // Light border for dark mode
                    : Colors.grey, // Darker border for light mode
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r), // Oval corners
              borderSide: BorderSide(
                width: 2.w,
                color: isDarkMode
                    ? AppColor
                        .primaryBackground // Dark mode focused border color
                    : AppColor
                        .primaryBackground, // Light mode focused border color
              ),
            ),
          ),
        ),
      ),
    );
  }
}
