import 'package:danek/helpers/colors.dart';
import 'package:flutter/material.dart';

//Декорации поля ввода имени и возраста

InputDecoration inputDecoration(String labelText) {
  return InputDecoration(
    labelStyle: const TextStyle(color: Colors.black54),
    fillColor: CustomColors.white38Color,
    filled: true,
    labelText: labelText,
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: CustomColors.whiteColor,
        width: 3,
      ),
      borderRadius: BorderRadius.all(Radius.circular(30)),
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: CustomColors.whiteColor,
        width: 3,
      ),
      borderRadius: BorderRadius.all(Radius.circular(30)),
    ),
  );
}

// Стиль текста поля ввода имени и возраста

TextStyle textStyleInput() {
  return const TextStyle(
      fontSize: 26,
      color: CustomColors.black54Color,
      fontWeight: FontWeight.bold);
}
