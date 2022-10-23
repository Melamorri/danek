import 'dart:math';
import 'package:easy_localization/easy_localization.dart';
import 'package:danek/helpers/audio.dart';
import 'package:danek/helpers/user_preferences.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'page_for_activity.dart';
import 'package:danek/models/activity_list.dart';
import 'package:danek/helpers/days_in_row.dart';

class HeroList extends StatefulWidget {
  const HeroList({Key? key}) : super(key: key);

  @override
  HeroListState createState() => HeroListState();
}

class HeroListState extends State<HeroList> {
  int _selectedIndex = -1;
  String heroImage = '';
  int myCoins = 0;
  bool? foneticMusic;

  @override
  void initState() {
    super.initState();
    heroImage = UserPreferences().getHero() ?? '';
    myCoins = UserPreferences().getCoins() ?? 0;
    foneticMusic = UserPreferences().getFoneticMusic() ?? false;
    resumeMusic(foneticMusic);
  }

  @override
  Widget build(BuildContext context) {
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              _addSpace(30),
              settings(),
              _addHorizontalListForAppBar(myCoins),
              _addSpace(10),

              InkWell(
                onTap: (() {
                  FlameAudio.play(_wavCharging());
                }),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.65,
                  child: Image.asset(heroImage),
                ),
              ),
              // _addSpace(10),
              _addHorizontalList(),
            ],
          ),
        ),
      ),
    );
  }

  String _wavCharging() {
    var list = <String>[
      'salam.mp3',
      'masha_day.mp3',
      'well_done.mp3',
      'hello.mp3',
      'masha_kasha.mp3',
      'masha_play.mp3'
    ];

    return (list..shuffle()).first;
  }

  Widget _addHorizontalListForAppBar(amountCoins) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/menupage');
          },
          child: const CircleAvatar(
            radius: 30.0,
            backgroundImage: AssetImage("assets/images/backbutton.png"),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/mypurchases');
          },
          child: const CircleAvatar(
            radius: 30.0,
            backgroundImage: AssetImage("assets/images/shopbutton.png"),
          ),
        ),
        InkWell(
          enableFeedback: false,
          onTap: () {
            //checkMusic('zvukmonet.wav', foneticMusic);
            FlameAudio.play('zvukmonet.wav', volume: 5);
          },
          child: CircleAvatar(
            radius: 30.0,
            backgroundImage: const AssetImage("assets/images/coin.png"),
            child: Text(
              "$amountCoins",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  Widget settings() {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Align(
        alignment: Alignment.centerRight,
        child: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/settingpage');
            },
            icon: const Icon(Icons.settings)),
      ),
    );
  }

  Widget _addHorizontalList() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(1),
          itemCount: activityList.length,
          itemBuilder: (BuildContext context, int index) {
            ActivityList activity = activityList[index];
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 1),
              width: MediaQuery.of(context).size.width * 0.3,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    //checkMusic(activity.wav, foneticMusic);
                    FlameAudio.play(activity.wav);
                    _selectedIndex = index;
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ActivityDetailsScreen(activityList: activity)));
                },
                child: ListTile(
                  contentPadding: const EdgeInsets.all(1),
                  leading: Container(
                    width: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: _selectedIndex == index
                            ? Colors.blue
                            : Colors.black12,
                        width: 3.0,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 70.0,
                      backgroundImage: AssetImage(activity.image),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}

Widget _addSpace(double space) {
  return SizedBox(
    height: space,
  );
}
