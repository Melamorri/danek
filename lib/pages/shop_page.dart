import 'package:danek/generated/locale_keys.g.dart';
import 'package:danek/helpers/colors.dart';
import 'package:danek/models/activity_button.dart';
import 'package:danek/models/animation_button.dart';
import 'package:danek/models/models.dart';
import 'package:danek/models/shop_models.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

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
          body: SingleChildScrollView(
            child: StreamBuilder(
              initialData: bloc.shopList,
              stream: bloc.getStream,
              builder: (context, snapshot) {
                return shopItemsListBuilder(snapshot, context);
              },
            ),
          ),
        ),
      ),
    );
  }
}

Widget shopItemsListBuilder(snapshot, context) {
  return Column(children: [
    Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Stack(
              children: [
                Text("Магазин", style: stackTextStyle_1()),
                Text("Магазин", style: stackTextStyle_2()),
              ],
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.15),
            InkWell(
              enableFeedback: false,
              onTap: () {
                FlameAudio.play('zvukmonet.wav', volume: 5);
              },
              child: CircleAvatar(
                radius: 30.0,
                backgroundImage: const AssetImage("assets/images/coin.png"),
                child: Text(
                  "$value",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    SizedBox(
      height: MediaQuery.of(context).size.height * 0.75,
      child: GridView.builder(
          padding: const EdgeInsets.all(15),
          itemCount: snapshot.data["shop_items"].length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemBuilder: (contextsnapshot, index) {
            final shopList = snapshot.data["shop_items"];
            return InkWell(
              onTap: (() {
                showAlertDialog(
                  context,
                  shopList,
                  index,
                );
              }),
              child: Card(
                color: CustomColors.blueGrey,
                child: Column(
                  children: [
                    const SizedBox(height: 5),
                    // Если нужно добавить названия скинов в карточку
                    // Text(
                    //   shopList[index]['name'],
                    //   style: const TextStyle(fontWeight: FontWeight.bold),
                    // ),
                    Image.asset(
                      shopList[index]['image'],
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          shopList[index]['price'].toString(),
                          style: textStylePriceShop(),
                        ),
                        const SizedBox(width: 5),
                        Image.asset(
                          'assets/images/coin.png',
                          width: 20,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    ),
    const SizedBox(height: 10),
    AnimatedButton(
      color: CustomColors.yellowColor,
      borderColor: CustomColors.yellowColor,
      shadowColor: CustomColors.orangeColor,
      onPressed: () {
        Navigator.pushNamed(context, '/');
      },
      child: Text(
        LocaleKeys.back.tr().toUpperCase(),
        style: textStyleButton(),
      ),
    ),
  ]);
}

showAlertDialog(context, shopList, index) {
  Widget cancelButton = TextButton(
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(CustomColors.darkBlueGrey)),
    child: Text(
      LocaleKeys.cancel.tr(),
      style: buttonStyleAlertDialog(),
    ),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget okButton = TextButton(
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(CustomColors.darkBlueGrey)),
    child: Text(
      LocaleKeys.buy.tr(),
      style: buttonStyleAlertDialog(),
    ),
    onPressed: () {
      // добавить функцию  уменьшения монеток

      bloc.addToCart(shopList[index]);
      // Navigator.pushReplacementNamed(
      //   context,
      //   '/mypurchases',
      // );
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/mypurchases',
        (route) => false,
      );
    },
  );

  AlertDialog alert = AlertDialog(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(20.0),
      ),
    ),
    titlePadding: const EdgeInsets.only(left: 100, top: 10),
    actionsAlignment: MainAxisAlignment.center,
    // title: Text(
    //   shopList[index]['name'],
    // ),
    content: Wrap(children: [
      Row(
        children: [
          Image.asset(
            shopList[index]['image'],
            width: 90,
            //width: MediaQuery.of(context).size.width * 0.4,
          ),
          Text(
            shopList[index]['price'].toString(),
            style: textStyleAlertDialog(),
          ),
          const SizedBox(width: 10),
          Image.asset(
            'assets/images/coin.png',
            width: 40,
          )
        ],
      ),
    ]),
    actions: [
      okButton,
      cancelButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Theme(
          data: ThemeData(
            dialogTheme: const DialogTheme(
              backgroundColor: CustomColors.blueGrey,
            ),
          ),
          child: alert);
    },
  );
}
