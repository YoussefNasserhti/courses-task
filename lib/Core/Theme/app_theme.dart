import 'package:flutter/material.dart';
import 'package:courses_task/Core/Utils/app_colors.dart'; // اسم الملف لا يتغير

class AppTheme {

  static final ThemeData _themeLight = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkBlue,
      foregroundColor: AppColors.white,
      titleTextStyle: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20,
      ),
      surfaceTintColor: Colors.red,
    ),
    scaffoldBackgroundColor: AppColors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.blue),
        foregroundColor: MaterialStateProperty.all(AppColors.white),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    ),
  );

  static final ThemeData _themeNight = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.blue,
      foregroundColor: AppColors.white,
      titleTextStyle: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20,
      ),
      surfaceTintColor: Colors.transparent,
    ),
    scaffoldBackgroundColor: AppColors.blue,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.white),
        foregroundColor: MaterialStateProperty.all(AppColors.blue),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    ),
  );

  static ThemeData get themeNight => _themeNight;
  static ThemeData get themeLight => _themeLight;
}
