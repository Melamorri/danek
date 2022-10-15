import 'package:danek/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

class ActivityList {
  String name;
  String image;
  String gif;
  String wav;
  int id;
  int cash;

  ActivityList({
    required this.name,
    required this.image,
    required this.gif,
    this.wav = 'null.mp3',
    required this.id,
    required this.cash,
  });
}

List<ActivityList> activityList = [
  ActivityList(
    id: 1,
    name: LocaleKeys.read_book.tr(),
    image: 'assets/images/readbookbutton.png',
    gif: 'assets/images/reeding_books.gif',
    cash: 25,
  ),
  ActivityList(
    id: 2,
    name: LocaleKeys.teeth.tr(),
    image: 'assets/images/toothbrushbutton.png',
    gif: 'assets/images/frog.gif',
    wav: 'teeth.mp3',
    cash: 25,
  ),
  ActivityList(
    id: 3,
    name: LocaleKeys.toys.tr(),
    image: 'assets/images/toysbutton.png',
    gif: 'assets/images/fold_toys.gif',
    wav: 'toys.mp3',
    cash: 50,
  ),
  ActivityList(
    id: 4,
    name: LocaleKeys.eat.tr(),
    image: 'assets/images/eatbutton.png',
    gif: 'assets/images/eating.gif',
    wav: 'masha.mp3',
    cash: 20,
  ),
  ActivityList(
    id: 5,
    name: LocaleKeys.exercise.tr(),
    image: 'assets/images/gymbutton.png',
    gif: 'assets/images/excercise.gif',
    cash: 30,
  ),
];

int value = 0;
void upCoin(int cash) {
  value = value + cash;
}
