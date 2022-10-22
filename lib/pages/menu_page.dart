import 'package:danek/generated/locale_keys.g.dart';
import 'package:danek/helpers/audio.dart';
import 'package:danek/helpers/colors.dart';

import 'package:danek/helpers/time.dart';
import 'package:danek/helpers/user_preferences.dart';
import 'package:danek/models/animation_button.dart';
import 'package:danek/models/style.dart';
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
  bool foneMusic = true;
  int numberDays = 0; // количество дней подряд, изначально 0

  @override
  void initState() {
    super.initState();

    newFormLaunch = UserPreferences().getFormLaunch() ?? false;
    newHeroLaunch = UserPreferences().getHeroLaunch() ?? false;
    foneMusic = UserPreferences().getFoneticMusic() ?? true;
    numberDays = UserPreferences().getNumberDays() ?? 0;
    print(foneMusic);
    print('hero $newFormLaunch');
    print('form $newHeroLaunch');
    // checkFoneMusic(foneMusic);
    resumeMusic(foneMusic);
  }

  @override
  Widget build(BuildContext context) {
    // if (extraMap.keys.contains(numberDays)) {
    //   Future.delayed(
    //       Duration.zero, () => addBonusShowAlertDialog(context, numberDays));
    // }

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(top: 20),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/menubackground.png"),
                fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: SizedBox(
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
                            if (newFormLaunch == false &&
                                newHeroLaunch == false) {
                              Navigator.pushNamed(context, '/formpage');
                            }
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
                            LocaleKeys.shop.tr().toUpperCase(),
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

// addBonusShowAlertDialog(context, numberDays) {
//   Widget okButton = TextButton(
//     style: ButtonStyle(
//         backgroundColor: MaterialStateProperty.all(CustomColors.darkBlueGrey)),
//     child: Text(
//       LocaleKeys.yes.tr().toUpperCase(),
//       style: buttonStyleAlertDialog(),
//     ),
//     onPressed: () {
//       Navigator.pop(context);
//       // Navigator.pushNamed(context, '/menupage');
//       // allDeleteShowAlertDialog2(context, deleteInfo);
//     },
//   );

//   AlertDialog addBonus = AlertDialog(
//     shape: const RoundedRectangleBorder(
//       borderRadius: BorderRadius.all(
//         Radius.circular(20.0),
//       ),
//     ),
//     titleTextStyle: textStyleNoAlertDialog(),
//     actionsAlignment: MainAxisAlignment.center,
//     title: Text(
//       '+  ${extraMap[numberDays]}',
//       // LocaleKeys.you_sure_start_again.tr(),
//       textAlign: TextAlign.center,
//     ),
//     content: Wrap(children: [
//       Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Image.asset(
//             'assets/images/smile_ok.png',
//             width: 140,
//             //width: MediaQuery.of(context).size.width * 0.4,
//           ),
//           const SizedBox(width: 10),
//         ],
//       ),
//     ]),
//     actions: [okButton],
//   );
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return Theme(
//         data: ThemeData(
//           dialogTheme: const DialogTheme(
//             backgroundColor: CustomColors.blueGrey,
//           ),
//         ),
//         child: addBonus,
//       );
//     },
//   );
// }