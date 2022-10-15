import 'package:danek/models/models.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:danek/models/activity_list.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';
import 'package:danek/pages/hero_page_bars.dart';

class ActivityDetailsScreen extends StatelessWidget {
  final ActivityList activityList;

  ActivityDetailsScreen({
    super.key,
    required this.activityList,
  });

  @override
  Widget build(BuildContext context) {
    final CountDownController controller = CountDownController();
    List<int> timelist = [600, 120, 300, 900, 600];
    late int time;

    int _chekId() {
      if (activityList.id == 1) {
        return timelist.elementAt(0);
      }
      if (activityList.id == 2) {
        return timelist.elementAt(1);
      }
      if (activityList.id == 3) {
        return timelist.elementAt(2);
      }
      if (activityList.id == 4) {
        return timelist.elementAt(3);
      }
      if (activityList.id == 5) {
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
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (activityList != null) ...[
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
                          "$coins",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Text(
                      activityList.name.toString(),
                      style: activityText_1(),
                      //style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      activityList.name.toString(),
                      style: activityText_2(),
                    ),
                  ],
                ),
                Image.asset(
                  activityList.gif.toString(),
                  height: 325.0,
                  width: 325.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
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
                              // сюда по идее функцию обновления монет, но нужен statefulwidget
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
      ),
    );
  }
}
