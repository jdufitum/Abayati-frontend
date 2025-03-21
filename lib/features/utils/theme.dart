import 'package:flutter/material.dart';
import 'app_color.dart';

class AppThemeData {
  static ThemeData appThemeData(BuildContext context) {
    return ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColor.primary,
        primarySwatch: kMaterialColor,
        splashFactory: NoSplash.splashFactory,
        primaryColor: AppColor.primary);
  }
}
