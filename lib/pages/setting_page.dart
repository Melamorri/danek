import 'package:danek/generated/locale_keys.g.dart';
import 'package:danek/helpers/drop_down.dart';
import 'package:danek/helpers/user_preferences.dart';
import 'package:danek/main.dart';
import 'package:danek/models/models.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:danek/helpers/colors.dart';
import 'package:danek/models/animation_button.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SettingPage extends StatefulWidget {
  SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  String? userName;
  int? userAge;
  String? hero;
  bool? formLaunch;
  bool? newHeroLaunch;
  List<String> myPurchases = [];
  int myCoins = 0;

  deleteInfo() async {
    // await UserPreferences().deleteUserName();
    // await UserPreferences().deleteUserAge();
    // await UserPreferences().deleteMyPurcahses();
    // await UserPreferences().deleteCoins();
    // await UserPreferences().deleteHero();
    // await UserPreferences().deleteFormLaunch();
    // await UserPreferences().deleteHeroLaunch();
    await UserPreferences().clearData();
  }

  @override
  void initState() {
    super.initState();
    userName = UserPreferences().getUserName() ?? '';
    userAge = UserPreferences().getUserAge();
    hero = UserPreferences().getHero() ?? '';
    formLaunch = UserPreferences().getFormLaunch() ?? false;
    newHeroLaunch = UserPreferences().getHeroLaunch() ?? false;
    myPurchases = UserPreferences().getMyPurchases() ?? [];
    myCoins = UserPreferences().getCoins() ?? 0;
  }

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
              //height: 550,
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
                    child: Text(
                      LocaleKeys.menu.tr().toUpperCase(),
                      style: const TextStyle(
                          fontFamily: 'RobotoCondensed',
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: FloatingActionButton(
            elevation: 0,
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(
                side: const BorderSide(width: 2, color: CustomColors.blueGrey),
                borderRadius: BorderRadius.circular(100)),
            onPressed: () {
              allDeleteShowAlertDialog(context, deleteInfo);
            },
            child: const Icon(Icons.delete_forever),
          ),
        ),
      ),
    );
  }
}

allDeleteShowAlertDialog(context, deleteInfo) {
  Widget yesButton = TextButton(
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(CustomColors.darkBlueGrey)),
    child: Text(
      'ДА',
      style: buttonStyleAlertDialog(),
    ),
    onPressed: () {
      allDeleteShowAlertDialog2(context, deleteInfo);
    },
  );
  Widget noButton = TextButton(
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(CustomColors.darkBlueGrey)),
    child: Text(
      'НЕТ',
      style: buttonStyleAlertDialog(),
    ),
    onPressed: () {
      Navigator.of(context).pop();
      // Navigator.pushNamedAndRemoveUntil(
      //   context,
      //   '/settingPage',
      //   (route) => true,
      // );
    },
  );
  AlertDialog allDelete = AlertDialog(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(20.0),
      ),
    ),
    titleTextStyle: textStyleNoAlertDialog(),
    actionsAlignment: MainAxisAlignment.center,
    title: Text(
      'Точно хочешь начать игру сначала?',
      textAlign: TextAlign.center,
    ),
    content: Wrap(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/smile_qw.png',
            width: 140,
            //width: MediaQuery.of(context).size.width * 0.4,
          ),
          const SizedBox(width: 10),
        ],
      ),
    ]),
    actions: [yesButton, noButton],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Theme(
        data: ThemeData(
          dialogTheme: const DialogTheme(
            backgroundColor: CustomColors.blueGrey,
          ),
        ),
        child: allDelete,
      );
    },
  );
}

// Всплывающее окно "Ты уверен"
allDeleteShowAlertDialog2(context, deleteInfo) {
  Widget yesButton = TextButton(
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(CustomColors.darkBlueGrey)),
    child: Text(
      'ДА',
      style: buttonStyleAlertDialog(),
    ),
    onPressed: () {
      deleteInfo();
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/',
        (route) => false,
      );
      // Сброс настроек
    },
  );
  Widget noButton = TextButton(
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(CustomColors.darkBlueGrey)),
    child: Text(
      'НЕТ',
      style: buttonStyleAlertDialog(),
    ),
    onPressed: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SettingPage()));
    },
    // Navigator.pushNamed(
    //   context,
    //   '/settingPage',
    // );
  );
  AlertDialog allDelete = AlertDialog(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(20.0),
      ),
    ),
    titleTextStyle: textStyleNoAlertDialog(),
    actionsAlignment: MainAxisAlignment.center,
    title: Text(
      'Ты уверен?',
      textAlign: TextAlign.center,
    ),
    content: Wrap(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/znak.png',
            width: 140,
            //width: MediaQuery.of(context).size.width * 0.4,
          ),
          const SizedBox(width: 10),
        ],
      ),
    ]),
    actions: [yesButton, noButton],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Theme(
        data: ThemeData(
          dialogTheme: const DialogTheme(
            backgroundColor: CustomColors.blueGrey,
          ),
        ),
        child: allDelete,
      );
    },
  );
}
