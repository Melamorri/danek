Map<int, int> extraMap = {
  3: 100,
  5: 500,
  10: 1000,
  15: 1500,
  20: 2000
}; // варианты добавления монет

// функция определения времени сейчас. Возвращает количество дней с 1970 года.
int time() {
  var timeNow = DateTime.now().toString();
  print(timeNow);
  var timeNowMilisec = DateTime.now().millisecondsSinceEpoch /
      1000 /
      60 /
      60 /
      24; // сколько дней от текущего момента до определенной даты
  var timeNowInt = timeNowMilisec.toInt(); // делаем целым числом
  return timeNowInt;
}

// функция имитации даты захода в программу, возвращает количество дней с 1970 года
int timeProbaToday() {
  var timeNow = DateTime.parse("2022-10-22 03:29:15.3215").toString();
  print(timeNow);
  var timeNowMilisec =
      (DateTime.parse("2022-10-22 03:29:15.3215")).millisecondsSinceEpoch /
          1000 /
          60 /
          60 /
          24; // сколько дней от текущего момента до определенной даты
  var timeNowInt = timeNowMilisec.toInt(); // делаем целым числом
  return timeNowInt;
}
