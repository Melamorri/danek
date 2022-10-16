import 'package:intl/intl.dart';

// this gets the last counter from the database
void getExtraCoinsForDays() {
// this gets the last counter from the database

  int getLastCounter() {
    return 2; // количество входов = 0 в начале игры. как оно будет обновляться?
  }

// this sets the database counter
  void setCounter(counter) {
    // set database value
  }

// this gets the last date the user logged in from database
  DateTime loadLastTime() {
    return (DateTime.parse(
        "2022-10-15")); //<-- alter this date to see code change
    // это дата предыдущего непрерывного входа,
  }

// This sets new login date
  void setNewTime(date) {
    print('Set last login date to: $date');
  }

  DateTime getJustDate(DateTime date) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final formatted = formatter.format(date);
    return DateTime.parse(formatted);
  }

  // run this on login event
  int counter = getLastCounter();
  // print('current login count: $counter');
  final today = getJustDate(DateTime.now());
  final last = getJustDate(loadLastTime());
  if (today.difference(last) == Duration(hours: 24)) {
    setCounter(counter + 1);
  } else {
    setCounter(0);
  }
  setNewTime(today); //  обновляется  дата входа

  List<int> extralist = [100, 500, 1000, 1500, 2000];
  late int extra;

  int getExtraCoins() {
    if (counter + 1 == 3) {
      return extralist.elementAt(0);
    } else if (counter + 1 == 5) {
      return extralist.elementAt(1);
    } else if (counter + 1 == 10) {
      return extralist.elementAt(2);
    } else if (counter == 15) {
      return extralist.elementAt(3);
    } else if (counter + 1 == 20) {
      return extralist.elementAt(4);
    }
    throw 'Нет бонуса';
  }

  extra = getExtraCoins();
  int myCoins = 0; //не уверена насчет названия переменной, куда добавлять
  myCoins = myCoins + extra; // обновление счета монеток
  print("бонусные монетки: $extra");
  print("общий счет: $myCoins");
  print('количество дней в игре без перерыва: ${counter + 1}');
}

// куда прикрутить эту функцию?
//
