import 'package:danek/generated/locale_keys.g.dart';
import 'package:danek/helpers/colors.dart';
import 'package:danek/models/animation_button.dart';
import 'package:danek/models/models.dart';
import 'package:danek/models/shop_models.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class MyPurchases extends StatelessWidget {
  const MyPurchases({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            'assets/images/menubackground.png',
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('Мои покупки'),
          centerTitle: true,
        ),
        body: StreamBuilder(
          stream: bloc.getStream,
          initialData: bloc.shopList,
          builder: (context, snapshot) {
            return snapshot.data['my_items'].length > 0
                ? Column(
                    children: [
                      Expanded(child: checkoutListBuilder(snapshot, context)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedButton(
                            color: CustomColors.yellowColor,
                            borderColor: CustomColors.yellowColor,
                            shadowColor: CustomColors.orangeColor,
                            onPressed: () {
                              Navigator.pushNamed(context, '/shoppage');
                            },
                            child: Text(
                              'SHOP',
                              style: textStyleButton(),
                            ),
                          ),
                          AnimatedButton(
                            color: CustomColors.pinkColor,
                            borderColor: CustomColors.darkBlueColor,
                            shadowColor: CustomColors.darkBlueColor,
                            onPressed: () {
                              Navigator.pushNamed(context, '/gamepage');
                            },
                            child: Text(
                              LocaleKeys.play.tr().toUpperCase(),
                              style: textStyleButton(),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40)
                    ],
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Ничего нет",
                          style: TextStyle(
                              fontFamily: 'LeOslerRoughRegular',
                              fontSize: 36,
                              color: CustomColors.whiteColor,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Image.asset(
                          'assets/images/smile.png',
                          width: 160,
                        ),
                      ],
                    ),
                  );
          },
        ),
      ),
    ));
  }
}

Widget checkoutListBuilder(snapshot, context) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * 0.75,
    child: GridView.builder(
        padding: const EdgeInsets.all(15),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: snapshot.data["my_items"].length,
        itemBuilder: (context, index) {
          final cartList = snapshot.data["my_items"];
          return InkWell(
            onTap: (() {}),
            child: Card(
              child: Column(
                children: [
                  const SizedBox(height: 5),
                  Text(
                    cartList[index]['name'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Image.asset(
                    cartList[index]['image'],
                    height: MediaQuery.of(context).size.height * 0.075,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.035,
                    child: TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                        ),
                        onPressed: () {
                          // переход на героя в новой одежде
                          Navigator.pushNamed(context, '/gamepage');
                        },
                        child: const Text(
                          'Применить',
                          style: TextStyle(fontSize: 10, color: Colors.black),
                        )),
                  )
                ],
              ),
            ),
          );
        }),
  );
}
