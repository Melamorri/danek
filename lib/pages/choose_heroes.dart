import 'package:danek/main.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class ChooseHeroes extends StatelessWidget {
  const ChooseHeroes({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(''),
          centerTitle: true,
        ),
        body: Container(
          child: Column(
            children: [
              Text('Выбрать героя'),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/gamepage');
                  },
                  child: Text('Далее')),
            ],
          ),
        ),
      ),
    );
  }
}
