import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/shoppage');
                  },
                  child: const Text('Магазин')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/formpage');
                  },
                  child: const Text('Играть')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/settingpage');
                  },
                  child: const Text('Настройки')),
              ElevatedButton(
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  child: const Text('Выход')),
            ],
          ),
        ),
      ),
    );
  }
}
