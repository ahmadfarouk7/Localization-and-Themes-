import 'package:flutter/material.dart';
import 'package:flutter_localization_theme_hub/Core/Utils/App_colors.dart';

final ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.darkBackground,
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    primary: AppColors.darkPrimary,
    onPrimary: AppColors.darkOnPrimary,
    surface: AppColors.darkSurface,
    onSurface: AppColors.darkOnSurface,
    secondary: AppColors.darkSecondary,
    onSecondary: AppColors.darkOnSecondary,
    error: AppColors.darkError,
    onError: AppColors.darkOnError,
    primaryContainer: AppColors.darkPrimaryVariant,
    secondaryContainer: AppColors.darkSecondaryVariant,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.darkPrimary,
    foregroundColor: AppColors.darkOnPrimary,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.darkPrimary,
    foregroundColor: AppColors.darkOnPrimary,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.darkPrimary,
      foregroundColor: AppColors.darkOnPrimary,
    ),
  ),
);
