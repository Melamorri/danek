import 'package:danek/helpers/colors.dart';
import 'package:flutter/material.dart';

// Эта страница создает кнопку выбора языка и вызыввется в страниц

class Drop extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DropState();
}

class _DropState extends State<Drop> {
  List<String> _language = [
    ' Русский',
    ' English',
    ' Кыргыз',
    ' қазақ',
    ' ozbek',
    ' тоҷикӣ'
  ];
  String? _selectedlanguage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 55,
        // width: 160,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: CustomColors.orangeColor.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
            color: CustomColors.yellowColor,
            borderRadius: BorderRadius.circular(40),
            border: Border.all(color: CustomColors.yellowColor, width: 4)),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            borderRadius: BorderRadius.circular(30),
            dropdownColor: CustomColors.orangeColor,
            hint: Text(
              ' Language',
              style: TextStyle(color: CustomColors.black54Color),
            ),
            iconEnabledColor: CustomColors.orangeColor,
            iconSize: 60,
            isDense: true,
            style: TextStyle(
                fontFamily: 'RobotoCondensed-Regular',
                fontSize: 26,
                color: CustomColors.darkBlueColor,
                fontWeight: FontWeight.bold),
            value: _selectedlanguage,
            onChanged: (newValue) {
              setState(() {
                _selectedlanguage = newValue;
              });
            },
            items: _language.map((language) {
              return DropdownMenuItem(
                child: new Text(language),
                value: language,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
