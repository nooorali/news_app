import 'package:flutter/material.dart';
import 'package:news_app/core/theme/application_theme.dart';
import 'package:news_app/details/news_details_screen.dart';
import 'package:news_app/pages/home/home_view.dart';
import 'package:news_app/pages/settings/settings_view.dart';
import 'package:news_app/pages/splash/splash_view.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'core/provider/app_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: const MyApplication()));
}

class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    var appProvider= Provider.of<AppProvider>(context);
    return MaterialApp(
      locale: Locale(appProvider.currentLocal),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ApplicationTheme.lightTheme,
      themeMode:appProvider.currentTheme,    //<--------
      debugShowCheckedModeBanner: false,
      initialRoute:SplashView.routeName ,
      routes:{
        SplashView.routeName:(context) => SplashView(),
        HomeView.routeName:(context) => HomeView(),
        SettingsView.routeName:(context) => SettingsView(),
        NewsDetailsScreen.routeName:(context) => NewsDetailsScreen(),
      },
    );
  }
}
