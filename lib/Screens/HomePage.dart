import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization_theme_hub/Core/Utils/App_language.dart';
import 'package:flutter_localization_theme_hub/Core/Utils/App_themes.dart';
import 'package:flutter_localization_theme_hub/Core/logic/Toggle_Langauge_cubit/Toggle_Language_cubit.dart';
import 'package:flutter_localization_theme_hub/Core/logic/Toggle_theme_cubit/Toggle_theme_cubit.dart';
import 'package:flutter_localization_theme_hub/generated/l10n.dart';
import 'package:hotspot/hotspot.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      HotspotProvider.of(context).startFlow();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context).HomeScreen).withHotspot(
          order: 1,
          title: "Let's get started!",
          text: "We're going to give you an example tour with hotspot",
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 175),
            child: Text(
              S.of(context).welcome_message,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                final CurrentTheme = context.read<ToggleThemeCubit>().state;
                final newTheme = CurrentTheme == AppThemes.GetLightTheme()
                    ? AppThemes.GetDarkTheme()
                    : AppThemes.GetLightTheme();
                context.read<ToggleThemeCubit>().toggleTheme(newTheme);
              },
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  S.of(context).Button_Change_theme,
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final currentLocale = context.read<ToggleLanguageCubit>().state;
          final newLocale = currentLocale == AppLanguages.getArabicLocale()
              ? AppLanguages.getEnglishLocale()
              : AppLanguages.getArabicLocale();
          context.read<ToggleLanguageCubit>().toggleLanguage(newLocale);
        },
        child: const Icon(Icons.language).withHotspot(
          order: 2,
          title: "Let's get started!",
          text: "to change language",
        ),
      ),
    );
  }
}
