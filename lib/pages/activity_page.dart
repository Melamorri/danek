import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Активность"), centerTitle: true),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage("assets/images/menubackground.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Center(
              child: Image(image: AssetImage("assets/images/girl.jpg")),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/gamepage');
                },
                child: const Text('Вернуться')),
          ],
        ),
      ),
    );
  }
}
