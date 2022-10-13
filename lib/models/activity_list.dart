import 'package:danek/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class ActivityList {
  String name;
  String image;
  String gif;
  String wav;
  int id;

  ActivityList({
    required this.name,
    required this.image,
    required this.gif,
    this.wav = '',
    required this.id,
  });
}

List<ActivityList> ativityList = [
  ActivityList(
    id: 1,
    name: LocaleKeys.read_book.tr(),
    image: 'assets/images/readbookbutton.png',
    gif: 'assets/images/reeding_books.gif',
  ),
  ActivityList(
      id: 2,
      name: LocaleKeys.teeth.tr(),
      image: 'assets/images/toothbrushbutton.png',
      gif: 'assets/images/frog.gif',
      wav: 'teeth.mp3'),
  ActivityList(
      id: 3,
      name: LocaleKeys.toys.tr(),
      image: 'assets/images/toysbutton.png',
      gif: 'assets/images/fold_toys.gif',
      wav: 'toys.mp3'),
  ActivityList(
    id: 4,
    name: LocaleKeys.eat.tr(),
    image: 'assets/images/eatbutton.png',
    gif: 'assets/images/eating.gif',
  ),
  ActivityList(
    id: 5,
    name: LocaleKeys.exercise.tr(),
    image: 'assets/images/gymbutton.png',
    gif: 'assets/images/excercise.gif',
  ),
];
// нужно тогда добавить сюда же  стоимость действия,  это переменная cash
//прописано в helpers/activity_button
