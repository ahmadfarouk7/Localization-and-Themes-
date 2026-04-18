import 'package:flutter/material.dart';
import 'package:flutter_localization_theme_hub/Core/Theme/Dark_theme.dart';
import 'package:flutter_localization_theme_hub/Core/Theme/Light_theme.dart';
import 'package:flutter_localization_theme_hub/Core/Utils/App_colors.dart';

abstract class AppThemes {
  static ThemeData GetLightTheme() => lightTheme;
  static ThemeData GetDarkTheme() => darkTheme;
}
