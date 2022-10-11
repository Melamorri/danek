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
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: GridView.builder(
                      padding: const EdgeInsets.all(15),
                      itemCount: shopList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3),
                      itemBuilder: (context, index) {
                        Shop shop = shopList[index];
                        return InkWell(
                          onTap: (() {
                            showAlertDialog(context, shop, index);
                          }),
                          child: Card(
                            child: Column(
                              children: [
                                const SizedBox(height: 5),
                                Text(
                                  shop.name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                Image.asset(
                                  shop.image,
                                  height: 65,
                                ),
                                Text(
                                  shop.price,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context, Shop shop, index) {
  Widget cancelButton = TextButton(
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(CustomColors.blueColor)),
    child: const Text(
      "Отмена",
      style: TextStyle(color: CustomColors.blackColor),
    ),
    onPressed: () {
      // переход на страницу или с героем или в магазин
      Navigator.of(context).pop();
      //Navigator.pushNamed(context, '/shoppage');
    },
  );
  Widget okButton = TextButton(
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(CustomColors.blueColor)),
    child: const Text(
      "Купить",
      style: TextStyle(color: CustomColors.blackColor),
    ),
    onPressed: () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/mypurchases',
        (route) => false,
        arguments: Shop(
            id: shopList[index].image,
            image: shopList[index].image,
            name: shopList[index].name,
            price: shopList[index].price),
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
    title: Text(shop.name),
    content: Wrap(children: [
      Row(
        children: [
          const SizedBox(width: 20),
          Image.asset(shop.image, width: 100),
          const SizedBox(
            width: 20,
          ),
          Text(shop.price)
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
