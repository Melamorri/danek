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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bars.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _addSpace(550),
              _addHorizontalList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _addHorizontalList() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(20),
          itemCount: ativityList.length,
          itemBuilder: (BuildContext context, int index) {
            ActivityList activity = ativityList[index];
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              width: MediaQuery.of(context).size.width * 0.3,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                    FlameAudio.play(activity.wav);
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ActivityDetailsScreen(ativityList: activity)));
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
