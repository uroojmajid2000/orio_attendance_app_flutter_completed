import 'package:flutter/material.dart';
import 'package:orio_attendance_app_flutter/resources/colors.dart';
import 'package:orio_attendance_app_flutter/shared/transition/transition.dart';

class AppTheme {
  static ThemeData themeData() {
    return ThemeData(
      primaryColor: kPrimaryColor,
      colorScheme: const ColorScheme.light(
        primary: kPrimaryColor,
      ),
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Ubuntu',
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: TransitionsBuilder(),
          TargetPlatform.iOS: TransitionsBuilder(),
        },
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: kPrimaryColor,
      ),
    );
  }
}
