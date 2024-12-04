import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:istegram/core/themes/color.dart';

class AppTextTheme {
  //style
  AppTextTheme._();

  static TextStyle bodyText(BuildContext context) {
    return const TextStyle(fontSize: 16, color: AppColor.pageColor);
  }

  static TextStyle noMediaFound(BuildContext context) {
    return TextStyle(
      fontSize: 14.sp,
      color: AppColor.secondaryBackground,
    );
  }

  static TextStyle inactiveTextStyle(BuildContext context) {
    return TextStyle(
        fontSize: 15.sp, fontWeight: FontWeight.w500, color: Colors.grey);
  }

  static TextStyle textsStyla(BuildContext context) {
    return TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.normal,
      color: AppColor.pageColor,
    );
  }

  static TextStyle accoount(BuildContext context) {
    return TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
      color: AppColor.primaryBackground,
    );
  }

  static TextStyle forget(BuildContext context) {
    return TextStyle(
      fontSize: 15.sp,
      color: AppColor.primaryBackground,
    );
  }

  static TextStyle reset(BuildContext context) {
    return TextStyle(
      fontSize: 15.sp,
      color: AppColor.actionColor,
    );
  }
    static TextStyle heading(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return TextStyle(
      fontSize: 18,
      color: theme.brightness == Brightness.dark
          ? AppColor.white
          : AppColor.textLiht,
      fontWeight: FontWeight.w900,
      shadows: const [
        BoxShadow(
          color: AppColor.shadow,
          blurRadius: 3,
          offset: Offset(0, 1),
        ),
      ],
    );
  }
}
