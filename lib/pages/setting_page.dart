import 'package:danek/helpers/drop_down.dart';
import 'package:danek/main.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:danek/helpers/colors.dart';
import 'package:danek/models/animation_button.dart';
import 'package:audioplayers/audio_cache.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/menubackground.png"),
                fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: SizedBox(
              height: 550,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Drop(),
                  AnimatedButton(
                      color: CustomColors.yellowColor,
                      borderColor: CustomColors.yellowColor,
                      shadowColor: CustomColors.orangeColor,
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      },
                      child: const Text('МЕНЮ',
                          style: TextStyle(
                              fontFamily: 'RobotoCondensed',
                              fontSize: 26,
                              fontWeight: FontWeight.bold))),
                  AnimatedButton(
                      color: CustomColors.yellowColor,
                      borderColor: CustomColors.yellowColor,
                      shadowColor: CustomColors.orangeColor,
                      onPressed: () {
                        AudioCache player = new AudioCache();
                        player.loop('fonemusic.wav');
                      },
                      child: const Text('Звук',
                          style: TextStyle(
                              fontFamily: 'RobotoCondensed',
                              fontSize: 26,
                              fontWeight: FontWeight.bold))),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
