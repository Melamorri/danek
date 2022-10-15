import 'package:danek/generated/locale_keys.g.dart';
import 'package:danek/helpers/drop_down.dart';
import 'package:danek/main.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:danek/helpers/colors.dart';
import 'package:danek/models/animation_button.dart';
import 'package:toggle_switch/toggle_switch.dart';

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
                  ToggleSwitch(
                      minWidth: 82.0,
                      minHeight: 53.0,
                      initialLabelIndex: 0,
                      cornerRadius: 50.0,
                      activeFgColor: Colors.white,
                      inactiveBgColor: Colors.white,
                      inactiveFgColor: Colors.black,
                      totalSwitches: 2,
                      icons: const [
                        Icons.volume_up_outlined,
                        Icons.volume_off_outlined,
                      ],
                      iconSize: 30.0,
                      borderColor: const [Colors.black45],
                      activeBgColors: const [
                        [Colors.red, Colors.pink],
                        [Colors.red, Colors.pink]
                      ],
                      animate: true,
                      curve: Curves.bounceInOut,
                      onToggle: (index) {}),
                  AnimatedButton(
                      color: CustomColors.yellowColor,
                      borderColor: CustomColors.yellowColor,
                      shadowColor: CustomColors.orangeColor,
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      },
                      child: Text(LocaleKeys.menu.tr(),
                          style: const TextStyle(
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
