import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization_theme_hub/Core/Utils/App_language.dart';
import 'package:flutter_localization_theme_hub/Core/Utils/App_themes.dart';
import 'package:flutter_localization_theme_hub/Core/helper/app_shared_pref.dart';
import 'package:flutter_localization_theme_hub/Core/logic/Toggle_Langauge_cubit/Toggle_Language_cubit.dart';
import 'package:flutter_localization_theme_hub/Core/logic/Toggle_theme_cubit/Toggle_theme_cubit.dart';
import 'package:flutter_localization_theme_hub/Screens/HomePage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hotspot/hotspot.dart'; // تأكد من وجود الـ import
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppSharedPref.init();

  final isDarkMode =
      await AppSharedPref.getData('isDarkMode') as bool? ?? false;

  final initialTheme =
      isDarkMode ? AppThemes.GetDarkTheme() : AppThemes.GetLightTheme();

  final currentLanguageCode =
      await AppSharedPref.getData('CurrentLanguageCode') as String? ?? 'en';

  final initialLocale = currentLanguageCode == 'ar'
      ? AppLanguages.getArabicLocale()
      : AppLanguages.getEnglishLocale();

  runApp(MyApp(initialTheme: initialTheme, initialLocale: initialLocale));
}

class MyApp extends StatelessWidget {
  const MyApp(
      {super.key, required this.initialTheme, required this.initialLocale});

  final ThemeData initialTheme;
  final Locale initialLocale;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ToggleThemeCubit(initialTheme),
        ),
        BlocProvider(
          create: (context) => ToggleLanguageCubit(initialLocale),
        ),
      ],
      child: BlocBuilder<ToggleLanguageCubit, Locale>(
        builder: (context, localeState) {
          return BlocBuilder<ToggleThemeCubit, ThemeData>(
            builder: (context, themeState) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: themeState,
                locale: localeState,
                themeAnimationCurve: Curves.easeInOut,
                home: const HotspotProvider(
                  // actionBuilder: (context, controller) {
                  //   return Row(
                  //     mainAxisAlignment: MainAxisAlignment.end,
                  //     children: [
                  //       TextButton(
                  //         onPressed: () =>
                  //             controller.next(), // بيمشي للخطوة اللي بعدها
                  //         style: TextButton.styleFrom(
                  //           backgroundColor: Colors
                  //               .orange, // 👈 اللون البرتقالي اللي محتاجه للزرار
                  //           foregroundColor: Colors.white,
                  //           padding: const EdgeInsets.symmetric(
                  //               horizontal: 20, vertical: 10),
                  //           shape: RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.circular(8),
                  //           ),
                  //         ),
                  //         child:
                  //             const Text('Next'), // أو "التالي" لو عايز تترجمه
                  //       ),
                  //     ],
                  //   );
                  // },
                  foregroundColor: Colors.orange,
                  child: MyHomePage(),
                ),
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
              );
            },
          );
        },
      ),
    );
  }
}
