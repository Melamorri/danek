import 'package:danek/main.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Text('Игра'),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: Text('Меню')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/shoppage');
                  },
                  child: Text('Магазин')),
            ],
          ),
        ),
      ),
    );
  }
}
