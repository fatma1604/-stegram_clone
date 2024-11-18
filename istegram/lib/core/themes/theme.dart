import 'package:flutter/material.dart';
import 'package:istegram/core/themes/color.dart';



class AppTheme {
  AppTheme._();

  static final ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    colorScheme: const ColorScheme.light(
      background: AppColor.pageColor,
      
    ),
  );

  /* ------------- Dark theme ------------- */

  static final ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    colorScheme: const ColorScheme.dark(
      background: AppColor.primaryBackground,
    ),
  );
}