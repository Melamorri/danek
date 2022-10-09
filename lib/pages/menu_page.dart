import 'package:danek/helpers/colors.dart';
import 'package:danek/models/animation_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:easy_localization/easy_localization.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(top: 20),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/menubackground.png"),
                fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/settingpage');
                        },
                        icon: const Icon(Icons.settings))
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 6 * 5,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AnimatedButton(
                          color: CustomColors.pinkColor,
                          borderColor: CustomColors.darkBlueColor,
                          shadowColor: CustomColors.darkBlueColor,
                          onPressed: () {
                            Navigator.pushNamed(context, '/formpage');
                          },
                          child: const Text('ИГРАТЬ',
                              style: TextStyle(
                                  fontFamily: 'RobotoCondensed',
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold))),
                      const SizedBox(
                        height: 150,
                        child: Image(
                            image: AssetImage('assets/images/logotype.png')),
                      ),
                      AnimatedButton(
                          color: CustomColors.yellowColor,
                          borderColor: CustomColors.yellowColor,
                          shadowColor: CustomColors.orangeColor,
                          onPressed: () {
                            Navigator.pushNamed(context, '/shoppage');
                          },
                          child: const Text('МЕНЮ',
                              style: TextStyle(
                                  fontFamily: 'RobotoCondensed',
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold))),
                      AnimatedButton(
                          color: CustomColors.lightBlueColor,
                          borderColor: CustomColors.darkBlueColor,
                          shadowColor: CustomColors.darkBlueColor,
                          onPressed: () {
                            SystemNavigator.pop();
                          },
                          child: const Text('ВЫХОД',
                              style: TextStyle(
                                  fontFamily: 'RobotoCondensed',
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold))),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
