import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization_theme_hub/Core/Utils/App_themes.dart';
import 'package:flutter_localization_theme_hub/Core/helper/app_shared_pref.dart';

int a = 10;

class ToggleThemeCubit extends Cubit<ThemeData> {
  final ThemeData initialTheme;

  ToggleThemeCubit(this.initialTheme) : super(initialTheme);

  void toggleTheme(ThemeData theme) {
    emit(theme);
    _cacheTheme(theme);
  }

  void _cacheTheme(ThemeData theme) async {
    await AppSharedPref.setData(
        key: 'isDarkMode', data: theme == AppThemes.GetDarkTheme());
  }
}
