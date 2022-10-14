import 'package:danek/helpers/drop_down.dart';
import 'package:danek/main.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:danek/helpers/colors.dart';
import 'package:danek/models/animation_button.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  _SettingPageState createState() => _SettingPageState();
}

String? dropdownValue;

class _SettingPageState extends State<SettingPage> {
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
                  Container(
                      padding: const EdgeInsets.only(
                          top: 7, bottom: 7, left: 12, right: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          color: CustomColors.lightBlueColor,
                          border: Border.all(
                              color: CustomColors.darkBlueColor, width: 2)),
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        dropdownColor: CustomColors.lightBlueColor,
                        borderRadius: BorderRadius.circular(20),
                        hint: const Text('🌐 выбери язык'),
                        items: <String>[
                          '🇰🇿 қазақ',
                          '🇬🇧 English',
                          '🇷🇺 Русский',
                          '🇺🇿 ozbek',
                          '🇰🇬 Кыргыз',
                          '🇹🇯 тоҷикӣ'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(fontSize: 23),
                            ),
                          );
                        }).toList(),
                        icon: const Icon(Icons.arrow_drop_down),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                      )),
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
                      child: const Text('МЕНЮ',
                          style: TextStyle(
                              fontFamily: 'RobotoCondensed',
                              fontSize: 26,
                              fontWeight: FontWeight.bold))),
                ]),
          ),
        ),
      ),
    );
  }
}
