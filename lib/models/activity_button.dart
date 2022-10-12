import 'package:flutter/material.dart';

int value = 0;
void upCoin(int cash) {
  value = value + cash;
}

class ActivityButton extends StatelessWidget {
  final String image;
  final int cash;

  ActivityButton({required this.image, required this.cash});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: (MediaQuery.of(context).size.width - 50) / 5,
      child: Center(
        child: GestureDetector(
          onTap: () {
            upCoin(cash);
            Navigator.pushNamed(context, '/gamepage/page_act_1');
          },
          child: CircleAvatar(
            radius: 30.0,
            backgroundImage: AssetImage(image),
          ),
        ),
      ),
    );
  }
}

List<ActivityButton> act = [
  ActivityButton(image: "assets/images/toysbutton.png", cash: 50),
  ActivityButton(image: "assets/images/gymbutton.png", cash: 30),
  ActivityButton(image: "assets/images/eatbutton.png", cash: 20),
  ActivityButton(image: "assets/images/toothbrushbutton.png", cash: 25),
  ActivityButton(image: "assets/images/readbookbutton.png", cash: 25),
];
