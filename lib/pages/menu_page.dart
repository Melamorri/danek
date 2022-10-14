import 'package:danek/generated/locale_keys.g.dart';
import 'package:danek/helpers/colors.dart';
import 'package:danek/models/animation_button.dart';
import 'package:danek/models/models.dart';
import 'package:flame_audio/flame_audio.dart';
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/settingpage');
                            FlameAudio.play('fonemusic.wav', volume: 1);
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
                          child: Text(
                            LocaleKeys.play.tr().toUpperCase(),
                            style: textStyleButton(),
                          ),
                        ),
                        SizedBox(
                          height: 207,
                          child: Column(
                            children: const [
                              Image(
                                image: AssetImage('assets/images/logotype.png'),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Детский развлекательно-познавательный портал',
                                style: TextStyle(
                                    color: CustomColors.whiteColor,
                                    fontFamily: 'LeOslerRoughRegular',
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        AnimatedButton(
                          color: CustomColors.yellowColor,
                          borderColor: CustomColors.yellowColor,
                          shadowColor: CustomColors.orangeColor,
                          onPressed: () {
                            Navigator.pushNamed(context, '/shoppage');
                          },
                          child: Text(
                            LocaleKeys.menu.tr().toUpperCase(),
                            style: textStyleButton(),
                          ),
                        ),
                        AnimatedButton(
                          color: CustomColors.lightBlueColor,
                          borderColor: CustomColors.darkBlueColor,
                          shadowColor: CustomColors.darkBlueColor,
                          onPressed: () {
                            SystemNavigator.pop();
                          },
                          child: Text(
                            LocaleKeys.exit.tr().toUpperCase(),
                            style: textStyleButton(),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
