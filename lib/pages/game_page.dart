import 'package:danek/pages/form_page.dart';
import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 60),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/menubackground.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/');
                },
                child: const CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage("assets/images/backbutton.png"),
                ),
              ),
              SizedBox(
                height: 20,
                width: MediaQuery.of(context).size.width * 0.4,
              ),
              const CircleAvatar(
                radius: 30.0,
                backgroundImage: AssetImage("assets/images/coin.png"),
                //нужно добавить счетчик монет и обновление страницы setState
                //цифры под иконкой с монетой ?
              ),
            ],
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.75,
              child: Image.asset("assets/images/girl1.png")),
          //далее привязать к индексу в shared preferences
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ActivityButton(image: "assets/images/toysbutton.png"),
              ActivityButton(image: "assets/images/gymbutton.png"),
              ActivityButton(image: "assets/images/eatbutton.png"),
              ActivityButton(image: "assets/images/toothbrushbutton.png"),
              ActivityButton(image: "assets/images/readbookbutton.png"),
            ],
          ),
        ],
      ),
    );
  }
}

class ActivityButton extends StatelessWidget {
  final String image;

  ActivityButton({required this.image});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/activitypage');
        // функция: переход на страницу с активностью, запускаем таймер на 60 сек,  возврат на пред. страницу, добавляем монетки
      },
      child: CircleAvatar(
        radius: 30.0,
        backgroundImage: AssetImage(image),
      ),
    );
  }
}
