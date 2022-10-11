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
