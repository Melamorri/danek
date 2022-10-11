// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> en = {
    "shop": "Shop",
    "play": "Play",
    "settings": "Settings",
    "exit": "Exit",
    "menu": "Menu"
  };
  static const Map<String, dynamic> kk = {
    "shop": "Гол",
    "play": "Ойнау",
    "settings": "Параметрлері",
    "exit": "Шығу"
  };
  static const Map<String, dynamic> ky = {
    "shop": "Shop",
    "play": "Play",
    "settings": "Settings",
    "exit": "Exit"
  };
  static const Map<String, dynamic> ru = {
    "shop": "Магазин",
    "play": "Играть",
    "settings": "Настройки",
    "exit": "Выход",
    "menu": "Меню"
  };
  static const Map<String, dynamic> tg = {
    "shop": "Shop",
    "play": "Play",
    "settings": "Settings",
    "exit": "Exit"
  };
  static const Map<String, dynamic> uz = {
    "shop": "Shop",
    "play": "Play",
    "settings": "Settings",
    "exit": "Exit"
  };
  static const Map<String, Map<String, dynamic>> mapLocales = {
    "en": en,
    "kk": kk,
    "ky": ky,
    "ru": ru,
    "tg": tg,
    "uz": uz
  };
}
