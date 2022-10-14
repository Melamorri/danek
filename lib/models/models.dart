import 'package:danek/helpers/colors.dart';
import 'package:flutter/material.dart';

//Декорации поля ввода имени и возраста

InputDecoration inputDecoration(String labelText) {
  return InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
    ),
    floatingLabelAlignment: FloatingLabelAlignment.center,
    labelStyle: const TextStyle(color: CustomColors.darkBlueColor),
    fillColor: CustomColors.white30Color,
    filled: true,
    label: Text(labelText),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: CustomColors.darkBlueColor,
        width: 3,
      ),
      borderRadius: BorderRadius.circular(40),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: CustomColors.darkBlueColor,
        width: 3,
      ),
      borderRadius: BorderRadius.circular(40),
    ),
  );
}

// Стиль текста поля ввода имени и возраста

TextStyle textStyleInput() {
  return const TextStyle(
      fontFamily: 'RobotoCondensed',
      fontSize: 26,
      color: CustomColors.darkBlueColor,
      fontWeight: FontWeight.bold);
}

//Стиль названий кнопок

TextStyle textStyleButton() {
  return const TextStyle(
    fontFamily: 'RobotoCondensed',
    fontSize: 26,
    fontWeight: FontWeight.bold,
  );
}

TextStyle textStyleAlertDialog() {
  return const TextStyle(
    color: CustomColors.darkBlueColor,
    fontFamily: 'RobotoCondensed',
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );
}

TextStyle textStylePriceShop() {
  return const TextStyle(
    color: CustomColors.darkBlueColor,
    fontFamily: 'RobotoCondensed',
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
}

TextStyle buttonStyleAlertDialog() {
  return const TextStyle(
    color: CustomColors.darkBlueColor,
    fontFamily: 'RobotoCondensed',
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
}

TextStyle buttonStyleMyPurchases() {
  return const TextStyle(
    //decoration: TextDecoration.underline,
    color: CustomColors.darkBlueColor,
    fontFamily: 'RobotoCondensed',
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
}

TextStyle textStyleNothing() {
  return const TextStyle(
      fontFamily: 'LeOslerRoughRegular',
      fontSize: 36,
      color: CustomColors.whiteColor,
      fontWeight: FontWeight.bold);
}

/////////////////////////
TextStyle stackTextStyle_1() {
  return TextStyle(
    fontSize: 36,
    fontFamily: 'LeOslerRoughRegular',
    foreground: Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..color = CustomColors.whiteColor,
  );
}

TextStyle stackTextStyle_2() {
  return const TextStyle(
    fontSize: 36,
    color: CustomColors.darkBlueColor,
    fontFamily: 'LeOslerRoughRegular',
  );
}

///////////////////////////
TextStyle activityText_1() {
  return TextStyle(
    fontFamily: 'RobotoCondensed',
    fontSize: 26,
    fontWeight: FontWeight.bold,
    foreground: Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..color = CustomColors.whiteColor,
  );
}

TextStyle activityText_2() {
  return const TextStyle(
      fontSize: 26,
      color: CustomColors.darkBlueColor,
      fontFamily: 'RobotoCondensed',
      fontWeight: FontWeight.bold);
}
