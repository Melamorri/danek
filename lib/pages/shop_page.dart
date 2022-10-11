import 'package:danek/generated/locale_keys.g.dart';
import 'package:danek/helpers/colors.dart';
import 'package:danek/models/animation_button.dart';
import 'package:danek/models/models.dart';
import 'package:danek/models/shop_models.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              'assets/images/menubackground.png',
            ),
          ),
        ),
        child: Scaffold(
          // appBar: AppBar(
          //   title: Text('Магазин'),
          //   centerTitle: true,
          // ),
          backgroundColor: Colors.transparent,
          body: StreamBuilder(
            initialData: bloc.shopList,
            stream: bloc.getStream,
            builder: (context, snapshot) {
              return shopItemsListBuilder(snapshot, context);
            },
          ),
        ),
      ),
    );
  }
}

Widget shopItemsListBuilder(snapshot, context) {
  return Column(children: [
    const SizedBox(height: 30),
    SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: GridView.builder(
          padding: const EdgeInsets.all(15),
          itemCount: snapshot.data["shop_items"].length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemBuilder: (contextsnapshot, index) {
            final shopList = snapshot.data["shop_items"];
            return InkWell(
              onTap: (() {
                showAlertDialog(context, shopList, index);
              }),
              child: Card(
                child: Column(
                  children: [
                    const SizedBox(height: 5),
                    Text(
                      shopList[index]['name'],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Image.asset(
                      shopList[index]['image'],
                      height: 65,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          shopList[index]['price'],
                          style: const TextStyle(fontWeight: FontWeight.bold),
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
        LocaleKeys.menu.tr().toUpperCase(),
        style: textStyleButton(),
      ),
    ),
  ]);
}

showAlertDialog(context, shopList, index) {
  Widget cancelButton = TextButton(
    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue)),
    child: const Text(
      "Отмена",
      style: TextStyle(color: Colors.black),
    ),
    onPressed: () {
      // переход на страницу или с героем или в магазин
      Navigator.of(context).pop();
      //Navigator.pushNamed(context, '/shoppage');
    },
  );
  Widget okButton = TextButton(
    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue)),
    child: const Text(
      "Купить",
      style: TextStyle(color: Colors.black),
    ),
    onPressed: () {
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
    title: Text(
      shopList[index]['name'],
    ),
    content: Wrap(children: [
      Row(
        children: [
          const SizedBox(width: 20),
          Image.asset(shopList[index]['image'], width: 100),
          const SizedBox(
            width: 20,
          ),
          Text(shopList[index]['price']),
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
              //dialogTheme: DialogTheme(backgroundColor: CustomColors.whiteColor),
              ),
          child: alert);
    },
  );
}
