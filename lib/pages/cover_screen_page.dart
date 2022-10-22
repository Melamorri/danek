import 'dart:async';

import 'package:danek/helpers/audio.dart';
import 'package:danek/helpers/colors.dart';

import 'package:danek/helpers/time.dart';
import 'package:danek/helpers/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CoverScreenPage extends StatefulWidget {
  const CoverScreenPage({super.key});

  @override
  State<CoverScreenPage> createState() => _CoverScreenPageState();
}

class _CoverScreenPageState extends State<CoverScreenPage> {
  Timer? timer;
  bool foneMusic = true;
  int? timeStorage; // первый заход, сохраняется в преференс
  int numberDays = 0; // количество дней подряд, изначально 0
  int? timeProba; // имитация даты захода в программу
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
  checkDays(timeStorage, timeProba) {
    if (timeStorage == timeProba) {
      print(timeStorage);
      print(timeProba);
      numberDays = UserPreferences().getNumberDays() ?? 0;
      print(numberDays);
      return;
    } else if (timeProba - timeStorage == 1) {
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
  addCoins(numberDays) {
    var keyList = extraMap.keys;
    if (keyList.contains(numberDays)) {
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
    // numberDays = UserPreferences().getNumberDays() ?? 0;
    myCoins = UserPreferences().getCoins() ?? 0;
    // addTimeNow(timeStorage);
    print(timeStorage);
    timeProba = timeProbaToday(); // считываем время заходя в программу
    print(timeProba);
    // numberDays = (timeProba! -
    //     timeStorage!); // вычисляем разницу в количестве дней между сегодняжним и последним заходом
    addTimeNow(
        timeProba); // перезаписываем данные в преференс на сегодняшнюю дату
    checkDays(timeStorage, timeProba); // проверяем подряд ли дни
    addCoins(numberDays);
    foneMusic = UserPreferences().getFoneticMusic() ?? true;
    checkFoneMusic(foneMusic);
    timer = Timer(const Duration(seconds: 3), () {
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
