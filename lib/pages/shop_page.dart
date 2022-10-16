import 'package:danek/generated/locale_keys.g.dart';
import 'package:danek/helpers/colors.dart';
import 'package:danek/helpers/user_preferences.dart';
import 'package:danek/models/activity_list.dart';
import 'package:danek/models/animation_button.dart';
import 'package:danek/models/models.dart';
import 'package:danek/models/shop_models.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<StatefulWidget> createState() => _ShopPageState();
}

@override
State<ShopPage> createState() => _ShopPageState();
bool? formLaunch;

class _ShopPageState extends State<ShopPage> {
  List<String> myPurchases = [];
  var myCoins = 0;
  upgradeMyItems() {
    setState(() {
      myPurchases;
      myCoins;
    });
  }

  Future addPurchase(myPurchase, myCoins) async {
    await UserPreferences().setMyPurchases(myPurchase);
    await UserPreferences().setCoins(myCoins);
  }

  @override
  void initState() {
    super.initState();
    myPurchases = UserPreferences().getMyPurchases() ?? [];
    myCoins = UserPreferences().getCoins() ?? 0;
    formLaunch = UserPreferences().getFormLaunch() ?? false;
  }

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
                return shopItemsListBuilder(snapshot, context, myPurchases,
                    myCoins, upgradeMyItems, addPurchase);
              },
            ),
          ),
        ),
      ),
    );
  }
}

Widget shopItemsListBuilder(
    snapshot, context, myPurchases, myCoins, upgradeMyItems, addPurchase) {
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
                Text(LocaleKeys.shop.tr().toUpperCase(),
                    style: stackTextStyle_1()),
                Text(LocaleKeys.shop.tr().toUpperCase(),
                    style: stackTextStyle_2()),
              ],
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.2),
            InkWell(
              enableFeedback: false,
              onTap: () {
                FlameAudio.play('zvukmonet.wav', volume: 5);
              },
              child: CircleAvatar(
                radius: 30.0,
                backgroundImage: const AssetImage("assets/images/coin.png"),
                child: Text(
                  // "$coin",
                  "$myCoins",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    // Список элементов магазина
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
              // если монет не достаточно
              onTap: (() {
                (formLaunch == true) & (myCoins < shopList[index]['price'])
                    ? showAlertDialog2(context, formLaunch)
                    : showAlertDialog(context, shopList, index, myPurchases,
                        myCoins, upgradeMyItems, addPurchase, formLaunch);
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
        (formLaunch == true)
            ? Navigator.pushNamed(context, '/heropage')
            : Navigator.pushNamed(context, '/');
      },
      child: Text(
        LocaleKeys.back.tr().toUpperCase(),
        style: textStyleButton(),
      ),
    ),
  ]);
}

// Всплывающее окно "монет не достаточно"
showAlertDialog2(context, formLaunch) {
  Widget playButton = TextButton(
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(CustomColors.darkBlueGrey)),
    child: Text(
      LocaleKeys.play.tr(),
      style: buttonStyleAlertDialog(),
    ),
    onPressed: () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/heropage',
        (route) => false,
      );
    },
  );
  AlertDialog noCachAlert = AlertDialog(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(20.0),
      ),
    ),
    titleTextStyle: textStyleNoAlertDialog(),
    actionsAlignment: MainAxisAlignment.center,
    title: Text(
      LocaleKeys.nomoney.tr(),
      textAlign: TextAlign.center,
    ),
    content: Wrap(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/smile_hello.png',
            width: 140,
            //width: MediaQuery.of(context).size.width * 0.4,
          ),
          const SizedBox(width: 10),
        ],
      ),
    ]),
    actions: [
      playButton,
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
        child: noCachAlert,
      );
    },
  );
}

// Всплывающее окно купить/отмена
showAlertDialog(context, shopList, index, myPurchases, myCoins, upgradeMyItems,
    addPurchase, formLaunch) {
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
      // (myCoins < shopList[index]['price'])
      //     ? 'Монет не достаточно'
      //     :
      LocaleKeys.buy.tr(),
      style: buttonStyleAlertDialog(),
    ),
    onPressed: () {
      // if (shopList[index]['price'] <= coin) {
      if (shopList[index]['price'] <= myCoins) {
        int price = shopList[index]['price'];
        myCoins = myCoins - price;
        myPurchases.add(shopList[index].toString());
        upgradeMyItems();
        addPurchase(myPurchases, myCoins);

        // var re = bloc.shopList['my_items'];
        // print(re);
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
      } else {}
    },
  );

  Widget noButton = TextButton(
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(CustomColors.darkBlueGrey)),
    child: Text(
      LocaleKeys.play.tr(),
      style: buttonStyleAlertDialog(),
    ),
    onPressed: () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/formpage',
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            shopList[index]['image'],
            width: 100,
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

  //Если попал в магазин не рарегистрированный "Начинай играть!"
  AlertDialog noAlert = AlertDialog(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(20.0),
      ),
    ),
    titleTextStyle: textStyleNoAlertDialog(),
    actionsAlignment: MainAxisAlignment.center,
    title: Text(
      LocaleKeys.lets_play.tr(),
      textAlign: TextAlign.center,
    ),
    content: Wrap(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/smile_hello.png',
            width: 140,
            //width: MediaQuery.of(context).size.width * 0.4,
          ),
          const SizedBox(width: 10),
        ],
      ),
    ]),
    actions: [
      noButton,
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
        child: formLaunch ? alert : noAlert,
      );
    },
  );
}
