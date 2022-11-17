import 'package:danek/generated/locale_keys.g.dart';
import 'package:danek/helpers/audio.dart';
import 'package:danek/helpers/colors.dart';
import 'package:danek/helpers/user_preferences.dart';
import 'package:danek/models/animation_button.dart';
import 'package:danek/models/style.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class ChooseHeroes extends StatefulWidget {
  const ChooseHeroes({super.key});

  @override
  _ChooseHeroesState createState() => _ChooseHeroesState();
}

class _ChooseHeroesState extends State<ChooseHeroes>
    with TickerProviderStateMixin {
  List<String> heroesImagesList = [
    'assets/images/girl1.png',
    'assets/images/boy1.png',
    'assets/images/bird.png',
    //'assets/images/leo.png'
    'assets/images/bars/bars_hello_2.gif'
  ];
  int currentIndex = 0;
  String? hero;
  bool? heroLaunch;
  bool? foneticMusic;
  Future addHero(imagepath, launch) async {
    await UserPreferences().setHero(imagepath);
    await UserPreferences().setHeroLaunch(launch);
  }

  late PageController controller;
  @override
  void initState() {
    super.initState();
    hero = UserPreferences().getHero() ?? '';
    heroLaunch = UserPreferences().getHeroLaunch() ?? false;
    foneticMusic = UserPreferences().getFoneticMusic() ?? true;
    controller = PageController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _goForward() {
    controller.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void _goBack() {
    controller.previousPage(
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  onChangedFunction(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(top: 20),
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
          body: PageView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  const SizedBox(height: 10),
                  Stack(children: <Widget>[
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
                      style: const TextStyle(
                        fontSize: 40,
                        color: CustomColors.darkBlueColor,
                        fontFamily: 'LeOslerRoughRegular',
                      ),
                    ),
                  ]),
                  Expanded(
                    child: PageView(
                        controller: controller,
                        onPageChanged: onChangedFunction,
                        children: [
                          GestureDetector(
                            onHorizontalDragEnd: (dragEndDetails) {
                              if (dragEndDetails.primaryVelocity! < 0) {
                                // Page forwards
                                FlameAudio.play(
                                    LocaleKeys.wav_i_deniz.tr().toString());
                                _goForward();
                              } else if (dragEndDetails.primaryVelocity! > 0) {
                                // Page backwards
                                FlameAudio.play(
                                    LocaleKeys.wav_i_danaya.tr().toString());
                                _goBack();
                              }
                            },
                            child: Image.asset('assets/images/girl1.png'),
                          ),
                          GestureDetector(
                            onHorizontalDragEnd: (dragEndDetails) {
                              if (dragEndDetails.primaryVelocity! < 0) {
                                // Page forwards
                                FlameAudio.play(
                                    LocaleKeys.wav_i_chik.tr().toString());
                                _goForward();
                              } else if (dragEndDetails.primaryVelocity! > 0) {
                                // Page backwards
                                FlameAudio.play(
                                    LocaleKeys.wav_i_danaya.tr().toString());
                                _goBack();
                              }
                            },
                            child: Image.asset('assets/images/boy1.png'),
                          ),
                          GestureDetector(
                            onHorizontalDragEnd: (dragEndDetails) {
                              if (dragEndDetails.primaryVelocity! < 0) {
                                // Page forwards
                                FlameAudio.play(
                                    LocaleKeys.wav_i_bec.tr().toString());
                                _goForward();
                              } else if (dragEndDetails.primaryVelocity! > 0) {
                                // Page backwards
                                FlameAudio.play(
                                    LocaleKeys.wav_i_deniz.tr().toString());
                                _goBack();
                              }
                            },
                            child: Image.asset('assets/images/bird.png'),
                          ),
                          GestureDetector(
                              onHorizontalDragEnd: (dragEndDetails) {
                                if (dragEndDetails.primaryVelocity! < 0) {
                                  // Page forwards
                                  FlameAudio.play(
                                      LocaleKeys.wav_i_bec.tr().toString());
                                  _goForward();
                                } else if (dragEndDetails.primaryVelocity! >
                                    0) {
                                  // Page backwards
                                  FlameAudio.play(
                                      LocaleKeys.wav_i_chik.tr().toString());
                                  _goBack();
                                }
                              },
                              child: Image.asset(
                                'assets/images/bars/bars_hello_2.gif',
                                fit: BoxFit.scaleDown,
                                scale: 7.0,
                              )
                              //child: Image.asset('assets/images/leo.png'),
                              ),
                        ]),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Indicator(
                        positionIndex: 0,
                        currentIndex: currentIndex,
                      ),
                      const SizedBox(width: 5),
                      Indicator(
                        positionIndex: 1,
                        currentIndex: currentIndex,
                      ),
                      const SizedBox(width: 5),
                      Indicator(
                        positionIndex: 2,
                        currentIndex: currentIndex,
                      ),
                      const SizedBox(width: 5),
                      Indicator(
                        positionIndex: 3,
                        currentIndex: currentIndex,
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  AnimatedButton(
                    color: CustomColors.lightBlueColor,
                    borderColor: CustomColors.darkBlueColor,
                    shadowColor: CustomColors.darkBlueColor,
                    onPressed: () {
                      setState(() {
                        heroLaunch = true;
                      });
                      addHero(heroesImagesList[currentIndex], heroLaunch);
                      {
                        Navigator.pushNamed(context, '/heropage');
                        FlameAudio.play(LocaleKeys.wav_hello.tr().toString());
                      }
                    },
                    child: Text(
                      LocaleKeys.select.tr(),
                      style: textStyleButton(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  AnimatedButton(
                    color: CustomColors.redColor,
                    borderColor: CustomColors.darkBlueColor,
                    shadowColor: CustomColors.darkBlueColor,
                    onPressed: () {
                      (heroLaunch == true)
                          ? Navigator.pushNamed(context, '/heropage')
                          : Navigator.pushNamed(context, '/formpage');
                    },
                    child: Text(
                      LocaleKeys.back.tr(),
                      style: textStyleButton(),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final int positionIndex, currentIndex;
  const Indicator(
      {super.key, required this.currentIndex, required this.positionIndex});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12,
      width: 12,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          color: positionIndex == currentIndex
              ? Colors.red
              : CustomColors.lightBlueColor,
          borderRadius: BorderRadius.circular(100)),
    );
  }
}

// class Genres {
//   String name;
//   String image;

//   Genres({
//     required this.name,
//     required this.image,
//   });
// }

// List<Genres> heroesImagesList1 = [
//   Genres(name: 'Danaya', image: 'assets/images/girl1.png'),
//   Genres(name: 'Deniz', image: 'assets/images/boy1.png'),
//   Genres(name: 'Bird', image: 'assets/images/bird.png'),
//   Genres(name: 'Leo', image: 'assets/images/leo.png'),
// ];
