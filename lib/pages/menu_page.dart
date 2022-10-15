import 'package:danek/generated/locale_keys.g.dart';
import 'package:danek/helpers/colors.dart';
import 'package:danek/helpers/user_preferences.dart';
import 'package:danek/models/animation_button.dart';
import 'package:danek/models/models.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:easy_localization/easy_localization.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  bool? newFormLaunch;
  bool? newHeroLaunch;
  @override
  void initState() {
    super.initState();
    loadNewLaunch();
  }

  loadNewLaunch() async {
    setState(() {
      bool formLaunch = UserPreferences().getFormLaunch() ?? false;
      bool heroLaunch = UserPreferences().getHeroLaunch() ?? false;
      newFormLaunch = formLaunch;
      newHeroLaunch = heroLaunch;
    });
  }

  deleteInfo() async {
    await UserPreferences().deleteUserName();
    await UserPreferences().deleteUserAge();
    await UserPreferences().deleteFormLaunch();
    await UserPreferences().deleteHeroLaunch();
  }

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
                      AnimatedButton(
                        color: CustomColors.pinkColor,
                        borderColor: CustomColors.darkBlueColor,
                        shadowColor: CustomColors.darkBlueColor,
                        onPressed: () {
                          if (newFormLaunch! && newHeroLaunch!) {
                            Navigator.pushNamed(context, '/heropage');
                          } else if (newFormLaunch! && newHeroLaunch == false) {
                            Navigator.pushNamed(context, '/chooseheroes');
                          } else if (newFormLaunch! == false) {
                            Navigator.pushNamed(context, '/formpage');
                          }
                        },
                        child: Text(
                          LocaleKeys.play.tr().toUpperCase(),
                          style: textStyleButton(),
                        ),
                      ),
                      SizedBox(
                        height: 207,
                        child: Column(
                          children: [
                            const Image(
                              image: AssetImage('assets/images/logotype.png'),
                            ),
                            SizedBox(height: 4),
                            Text(
                              LocaleKeys.portal.tr(),
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
                            if (newFormLaunch! && newHeroLaunch!) {
                              Navigator.pushNamed(context, '/heropage');
                            } else if (newFormLaunch! &&
                                newHeroLaunch == false) {
                              Navigator.pushNamed(context, '/chooseheroes');
                            } else if (newFormLaunch! == false) {
                              Navigator.pushNamed(context, '/formpage');
                            }
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
