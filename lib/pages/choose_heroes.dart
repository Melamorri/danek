import 'package:danek/generated/locale_keys.g.dart';
import 'package:danek/helpers/colors.dart';
import 'package:danek/helpers/user_preferences.dart';
import 'package:danek/main.dart';
import 'package:danek/models/animation_button.dart';
import 'package:danek/models/heroes_model.dart';
import 'package:danek/models/models.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class ChooseHeroes extends StatefulWidget {
  const ChooseHeroes({super.key});

  // static var kImages = [
  //   Image.asset('assets/images/girl1.png'),
  //   Image.asset('assets/images/boy1.png'),
  //   Image.asset('assets/images/bird.png'),
  //   Image.asset('assets/images/leo.png'),
  // ];

  @override
  _ChooseHeroesState createState() => _ChooseHeroesState();
}

class _ChooseHeroesState extends State<ChooseHeroes>
    with TickerProviderStateMixin {
  List<String> heroesImagesList = [
    'assets/images/girl1.png',
    'assets/images/boy1.png',
    'assets/images/bird.png',
    'assets/images/leo.png'
  ];
  String? hero;
  bool? heroLaunch;
  Future addHero(imagepath, launch) async {
    await UserPreferences().setHero(imagepath);
    await UserPreferences().setHeroLaunch(launch);
  }

  @override
  void initState() {
    super.initState();
    hero = UserPreferences().getHero() ?? '';
    heroLaunch = UserPreferences().getHeroLaunch() ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(top: 20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/menubackground.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: DefaultTabController(
            length: kImages.length,
            child: Builder(
              builder: (BuildContext context) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Container(
                      child: Stack(children: <Widget>[
                        Text(
                          LocaleKeys.select_character.tr(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 40,
                            fontFamily: 'LeOslerRoughRegular',
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 5
                              ..color = CustomColors.whiteColor,
                          ),
                        ),
                        Text(
                          LocaleKeys.select_character.tr(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 40,
                            color: CustomColors.darkBlueColor,
                            fontFamily: 'LeOslerRoughRegular',
                          ),
                        )
                      ]),
                    ),
                    const TabPageSelector(),
                    Expanded(
                      child: TabBarView(
                        children: [
                          Tab(
                            child: InkWell(
                              onTap: () {
                                if (context.locale == const Locale('ru')) {
                                  FlameAudio.play('i_danaya.mp3');
                                } else if (context.locale ==
                                    const Locale('ky')) {
                                  FlameAudio.play('i_danaya.mp3');
                                  // FlameAudio.play('i_danaya_ky.mp3');
                                } else if (context.locale ==
                                    const Locale('kk')) {
                                  FlameAudio.play('i_danaya.mp3');
                                  // FlameAudio.play('i_danaya_kk.mp3');
                                } else if (context.locale ==
                                    const Locale('uz')) {
                                  FlameAudio.play('i_danaya.mp3');
                                  // FlameAudio.play('i_danaya_uz.mp3');
                                } else {
                                  FlameAudio.play('i_danaya.mp3');
                                  // FlameAudio.play('i_danaya_en.mp3');
                                }
                              },
                              child: Image.asset('assets/images/girl1.png'),
                            ),
                          ),
                          Tab(
                            child: InkWell(
                              onTap: () {
                                if (context.locale == const Locale('ru')) {
                                  FlameAudio.play('i_deniz.mp3');
                                } else if (context.locale ==
                                    const Locale('ky')) {
                                  FlameAudio.play('i_deniz.mp3');
                                  // FlameAudio.play('i_deniz_ky.mp3');
                                } else if (context.locale ==
                                    const Locale('kk')) {
                                  FlameAudio.play('i_deniz.mp3');
                                  // FlameAudio.play('i_deniz_kk.mp3');
                                } else if (context.locale ==
                                    const Locale('uz')) {
                                  FlameAudio.play('i_deniz.mp3');
                                  // FlameAudio.play('i_deniz_uz.mp3');
                                } else {
                                  FlameAudio.play('i_deniz.mp3');
                                  // FlameAudio.play('i_deniz_en.mp3');
                                }
                              },
                              child: Image.asset('assets/images/boy1.png'),
                            ),
                          ),
                          Tab(
                            child: InkWell(
                              onTap: () {
                                FlameAudio.play('i_chik.mp3');
                              },
                              child: Image.asset('assets/images/bird.png'),
                            ),
                          ),
                          Tab(
                            child: InkWell(
                              onTap: () {
                                FlameAudio.play('i_bec.mp3');
                              },
                              child: Image.asset('assets/images/leo.png'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    AnimatedButton(
                      color: CustomColors.lightBlueColor,
                      borderColor: CustomColors.darkBlueColor,
                      shadowColor: CustomColors.darkBlueColor,
                      onPressed: () {
                        final TabController controller =
                            DefaultTabController.of(context)!;
                        setState(() {
                          heroLaunch = true;
                        });
                        addHero(heroesImagesList[controller.index], heroLaunch);
                        if (!controller.indexIsChanging) {
                          //controller.animateTo(ChooseHeroes.kImages.length - 1);

                          // Navigator.pushNamed(context, '/gamepage');

                          Navigator.pushNamed(context, '/heropage');
                          FlameAudio.play('hello.mp3', volume: 10);
                        }
                      },
                      child: Text(
                        LocaleKeys.select.tr(),
                        style: textStyleButton(),
                      ),
                    ),
                    SizedBox(height: 20),
                    AnimatedButton(
                      color: CustomColors.redColor,
                      borderColor: CustomColors.darkBlueColor,
                      shadowColor: CustomColors.darkBlueColor,
                      onPressed: () {
                        final TabController controller =
                            DefaultTabController.of(context)!;
                        if (!controller.indexIsChanging) {
                          //controller.animateTo(ChooseHeroes.kImages.length - 1);
                          Navigator.pushNamed(context, '/formpage');
                        }
                      },
                      child: Text(
                        LocaleKeys.back.tr(),
                        style: textStyleButton(),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
