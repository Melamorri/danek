import 'dart:html';

import 'package:danek/helpers/audio.dart';
import 'package:danek/helpers/user_preferences.dart';
import 'package:danek/models/models.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:danek/models/activity_list.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';
import 'package:easy_localization/easy_localization.dart';

class ActivityDetailsScreen extends StatefulWidget {
  final ActivityList activityList;

  ActivityDetailsScreen({
    super.key,
    required this.activityList,
  });

  @override
  State<ActivityDetailsScreen> createState() => _ActivityDetailsScreenState();
}

class _ActivityDetailsScreenState extends State<ActivityDetailsScreen> {
  int myCoins = 0;

  upCoin(int cash) {
    myCoins = myCoins + cash;
    if (context.locale == const Locale('ru')) {
      FlameAudio.play('well_done.mp3');
    } else if (context.locale == const Locale('ky')) {
      FlameAudio.play('well_done.mp3');
      // FlameAudio.play('well_done_ky.mp3');
    } else if (context.locale == const Locale('kk')) {
      FlameAudio.play('well_done.mp3');
      // FlameAudio.play('well_done_kk.mp3');
    } else if (context.locale == const Locale('uz')) {
      FlameAudio.play('well_done.mp3');
      // FlameAudio.play('well_done_uz.mp3');
    } else {
      FlameAudio.play('well_done.mp3');
      // FlameAudio.play('well_done_en.mp3');
    }
    Future.delayed(const Duration(milliseconds: 1700),
        () => FlameAudio.play('zvukmonet.wav'));
    Future.delayed(const Duration(seconds: 2), () => toggle());
    Future.delayed(const Duration(seconds: 4), () {
      if (visible = true) {
        setState(() {
          visible = false;
        });
      }
    });
    Future.delayed(const Duration(milliseconds: 4200),
        () => Navigator.pushNamed(context, '/heropage'));
  }

  Future addCoins(int myCoins) async {
    await UserPreferences().setCoins(myCoins);
  }

  @override
  void initState() {
    super.initState();
    myCoins = UserPreferences().getCoins() ?? 0;
  }

  bool visible = false;

  void toggle() {
    setState(() {
      visible = !visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final CountDownController controller = CountDownController();
    List<int> timelist = [600, 60, 420, 300, 300];
    //List<int> timelist = [3, 3, 3, 3, 3];

    late int time;

    int _chekId() {
      if (widget.activityList.id == 1) {
        return timelist.elementAt(0);
      }
      if (widget.activityList.id == 2) {
        return timelist.elementAt(1);
      }
      if (widget.activityList.id == 3) {
        return timelist.elementAt(2);
      }
      if (widget.activityList.id == 4) {
        return timelist.elementAt(3);
      }
      if (widget.activityList.id == 5) {
        return timelist.elementAt(4);
      }
      throw 'Нет нужного элемента';
    }

    time = _chekId();

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/menubackground.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (widget.activityList != null) ...[
                    const SizedBox(height: 10),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/heropage');
                          },
                          child: const CircleAvatar(
                            radius: 30.0,
                            backgroundImage:
                                AssetImage("assets/images/backbutton.png"),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                          width: MediaQuery.of(context).size.width * 0.4,
                        ),
                        InkWell(
                          enableFeedback: false,
                          onTap: () {
                            FlameAudio.play('zvukmonet.wav', volume: 5);
                          },
                          child: CircleAvatar(
                            radius: 30.0,
                            backgroundImage:
                                const AssetImage("assets/images/coin.png"),
                            child: Text(
                              "$myCoins",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        Text(
                          widget.activityList.name.toString(),
                          style: activityText_1(),
                          //style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          widget.activityList.name.toString(),
                          style: activityText_2(),
                        ),

                        //Image.asset('assets/images/coins.gif'),
                      ],
                    ),
                    Image.asset(widget.activityList.gif.toString(),
                        height: 325, width: 325),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 5, bottom: 20),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                                icon: const Icon(Icons.play_arrow),
                                onPressed: () {
                                  controller.resume();
                                }),
                            NeonCircularTimer(
                                onComplete: () {
                                  upCoin(widget.activityList.cash);
                                  setState(() {
                                    myCoins;
                                  });
                                  addCoins(myCoins);
                                },
                                width: 80,
                                controller: controller,
                                duration: time,
                                strokeWidth: 3,
                                textStyle: const TextStyle(fontSize: 20),
                                isTimerTextShown: true,
                                neumorphicEffect: true,
                                outerStrokeColor: Colors.grey.shade100,
                                innerFillGradient: LinearGradient(colors: [
                                  Colors.greenAccent.shade200,
                                  Colors.blueAccent.shade400
                                ]),
                                neonGradient: LinearGradient(colors: [
                                  Colors.greenAccent.shade200,
                                  Colors.blueAccent.shade400
                                ]),
                                strokeCap: StrokeCap.round,
                                innerFillColor: Colors.black12,
                                backgroudColor: Colors.grey.shade100,
                                neonColor: Colors.blue.shade900),
                            IconButton(
                                icon: const Icon(Icons.pause),
                                onPressed: () {
                                  controller.pause();
                                }),
                          ]),
                    )
                  ],
                ],
              ),
            ),
            coinsAnimation(),
          ],
        ),
      ),
    );
  }

  Widget coinsAnimation() {
    return Visibility(
      visible: visible,
      child: AnimatedSwitcher(
          duration: const Duration(),
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'assets/images/coins2.gif',
                width: 200,
              ),
            ),
          )),
    );
  }
}
