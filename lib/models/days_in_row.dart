import 'package:intl/intl.dart';

void getExtraCoin() {
  int getLastCounter() {
    return 2; //кол-во для теста
  }

// this sets the database counter
  void setCounter(counter) {
    // set database value
  }

// this gets the last date the user logged in from database
  DateTime loadLastTime() {
    return (DateTime.parse(
        "2022-10-19")); //<-- alter this date to see code change
  }

// This sets new login date
  void setNewTime(date) {
    print('Set last login date to: $date'); //
  }

//функция возвращает сегодняшнюю дату в формате yyyy-MM-dd
  DateTime getJustDate(DateTime date) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final formatted = formatter.format(date);
    return DateTime.parse(formatted);
  }

  int counter = getLastCounter();
  // print('current login count: $counter');
  final today = getJustDate(DateTime.now());
  final last = getJustDate(loadLastTime());
  if (today.difference(last) == Duration(days: 1)) {
    setCounter(counter++);
    print(counter);
  } else {
    setCounter(0);
    print(counter);
  }
  setNewTime(today); //  обновляется  дата входа

  Map<int, int> extraMap = {3: 100, 5: 500, 10: 1000, 15: 1500, 20: 2000};
  var keySet = extraMap.keys;
  int myCoins = 0;
  if (keySet.contains(counter)) {
    myCoins = extraMap[counter]! + myCoins; //
    print("бонусные монетки: ${extraMap[counter]}");
    print("Всего: $myCoins");
  } else {
    throw "нет бонуса";
  }
}
