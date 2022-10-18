import 'package:danek/helpers/audio.dart';
import 'package:danek/helpers/user_preferences.dart';
import 'package:danek/pages/choose_heroes.dart';
import 'package:danek/pages/form_page.dart';
import 'package:danek/pages/menu_page.dart';
import 'package:danek/pages/setting_page.dart';
import 'package:danek/pages/shop_page.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:danek/generated/codegen_loader.g.dart';
import 'package:danek/pages/hero_page_bars.dart';
import 'package:danek/pages/my_purchases.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await UserPreferences().init();
  // FlameAudio.playLongAudio('fonemusic.wav');
  // FlameAudio.bgm.play('fonemusic.wav');

  // только вертикальная ориентация
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
    EasyLocalization(
        supportedLocales: const [
          Locale('ru'),
          Locale('en'),
          Locale('kk'),
          Locale('ky'),
          Locale('uz')
        ],
        // useFallbackTranslations: true,
        // startLocale: const Locale('ru'),
        path: 'assets/translations',
        fallbackLocale: const Locale('ru'),
        assetLoader: CodegenLoader(),
        child: const MyApp()),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // AudioPlayer bgMusic;
  // checkMusic(foneticMusic) {
  //   if (foneticMusic) {
  //     bgMusic.homeBGM.setVolume(.50);
  //   } else {
  //     bgMusic.homeBGM.setVolume(0);
  //   }
  // }

  @override
  void initState() {
    super.initState();

    // bgMusic = AudioPlayer();
    // bgMusic = (FlameAudio.loopLongAudio('fonemusic.wav', volume: .50)) as Audio;
    // checkMusic(foneticMusic);
  }

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
