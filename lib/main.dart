import 'package:danek/helpers/user_preferences.dart';
import 'package:danek/pages/choose_heroes.dart';
import 'package:danek/pages/form_page.dart';
import 'package:danek/pages/menu_page.dart';
import 'package:danek/pages/setting_page.dart';
import 'package:danek/pages/shop_page.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:danek/pages/hero_page_bars.dart';
import 'package:danek/pages/my_purchases.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await UserPreferences().init();

  runApp(
    EasyLocalization(
        supportedLocales: const [
          Locale('en'),
          Locale('kk'),
          Locale('ky'),
          Locale('ru'),
          Locale('tg')
        ],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        // title: '',
        routes: {
          '/': (context) => MenuPage(),
          '/formpage': (context) => FormPage(),
          '/chooseheroes': (context) => ChooseHeroes(),
          '/shoppage': (context) => ShopPage(),
          '/mypurchases': (context) => MyPurchases(),
          '/settingpage': (context) => SettingPage(),
          '/heropage': (context) => HeroList(),
        });
  }
}
