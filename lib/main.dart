import 'package:danek/pages/choose_heroes.dart';
import 'package:danek/pages/form_page.dart';
import 'package:danek/pages/game_page.dart';
import 'package:danek/pages/menu_page.dart';
import 'package:danek/pages/setting_page.dart';
import 'package:danek/pages/shop_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
        // title: '',
        routes: {
          '/': (context) => MenuPage(),
          '/formpage': (context) => FormPage(),
          '/chooseheroes': (context) => ChooseHeroes(),
          '/gamepage': (context) => GamePage(),
          '/shoppage': (context) => ShopPage(),
          '/settingpage': (context) => SettingPage(),
        });
  }
}
