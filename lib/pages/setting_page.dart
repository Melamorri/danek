import 'package:danek/main.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:danek/helpers/colors.dart';
import 'package:danek/models/animation_button.dart';

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
