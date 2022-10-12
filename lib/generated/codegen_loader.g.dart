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
    "menu": "Menu",
    "language": "Язык",
    "swipe": "Swipe left/right to",
    "select_character": "Select your character",
    "enter_name": "Enter your name",
    "name": "Name",
    "age": "Age",
    "enter_age": "Enter your age"
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
    "menu": "Меню",
    "language": "Язык",
    "swipe": "Проведите пальцем влево/вправо",
    "select_character": "Выберите персонажа",
    "enter_name": "Введите ваше имя",
    "name": "Имя",
    "age": "Возраст",
    "enter_age": "Введите ваш возраст"
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
