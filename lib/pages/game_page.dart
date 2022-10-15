import 'package:danek/helpers/user_preferences.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:danek/models/activity_button.dart';
import 'page_for_activity.dart';
import 'package:danek/models/activity_list.dart';
// import 'package:flame_audio/flame_audio.dart';
// import 'package:flutter/material.dart';
// import 'package:danek/models/activity_button.dart';
// import 'page_for_activity.dart';
// import 'package:danek/models/activity_list.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  String heroImage = '';

  @override
  void initState() {
    super.initState();
    heroImage = UserPreferences().getHero() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = -1;
    return Scaffold(
        body: Container(
            padding: EdgeInsets.only(top: 60),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/menubackground.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Row(
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
                        backgroundImage:
                            AssetImage("assets/images/backbutton.png"),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/mypurchases');
                      },
                      child: const CircleAvatar(
                        radius: 30.0,
                        backgroundImage:
                            AssetImage("assets/images/shopbutton.png"),
                      ),
                    ),
                    // SizedBox(
                    //   height: 20,
                    //   width: MediaQuery.of(context).size.width * 0.4,
                    // ),
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
                          "$value",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.60,
                  child: Image.asset(heroImage),
                ),
//героя выбираем из списка и картинка меняется
                //далее  привязать к индексу в shared preferences

                Expanded(
                  child: SizedBox(
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
                                            ActivityDetailsScreen(
                                                ativityList: activity)));
                              },
                              child: ListTile(
                                contentPadding: const EdgeInsets.all(1),
                                leading: Container(
                                  width: 70,
                                  child: CircleAvatar(
                                    radius: 70.0,
                                    backgroundImage: AssetImage(activity.image),
                                  ),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: _selectedIndex == index
                                          ? Colors.blue
                                          : Colors.black12,
                                      width: 3.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                SizedBox(height: 60),
              ],
            )));
  }
}
// class _GamePageState extends State<GamePage> {
//   @override
//   Widget build(BuildContext context) {
//     int _selectedIndex = -1;
//     return Scaffold(
//       body: ListView.builder(
//           shrinkWrap: true,
//           scrollDirection: Axis.horizontal,
//           padding: const EdgeInsets.all(20),
//           itemCount: ativityList.length,
//           itemBuilder: (BuildContext context, int index) {
//             return Container(
//                 padding: EdgeInsets.only(top: 60),
//                 height: MediaQuery.of(context).size.height,
//                 width: MediaQuery.of(context).size.width,
//                 decoration: const BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage("assets/images/menubackground.png"),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisSize: MainAxisSize.max,
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.pushNamed(context, '/');
//                           },
//                           child: const CircleAvatar(
//                             radius: 30.0,
//                             backgroundImage:
//                                 AssetImage("assets/images/backbutton.png"),
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.pushNamed(context, '/mypurchases');
//                           },
//                           child: const CircleAvatar(
//                             radius: 30.0,
//                             backgroundImage:
//                                 AssetImage("assets/images/shopbutton.png"),
//                           ),
//                         ),
//                         // SizedBox(
//                         //   height: 20,
//                         //   width: MediaQuery.of(context).size.width * 0.4,
//                         // ),
//                         InkWell(
//                           enableFeedback: false,
//                           onTap: () {
//                             FlameAudio.play('zvukmonet.wav', volume: 5);
//                           },
//                           child: CircleAvatar(
//                             radius: 30.0,
//                             backgroundImage:
//                                 const AssetImage("assets/images/coin.png"),
//                             child: Text(
//                               "$value",
//                               style:
//                                   const TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height * 0.60,
//                       child: Image.asset("assets/images/girl1.png"),
//                     ),
// //героя выбираем из списка и картинка меняется
//                     //далее  привязать к индексу в shared preferences

//                     Expanded(
//                       child: SizedBox(
//                         height: MediaQuery.of(context).size.height * 0.15,
//                         child: ListView.builder(
//                             shrinkWrap: true,
//                             scrollDirection: Axis.horizontal,
//                             padding: const EdgeInsets.all(20),
//                             itemCount: ativityList.length,
//                             itemBuilder: (BuildContext context, int index) {
//                               ActivityList activity = ativityList[index];
//                               return Container(
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 15),
//                                 width: MediaQuery.of(context).size.width * 0.3,
//                                 child: GestureDetector(
//                                   onTap: () {
//                                     setState(() {
//                                       _selectedIndex = index;
//                                       FlameAudio.play(activity.wav);
//                                     });
//                                     Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: (context) =>
//                                                 ActivityDetailsScreen(
//                                                     ativityList: activity)));
//                                   },
//                                   child: ListTile(
//                                     contentPadding: const EdgeInsets.all(1),
//                                     leading: Container(
//                                       width: 70,
//                                       child: CircleAvatar(
//                                         radius: 70.0,
//                                         backgroundImage:
//                                             AssetImage(activity.image),
//                                       ),
//                                       decoration: BoxDecoration(
//                                         shape: BoxShape.circle,
//                                         border: Border.all(
//                                           color: _selectedIndex == index
//                                               ? Colors.blue
//                                               : Colors.black12,
//                                           width: 3.0,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             }),
//                       ),
//                     ),
//                     SizedBox(height: 60),
//                   ],
//                 ));
//           }),
//     );
//   }
// }
