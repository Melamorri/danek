import 'package:danek/generated/locale_keys.g.dart';
import 'package:danek/helpers/colors.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

// Эта страница создает кнопку выбора языка и вызыввется в страниц

class Language {
  Locale locale;
  String langName;

  Language({
    required this.locale,
    required this.langName,
  });
}

class Drop extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DropState();
}

class _DropState extends State<Drop> {
  // List<String> language = [
  //   '🇷🇺 Русский',
  //   '🇬🇧 English',
  //   '🇰🇬 Кыргыз',
  //   '🇰🇿 қазақ',
  //   '🇺🇿 ozbek',
  //   '🇹🇯 тоҷикӣ'
  // ];

  List<Language> languageList = [
    Language(
      langName: '🇷🇺 Русский',
      locale: const Locale('ru'),
    ),
    Language(
      langName: '🇰🇬 Кыргыз',
      locale: const Locale('ky'),
    ),
    Language(
      langName: '🇰🇿 қазақ',
      locale: const Locale('kk'),
    ),
    Language(
      langName: '🇺🇿 ozbek',
      locale: const Locale('uz'),
    ),
    Language(
      langName: '🇹🇯 тоҷикӣ',
      locale: const Locale('tg'),
    ),
    Language(
      langName: '🇬🇧 English',
      locale: const Locale('en'),
    ),
  ];

  Language? selectedLang;

  @override
  Widget build(BuildContext context) {
    selectedLang = languageList.singleWhere((e) => e.locale == context.locale);
    return Center(
      child: Container(
        // height: MediaQuery.of(context).size.height * 0.08,
        // width: MediaQuery.of(context).size.width * 0.5,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: CustomColors.orangeColor.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
            color: CustomColors.yellowColor,
            borderRadius: BorderRadius.circular(40),
            border: Border.all(color: CustomColors.yellowColor, width: 4)),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<Language>(
            borderRadius: BorderRadius.circular(30),
            dropdownColor: CustomColors.orangeColor,
            hint: Text(
              LocaleKeys.language.tr(),
              style: TextStyle(color: CustomColors.black54Color),
            ),
            iconEnabledColor: CustomColors.orangeColor,
            iconSize: 60,
            isDense: true,
            style: TextStyle(
                fontFamily: 'RobotoCondensed-Regular',
                fontSize: 20,
                color: CustomColors.darkBlueColor,
                fontWeight: FontWeight.bold),
            value: selectedLang,
            onChanged: (newValue) {
              setState(() {
                selectedLang = newValue!;
              });
              if (newValue!.langName == '🇷🇺 Русский') {
                context.setLocale(const Locale('ru'));
              } else if (newValue.langName == '🇰🇬 Кыргыз') {
                context.setLocale(const Locale('ky'));
              } else if (newValue.langName == '🇰🇿 қазақ') {
                context.setLocale(const Locale('kk'));
              } else if (newValue.langName == '🇬🇧 English') {
                context.setLocale(const Locale('en'));
              } else if (newValue.langName == '🇺🇿 ozbek') {
                context.setLocale(const Locale('uz'));
              } else {
                context.setLocale(const Locale('tg'));
              }
            },
            items:
                languageList.map<DropdownMenuItem<Language>>((Language value) {
              return DropdownMenuItem<Language>(
                value: value,
                child: Text(
                  value.langName,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
