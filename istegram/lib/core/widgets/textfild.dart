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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Container(
        height: 80.h, // Increased height to make it thicker vertically
        decoration: BoxDecoration(
          borderRadius: BorderRadius.zero,
        ),
        child: TextField(
          style: AppTextTheme.noMediaFound(context),
          controller: controller,
          focusNode: focusNode,
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: const Color.fromARGB(110, 0, 0, 0),
            contentPadding: EdgeInsets.symmetric(
                horizontal: 30.w, vertical: 30.h), // Adjusted vertical padding
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r), // Oval corners
              borderSide: BorderSide(width: 2.w, color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r), // Oval corners
              borderSide:
                  BorderSide(width: 2.w, color: AppColor.primaryBackground),
            ),
          ),
        ),
      ),
    );
  }
}
