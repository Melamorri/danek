import 'dart:async';
import 'package:danek/generated/locale_keys.g.dart';
import 'package:danek/helpers/audio.dart';
import 'package:danek/helpers/colors.dart';

import 'package:danek/helpers/time.dart';
import 'package:danek/helpers/user_preferences.dart';
import 'package:danek/models/style.dart';
import 'package:danek/pages/shop_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CoverScreenPage extends StatefulWidget {
  const CoverScreenPage({super.key});

  @override
  State<CoverScreenPage> createState() => _CoverScreenPageState();
}

class _CoverScreenPageState extends State<CoverScreenPage> {
  Timer? timer;
  bool foneMusic = false;
  bool? heroLaunch;
  bool? formLaunch;
  int? timeStorage; // первый заход, сохраняется в преференс
  int numberDays = 0; // количество дней подряд, изначально 0
  int? timeToday; //  дата захода в программу
  int? myCoins; // количество монеток при заходе в игру

  // функция добавления времени в преференс
  Future addTimeNow(time) async {
    await UserPreferences().setTimeNow(time);
  }

// функция добавления количества дней подряд
  Future addNumberDays(number) async {
    await UserPreferences().setNumberDays(number);
  }

// функция добавления бонусных монеток
  Future addCoinsPref(coins) async {
    await UserPreferences().setCoins(coins);
  }

  // функция проверки дней подряд. Сравниваем текущую таду и дату из преференс, если разница равна 1(то есть зашли на след день),
  // то берем из перференс количество дней подряд(изначально 0), и прибавляем 1, и новой значение записываем в память, если разница не равна 1, то обнуляем.
  checkDays(timeStorage, timeToday) {
    if ((timeStorage == timeToday) &&
        (formLaunch == true || heroLaunch == true)) {
      print(timeStorage);
      print(timeToday);
      numberDays = UserPreferences().getNumberDays() ?? 0;
      print(numberDays);
      return;
    } else if ((timeToday - timeStorage == 1) &&
        (formLaunch == true || heroLaunch == true)) {
      numberDays = UserPreferences().getNumberDays() ?? 0;
      print(numberDays);
      numberDays = numberDays + 1;
      setState(() {
        numberDays;
        print(numberDays);
      });
      print(numberDays);
      addNumberDays(numberDays);
    } else {
      numberDays = 0;
      print(numberDays);
      addNumberDays(numberDays);
    }
  }

  Map<int, int> extraMap = {
    3: 100,
    5: 500,
    10: 1000,
    15: 1500,
    20: 2000
  }; // варианты добавления монет

  //функция добавления монеток
  addCoins(numberDays, timeStorage, timeToday) {
    var keyList = extraMap.keys;
    if (timeStorage == timeToday) {
      print('Сегодня уже бонус получили');
      return;
    } else if (keyList.contains(numberDays)) {
      myCoins = extraMap[numberDays]! + myCoins!;
      addCoinsPref(myCoins);
      //
      print("Бонусные монетки: ${extraMap[numberDays]}");
      print("Всего монет: $myCoins");
    } else {
      print('Нет бонуса');
    }
  }

  @override
  void initState() {
    super.initState();
    timeStorage = UserPreferences().getTimeNow() ??
        time(); // при первом заходе получаем дату и отправляем ее в преференс
    heroLaunch = UserPreferences().getFormLaunch() ?? false;
    formLaunch = UserPreferences().getHeroLaunch() ?? false;
    myCoins = UserPreferences().getCoins() ?? 0;
    // addTimeNow(timeStorage);
    print(timeStorage);
    timeToday = time(); // считываем время заходя в программу
    print(timeToday);
    // numberDays = (timeProba! -
    //     timeStorage!); // вычисляем разницу в количестве дней между сегодняжним и последним заходом
    addTimeNow(
        timeToday); // перезаписываем данные в преференс на сегодняшнюю дату
    checkDays(timeStorage, timeToday); // проверяем подряд ли дни
    addCoins(numberDays, timeStorage, timeToday);
    foneMusic = UserPreferences().getFoneticMusic() ?? false;
    checkFoneMusic(foneMusic);
    timer = Timer(const Duration(seconds: 4), () {
      Navigator.pushNamed(context, '/menupage');
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    if (extraMap.keys.contains(numberDays)) {
      Future.delayed(
          Duration.zero, () => addBonusShowAlertDialog(context, numberDays));
    }
    return SafeArea(
        child: Container(
      // padding: const EdgeInsets.only(top: 20),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/menubackground.png"),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
                image: AssetImage('assets/images/coverpage.png'),
                fit: BoxFit.cover),
            SizedBox(height: 40),
            SpinKitFadingCircle(
              color: CustomColors.whiteColor,
              size: 50,
            )
          ],
        ),
      ),
    ));
  }
}

addBonusShowAlertDialog(context, numberDays) async {
  Widget okButton = TextButton(
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(CustomColors.darkBlueGrey)),
    child: Text(
      LocaleKeys.yes.tr().toUpperCase(),
      style: buttonStyleAlertDialog(),
    ),
    onPressed: () {
      Navigator.pop(context);
      // Navigator.pushNamed(context, '/menupage');
      // allDeleteShowAlertDialog2(context, deleteInfo);
    },
  );
  AlertDialog addBonus = AlertDialog(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(20.0),
      ),
    ),
    titleTextStyle: textStyleNoAlertDialog(),
    actionsAlignment: MainAxisAlignment.center,
    title: Text(
      '+  ${extraMap[numberDays]}',
      // LocaleKeys.you_sure_start_again.tr(),
      textAlign: TextAlign.center,
    ),
    content: Wrap(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/smile_ok.png',
            width: 140,
            //width: MediaQuery.of(context).size.width * 0.4,
          ),
          const SizedBox(width: 10),
        ],
      ),
    ]),
    actions: [okButton],
  );

  await showGeneralDialog(
    barrierDismissible: false,
    context: context,
    pageBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return Theme(
        data: ThemeData(
          dialogTheme: const DialogTheme(
            backgroundColor: CustomColors.blueGrey,
          ),
        ),
        child: addBonus,
      );
    },
  );
}
