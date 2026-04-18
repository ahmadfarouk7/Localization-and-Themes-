import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization_theme_hub/Core/Utils/App_language.dart';
import 'package:flutter_localization_theme_hub/Core/helper/app_shared_pref.dart';

class ToggleLanguageCubit extends Cubit<Locale> {
  final Locale initialLocale;
  ToggleLanguageCubit(this.initialLocale) : super(initialLocale);
  void toggleLanguage(Locale locale) {
    emit(locale);
    _cachedLanguage(locale.languageCode);
  }

  void _cachedLanguage(String LanguageCode) async {
    await AppSharedPref.setData(key: 'CurrentLanguageCode', data: LanguageCode);
  }
}
