import 'package:danek/helpers/colors.dart';
import 'package:danek/main.dart';
import 'package:danek/models/animation_button.dart';
import 'package:danek/models/models.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class ChooseHeroes extends StatefulWidget {
  const ChooseHeroes({super.key});

static var kImages = <Image>[
    Image.asset('assets/images/girl1.png'),
    Image.asset('assets/images/boy1.png'),
    Image.asset('assets/images/bird.png'),
    Image.asset('assets/images/leo.png'),
  ];

  @override
  State<ChooseHeroes> createState() => _ChooseHeroesState();
}

class _ChooseHeroesState extends State<ChooseHeroes> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
    child: Container(
      padding: EdgeInsets.only(top: 20),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/menubackground.png"),
          fit: BoxFit.cover,
        ),
      ),
    child: Scaffold(
      backgroundColor: Colors.transparent,
    body: DefaultTabController(
      length: ChooseHeroes.kImages.length,
      child: Builder(
        builder: (BuildContext context) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text('SWIPE LEFT/RIGHT TO',
              style: TextStyle(
                color: CustomColors.lightBlueColor,
                fontFamily: 'HelloDinaScriptStyle',
                fontWeight: FontWeight.w700,
                fontSize: 40,
                )
              ),
              Text('SELECT YOUR CHARACTER',
              style: TextStyle(
                color: CustomColors.lightBlueColor,
                fontFamily: 'HelloDinaScriptStyle',
                fontWeight: FontWeight.w700,
                fontSize: 40,
              ),
              ),
              const TabPageSelector(),
              Expanded(
                  child: TabBarView(children: ChooseHeroes.kImages),
              ),
              AnimatedButton(
                color: CustomColors.lightBlueColor,
                      borderColor: CustomColors.darkBlueColor,
                      shadowColor: CustomColors.darkBlueColor,
                onPressed: () {
                  final TabController controller =
                      DefaultTabController.of(context)!;
                  if (!controller.indexIsChanging) {
                    controller.animateTo(ChooseHeroes.kImages.length - 1);
                    Navigator.pushNamed(context, '/gamepage');
                  }
                },
                child: Text(
                  'SELECT',
                  style: textStyleButton(),
                ),
              ),
              SizedBox(height: 20),
              AnimatedButton(
                color: CustomColors.redColor,
                      borderColor: CustomColors.darkBlueColor,
                      shadowColor: CustomColors.darkBlueColor,
                onPressed: () {
                  final TabController controller =
                      DefaultTabController.of(context)!;
                  if (!controller.indexIsChanging) {
                    controller.animateTo(ChooseHeroes.kImages.length - 1);
                    Navigator.pushNamed(context, '/formpage');
                  }
                },
                child: Text(
                  'BACK',
                  style: textStyleButton(),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    ),
    ),
    ),
    );
  }
}