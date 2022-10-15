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
import 'package:danek/helpers/user_preferences.dart';

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

  upgradeMyItems() {
    setState(() {
      myPurchases;
      print('upg + $myPurchases');
    });
  }

  Future addPurchase(myPurchase) async {
    await UserPreferences().setMyPurchases(myPurchase);
  }

  @override
  void initState() {
    super.initState();
    myPurchases = UserPreferences().getMyPurchases() ?? [];
    print('init + $myPurchases');
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
                    upgradeMyItems, addPurchase);
              },
            ),
          ),
        ),
      ),
    );
  }
}

Widget shopItemsListBuilder(
    snapshot, context, myPurchases, upgradeMyItems, addPurchase) {
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
                  "$coins",
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
                  myPurchases,
                  upgradeMyItems,
                  addPurchase,
                  formLaunch,
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

showAlertDialog(context, shopList, index, myPurchases, upgradeMyItems,
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
      LocaleKeys.buy.tr(),
      style: buttonStyleAlertDialog(),
    ),
    onPressed: () {
      if (shopList[index]['price'] <= coins) {
        // bloc.addToCart(shopList[index]);
        myPurchases.add(shopList[index].toString());
        upgradeMyItems();
        print("onpre + $myPurchases");
        addPurchase(myPurchases);
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
        int price = shopList[index]['price'];
        coins = coins - price;
      } else {
        //добавить оповещение, что монет мало?
      }
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
  AlertDialog noAlert = AlertDialog(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(20.0),
      ),
    ),
    titleTextStyle: textStyleNoAlertDialog(),
    actionsAlignment: MainAxisAlignment.center,
    title: const Text(
      'Начинай играть!',
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
  AlertDialog alert5 =
      AlertDialog(content: Center(child: Text("Second Alert Dialog")));

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  content: StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                    return Text('kjc kxdjfv');
                  }),
                ));
      },
      child: null,
    );
  }

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
