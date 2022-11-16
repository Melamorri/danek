import 'package:danek/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

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
    required this.wav,
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
      wav: LocaleKeys.wav_read_book.tr().toString()),
  ActivityList(
      id: 2,
      name: LocaleKeys.teeth.tr(),
      image: 'assets/images/toothbrushbutton.png',
      gif: 'assets/images/frog.gif',
      wav: LocaleKeys.wav_teeth.tr().toString(),
      cash: 25),
  ActivityList(
      id: 3,
      name: LocaleKeys.toys.tr(),
      image: 'assets/images/toysbutton.png',
      gif: 'assets/images/fold_toys.gif',
      wav: LocaleKeys.wav_toys.tr().toString(),
      cash: 50),
  ActivityList(
      id: 4,
      name: LocaleKeys.eat.tr(),
      image: 'assets/images/eatbutton.png',
      gif: 'assets/images/eating.gif',
      wav: LocaleKeys.wav_eat.tr().toString(),
      cash: 20),
  ActivityList(
      id: 5,
      name: LocaleKeys.exercise.tr(),
      image: 'assets/images/gymbutton.png',
      gif: 'assets/images/excercise.gif',
      cash: 30,
      wav: LocaleKeys.wav_exercise.tr().toString()),
];
