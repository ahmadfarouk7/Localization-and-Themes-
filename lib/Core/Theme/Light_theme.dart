import 'package:flutter/material.dart';
import 'package:flutter_localization_theme_hub/Core/Utils/App_colors.dart';

// Light Theme Configuration
final ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.background,
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    primary: Color.fromARGB(255, 8, 90, 55),
    onPrimary: Color.fromARGB(255, 245, 245, 245),
    surface: AppColors.surface,
    onSurface: AppColors.onSurface,
    secondary: AppColors.secondary,
    onSecondary: AppColors.onSecondary,
    error: AppColors.error,
    onError: AppColors.onError,
    primaryContainer: Color.fromARGB(255, 226, 11, 11),
    secondaryContainer: AppColors.secondaryVariant,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(255, 233, 105, 8),
    foregroundColor: Color.fromARGB(255, 255, 255, 255),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color.fromARGB(255, 247, 101, 10),
    foregroundColor: AppColors.onPrimary,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color.fromARGB(255, 233, 105, 8),
      foregroundColor: AppColors.onPrimary,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),
);
