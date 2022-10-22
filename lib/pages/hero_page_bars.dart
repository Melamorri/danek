import 'package:danek/helpers/user_preferences.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'page_for_activity.dart';
import 'package:danek/models/activity_list.dart';

class HeroList extends StatefulWidget {
  const HeroList({Key? key}) : super(key: key);

  @override
  HeroListState createState() => HeroListState();
}

class HeroListState extends State<HeroList> {
  int _selectedIndex = -1;
  String heroImage = '';
  int myCoins = 0;

  @override
  void initState() {
    super.initState();
    heroImage = UserPreferences().getHero() ?? '';
    myCoins = UserPreferences().getCoins() ?? 0;
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
              _addHorizontalListForAppBar(myCoins),
              // _addSpace(10),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.75,
                child: Image.asset(heroImage),
              ),
              // _addSpace(10),
              _addHorizontalList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _addHorizontalListForAppBar(amountCoins) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/');
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
