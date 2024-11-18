import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:istegram/core/themes/color.dart';


class AppTextTheme {
  //style
  AppTextTheme._();

  static TextStyle appBarTitle(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).brightness == Brightness.dark
          ? AppColor.primaryBackground
          : AppColor.pageColor,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle videoDuration(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      color: Theme.of(context).brightness == Brightness.dark
          ? Colors.white
          : Colors.black,
    );
  }

  static TextStyle headline1(BuildContext context) {
    return TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).brightness == Brightness.dark
          ? AppColor.pageColor
          : AppColor.primaryBackground,
    );
  }

  static TextStyle profil(BuildContext context) {
    return TextStyle(
      fontSize: 18,
      color: Theme.of(context).brightness == Brightness.dark
          ? AppColor.primaryBackground
          : AppColor.pageColor,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle headline2(BuildContext context) {
    return TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).brightness == Brightness.dark
          ? AppColor.pageColor
          : AppColor.primaryBackground,
    );
  }

  static TextStyle bodyText1(BuildContext context) {
    return TextStyle(
      fontSize: 16,
      color: Theme.of(context).brightness == Brightness.dark
          ? AppColor.pageColor
          : AppColor.primaryBackground,
    );
  }

  static TextStyle bodyText2(BuildContext context) {
    return TextStyle(
      fontSize: 14,
      color: Theme.of(context).brightness == Brightness.dark
          ? AppColor.pageColor
          : AppColor.primaryBackground,
    );
  }

  static TextStyle caption(BuildContext context) {
    return TextStyle(
      fontSize: 12,
      color: Theme.of(context).brightness == Brightness.dark
          ? AppColor.pageColor
          : AppColor.primaryBackground,
    );
  }

  static TextStyle button(BuildContext context) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).brightness == Brightness.dark
          ? AppColor.pageColor
          : AppColor.primaryBackground,
    );
  }

  static TextStyle appBarTitleSmall(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).brightness == Brightness.dark
          ? AppColor.primaryBackground
          : AppColor.pageColor,
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle nextAction(BuildContext context) {
    return TextStyle(
      fontSize: 15.sp,
      color: Theme.of(context).brightness == Brightness.dark
          ? AppColor.actionColor
          : AppColor.pageColor,
    );
  }

  static TextStyle recentLabel(BuildContext context) {
    return TextStyle(
      fontSize: 15.sp,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle noMediaFound(BuildContext context) {
    return TextStyle(
      fontSize: 14.sp,
      color: Theme.of(context).brightness == Brightness.dark
          ? AppColor.primaryBackground
          : AppColor.pageColor,
    );
  }

  static BoxDecoration bottomNavContainerStyle(BuildContext context) {
    return BoxDecoration(
      color: Theme.of(context).brightness == Brightness.dark
          ? Colors.black.withOpacity(0.6)
          : Colors.white.withOpacity(0.6),
      borderRadius: BorderRadius.circular(20.r),
    );
  }

  static TextStyle activeTextStyle(BuildContext context) {
    return TextStyle(
      fontSize: 15.sp,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).brightness == Brightness.dark
          ? Colors.white
          : Colors.black,
    );
  }

  static TextStyle inactiveTextStyle(BuildContext context) {
    return TextStyle(
      fontSize: 15.sp,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).brightness == Brightness.dark
          ? Colors.grey
          : Colors.black.withOpacity(0.6),
    );
  }

  static TextStyle profils(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).brightness == Brightness.dark
          ? Colors.red
          : Colors.blue,
      fontWeight: FontWeight.bold,
      fontSize: 18.sp,
    );
  }
}
