import 'package:intl/intl.dart';

getExtraCoins() {
  int getLastCounter() {
    return 4; //предыдущее значение счетчика
//     кол-во пока заводим вручную, для теста,кол-во на 1 день меньше до бонуса//
  }

// значение счетчика
  void setCounter(counter) {}

// дата последнего взода в игру, взять  из shared preference
  DateTime loadLastTime() {
    return (DateTime.parse(
        "2022-10-19")); //<-- меняем пока вручную эту дату, чтобы посмореть работу кода
  }

// установка даты нового входа в игру
  void setNewTime(date) {
    print('Вход в игру: $date'); //
  }

//функция возвращает сегодняшнюю дату в формате yyyy-MM-dd
  DateTime getJustDate(DateTime date) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final formatted = formatter.format(date);
    return DateTime.parse(formatted);
  }

  int counter = getLastCounter();
  print('Предудыщее значение счетчика: $counter');
  final today = getJustDate(DateTime.now());
  final last = getJustDate(loadLastTime());
  if (today.difference(last) == Duration(days: 1)) {
    setCounter(counter++);
    print("Новый счетчик: $counter");
  } else {
    setCounter(0);
    print("Старый счетчик: $counter");
  }
  setNewTime(today); //  обновляется  дата

  Map<int, int> extraMap = {3: 100, 5: 500, 10: 1000, 15: 1500, 20: 2000};
  var keyList = extraMap.keys;
  int myCoins = 7; //ставлю пока не 0, чтобы была видна разница.
  if (keyList.contains(counter)) {
    myCoins = extraMap[counter]! + myCoins; //
    print("Бонусные монетки: ${extraMap[counter]}");
    print("Всего монет: $myCoins");
  } else {
    throw "нет бонуса";
  }
}
