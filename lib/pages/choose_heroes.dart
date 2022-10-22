import 'package:danek/generated/locale_keys.g.dart';
import 'package:danek/helpers/audio.dart';
import 'package:danek/helpers/colors.dart';
import 'package:danek/helpers/user_preferences.dart';
import 'package:danek/models/animation_button.dart';
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
  bool? foneticMusic;
  Future addHero(imagepath, launch) async {
    await UserPreferences().setHero(imagepath);
    await UserPreferences().setHeroLaunch(launch);
  }

  @override
  void initState() {
    super.initState();
    hero = UserPreferences().getHero() ?? '';
    heroLaunch = UserPreferences().getHeroLaunch() ?? false;
    foneticMusic = UserPreferences().getFoneticMusic() ?? true;
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
            length: heroesImagesList.length,
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
                                  checkMusicHeroPage(
                                      'i_danaya.mp3', foneticMusic);
                                } else if (context.locale ==
                                    const Locale('ky')) {
                                  checkMusicHeroPage(
                                      'i_danaya.mp3', foneticMusic);
                                  // checkMusic('i_danaya_ky.mp3', foneticMusic);
                                } else if (context.locale ==
                                    const Locale('kk')) {
                                  checkMusicHeroPage(
                                      'i_danaya.mp3', foneticMusic);
                                  // checkMusic('i_danaya_kk.mp3', foneticMusic);
                                } else if (context.locale ==
                                    const Locale('uz')) {
                                  checkMusicHeroPage(
                                      'i_danaya.mp3', foneticMusic);
                                  // checkMusic('i_danaya_uz.mp3', foneticMusic);
                                } else {
                                  checkMusicHeroPage(
                                      'i_danaya.mp3', foneticMusic);
                                  // checkMusic('i_danaya_en.mp3', foneticMusic);
                                }
                              },
                              child: Image.asset('assets/images/girl1.png'),
                            ),
                          ),
                          Tab(
                            child: InkWell(
                              onTap: () {
                                if (context.locale == const Locale('ru')) {
                                  checkMusicHeroPage(
                                      'i_deniz.mp3', foneticMusic);
                                } else if (context.locale ==
                                    const Locale('ky')) {
                                  checkMusicHeroPage(
                                      'i_deniz.mp3', foneticMusic);
                                  // checkMusic('i_deniz_ky.mp3', foneticMusic);
                                } else if (context.locale ==
                                    const Locale('kk')) {
                                  checkMusicHeroPage(
                                      'i_deniz.mp3', foneticMusic);
                                  // checkMusic('i_deniz_kk.mp3', foneticMusic);
                                } else if (context.locale ==
                                    const Locale('uz')) {
                                  checkMusicHeroPage(
                                      'i_deniz.mp3', foneticMusic);
                                  // checkMusic('i_deniz_uz.mp3', foneticMusic);
                                } else {
                                  checkMusicHeroPage(
                                      'i_deniz.mp3', foneticMusic);
                                  // checkMusic('i_deniz_en.mp3', foneticMusic);
                                }
                              },
                              child: Image.asset('assets/images/boy1.png'),
                            ),
                          ),
                          Tab(
                            child: InkWell(
                              onTap: () {
                                if (context.locale == const Locale('ru')) {
                                  checkMusicHeroPage(
                                      'i_chik.mp3', foneticMusic);
                                } else if (context.locale ==
                                    const Locale('ky')) {
                                  checkMusicHeroPage(
                                      'i_chik.mp3', foneticMusic);
                                  // checkMusic('i_chik_ky.mp3', foneticMusic);
                                } else if (context.locale ==
                                    const Locale('kk')) {
                                  checkMusicHeroPage(
                                      'i_chik.mp3', foneticMusic);
                                  // checkMusic('i_chik_kk.mp3', foneticMusic);
                                } else if (context.locale ==
                                    const Locale('uz')) {
                                  checkMusicHeroPage(
                                      'i_chik.mp3', foneticMusic);
                                  // checkMusic('i_chik_uz.mp3', foneticMusic);
                                } else {
                                  checkMusicHeroPage(
                                      'i_chik.mp3', foneticMusic);
                                  // checkMusic('i_chik_en.mp3', foneticMusic);
                                }
                              },
                              child: Image.asset('assets/images/bird.png'),
                            ),
                          ),
                          Tab(
                            child: InkWell(
                              onTap: () {
                                if (context.locale == const Locale('ru')) {
                                  checkMusicHeroPage('i_bec.mp3', foneticMusic);
                                } else if (context.locale ==
                                    const Locale('ky')) {
                                  checkMusicHeroPage('i_bec.mp3', foneticMusic);
                                  // checkMusic('i_bec_ky.mp3', foneticMusic);
                                } else if (context.locale ==
                                    const Locale('kk')) {
                                  checkMusicHeroPage('i_bec.mp3', foneticMusic);
                                  // checkMusic('i_bec_kk.mp3', foneticMusic);
                                } else if (context.locale ==
                                    const Locale('uz')) {
                                  checkMusicHeroPage('i_bec.mp3', foneticMusic);
                                  // checkMusic('i_bec_uz.mp3', foneticMusic);
                                } else {
                                  checkMusicHeroPage('i_bec.mp3', foneticMusic);
                                  // checkMusic('i_bec_en.mp3', foneticMusic);
                                }
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

                          Navigator.pushNamed(context, '/heropage');
                          if (context.locale == const Locale('ru')) {
                            checkMusic('hello.mp3', foneticMusic);
                          } else if (context.locale == const Locale('ky')) {
                            checkMusic('salam.mp3', foneticMusic);
                          } else if (context.locale == const Locale('kk')) {
                            checkMusic('hello.mp3', foneticMusic);
                            // checkMusic('hello_kk.mp3', foneticMusic);
                          } else if (context.locale == const Locale('uz')) {
                            checkMusic('hello.mp3', foneticMusic);
                            // checkMusic('hello_uz.mp3', foneticMusic);
                          } else {
                            checkMusic('hello.mp3', foneticMusic);
                            // checkMusic('hello_en.mp3', foneticMusic);
                          }
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
                        (heroLaunch == true)
                            ? Navigator.pushNamed(context, '/heropage')
                            : Navigator.pushNamed(context, '/formpage');
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

// class SwipeDetector extends StatelessWidget {
//   static const double minMainDisplacement = 50;
//   static const double maxCrossRatio = 0.75;
//   static const double minVelocity = 300;

//   final Widget child;

//   final VoidCallback? onSwipeUp;
//   final VoidCallback? onSwipeDown;
//   final VoidCallback? onSwipeLeft;
//   final VoidCallback? onSwipeRight;

//   SwipeDetector({
//     required this.child,
//     this.onSwipeUp,
//     this.onSwipeDown,
//     this.onSwipeLeft,
//     this.onSwipeRight,
//   });

//   @override
//   Widget build(BuildContext context) {
//     DragStartDetails? panStartDetails;
//     DragUpdateDetails? panUpdateDetails;

//     return GestureDetector(
//       onTapDown: (_) => panUpdateDetails =
//           null, // This prevents two fingers quick taps from being detected as a swipe
//       behavior: HitTestBehavior
//           .opaque, // This allows swipe above other clickable widgets
//       child: child,
//       onPanStart: (startDetails) => panStartDetails = startDetails,
//       onPanUpdate: (updateDetails) => panUpdateDetails = updateDetails,
//       onPanEnd: (endDetails) {
//         if (panStartDetails == null || panUpdateDetails == null) return;

//         double dx = panUpdateDetails!.globalPosition.dx -
//             panStartDetails!.globalPosition.dx;
//         double dy = panUpdateDetails!.globalPosition.dy -
//             panStartDetails!.globalPosition.dy;

//         int panDurationMiliseconds =
//             panUpdateDetails!.sourceTimeStamp!.inMilliseconds -
//                 panStartDetails!.sourceTimeStamp!.inMilliseconds;

//         double mainDis, crossDis, mainVel;
//         bool isHorizontalMainAxis = dx.abs() > dy.abs();

//         if (isHorizontalMainAxis) {
//           mainDis = dx.abs();
//           crossDis = dy.abs();
//         } else {
//           mainDis = dy.abs();
//           crossDis = dx.abs();
//         }

//         mainVel = 1000 * mainDis / panDurationMiliseconds;

//         // if (mainDis < minMainDisplacement) return;
//         // if (crossDis > maxCrossRatio * mainDis) return;
//         // if (mainVel < minVelocity) return;

//         if (mainDis < minMainDisplacement) {
//           debugPrint(
//               "SWIPE DEBUG | Displacement too short. Real: $mainDis - Min: $minMainDisplacement");
//           return;
//         }
//         if (crossDis > maxCrossRatio * mainDis) {
//           debugPrint(
//               "SWIPE DEBUG | Cross axis displacemnt bigger than limit. Real: $crossDis - Limit: ${mainDis * maxCrossRatio}");
//           return;
//         }
//         if (mainVel < minVelocity) {
//           debugPrint(
//               "SWIPE DEBUG | Swipe velocity too slow. Real: $mainVel - Min: $minVelocity");
//           return;
//         }

//         // dy < 0 => UP -- dx > 0 => RIGHT
//         if (isHorizontalMainAxis) {
//           if (dx > 0)
//             onSwipeRight?.call();
//           else
//             onSwipeLeft?.call();
//         } else {
//           if (dy < 0)
//             onSwipeUp?.call();
//           else
//             onSwipeDown?.call();
//         }
//       },
//     );
//   }
// }
