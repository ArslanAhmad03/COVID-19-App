import 'package:flutter/material.dart';

final colorList = <Color>[
  Color(0xff4285F4),
  Color(0xff1aa260),
  Color(0xffde5246),
];

class AppColors {
  static const Color backgroundColorDark = Color(0xFF26292E);
  static const Color backgroundColorLight = Color(0xFFF5F5F5);

  static const Color primaryColor = Color(0xff1aa260);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color blackColor = Color(0xFF000000);
  static const Color textColorLight = Color(0xFF1E1E1E);
}

class AppTheme {
  // LIGHT THEME
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.backgroundColorLight,

    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryColor,
      onPrimary: AppColors.whiteColor,
      secondary: AppColors.primaryColor,
      onSecondary: AppColors.whiteColor,
      surface: AppColors.whiteColor,
      onSurface: AppColors.textColorLight,
      error: Colors.red,
      onError: AppColors.whiteColor,
    ),

    cardTheme: const CardThemeData(color: AppColors.whiteColor, elevation: 0),
    iconTheme: const IconThemeData(color: AppColors.textColorLight),
  );

  // DARK THEME
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.backgroundColorDark,

    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryColor,
      onPrimary: AppColors.whiteColor,
      secondary: AppColors.primaryColor,
      onSecondary: AppColors.whiteColor,
      surface: AppColors.backgroundColorDark,
      onSurface: AppColors.whiteColor,
      error: Colors.red,
      onError: AppColors.whiteColor,
    ),

    cardTheme: const CardThemeData(
      color: AppColors.textColorLight,
      elevation: 0,
    ),
    iconTheme: const IconThemeData(color: AppColors.whiteColor),
  );
}
