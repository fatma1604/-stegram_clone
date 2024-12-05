// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:istegram/core/themes/color.dart';

class AppIconTheme {
  AppIconTheme._();

  static IconButton closeButton(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.pop(context),
      icon: const Icon(Icons.close),
      iconSize: 24.sp,
      color: AppColor.pageColor,
    );
  }

  static IconButton backButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back, size: 30),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
