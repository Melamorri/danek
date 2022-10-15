import 'package:danek/generated/locale_keys.g.dart';
import 'package:danek/helpers/colors.dart';
import 'package:danek/helpers/StringToObject.dart';
import 'package:danek/helpers/user_preferences.dart';
import 'package:danek/models/animation_button.dart';
import 'package:danek/models/models.dart';
import 'package:danek/models/shop_models.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class MyPurchases extends StatefulWidget {
  const MyPurchases({super.key});

  @override
  State<MyPurchases> createState() => _MyPurchasesState();
}

class _MyPurchasesState extends State<MyPurchases> {
  List myPurchase = [];
  String heroImage = '';
  Future addPurchase(myPurchase) async {
    await UserPreferences().setMyPurchases(myPurchase);
  }

  deleteInfo() async {
    await UserPreferences().deleteMyPurcahses();
  }

  @override
  void initState() {
    super.initState();
    myPurchase = UserPreferences().getMyPurchases() ?? [];
    heroImage = UserPreferences().getHero() ?? '';
  }

  @override
  build(BuildContext context) {
    return SafeArea(
        child: Container(
      // height: MediaQuery.of(context).size.height,
      // width: MediaQuery.of(context).size.width,
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
        body: StreamBuilder(
          stream: bloc.getStream,
          initialData: myPurchase,
          builder: (context, snapshot) {
            return myPurchase.isNotEmpty
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Stack(
                            children: <Widget>[
                              Text('Мои покупки', style: stackTextStyle_1()),
                              Text('Мои покупки', style: stackTextStyle_2())
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 145,
                          //height: MediaQuery.of(context).size.height * 0.2,
                          child: checkoutListBuildertwo(
                              snapshot, context, myPurchase),
                        ),
                        Image.asset(
                          heroImage,
                          height: MediaQuery.of(context).size.height * 0.55,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
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
                                  // герой в новой одежде переходит на свою страницу
                                  Navigator.pushNamed(context, '/heropage');
                                },
                                child: Text(
                                  LocaleKeys.play.tr().toUpperCase(),
                                  style: textStyleButton(),
                                ),
                              ),
                              //техническа кнопка для обнуления магазина
                              IconButton(
                                  onPressed: () {
                                    deleteInfo();
                                    setState(() {
                                      myPurchase = [];
                                    });
                                  },
                                  icon: const Icon(Icons.cancel)),
                            ],
                          ),
                        ),
                        //const SizedBox(height: 40)
                      ],
                    ),
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Text("Ничего нет", style: stackTextStyle_1()),
                            Text("Ничего нет", style: stackTextStyle_2()),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                        Image.asset(
                          'assets/images/smile.png',
                          width: 160,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1),
                        AnimatedButton(
                          color: CustomColors.yellowColor,
                          borderColor: CustomColors.yellowColor,
                          shadowColor: CustomColors.orangeColor,
                          onPressed: () {
                            Navigator.pushNamed(context, '/heropage');
                          },
                          child: Text(
                            LocaleKeys.back.tr().toUpperCase(),
                            style: textStyleButton(),
                          ),
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
// Построение списка покупок без героя

// Widget checkoutListBuilder(snapshot, context) {
//   return SizedBox(
//     height: MediaQuery.of(context).size.height * 0.75,
//     child: GridView.builder(
//         padding: const EdgeInsets.all(15),
//         gridDelegate:
//             const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
//         itemCount: snapshot.data["my_items"].length,
//         itemBuilder: (context, index) {
//           final cartList = snapshot.data["my_items"];
//           return InkWell(
//             onTap: (() {}),
//             child: Card(
//               color: CustomColors.blueGrey,
//               child: Column(
//                 children: [
//                   const SizedBox(height: 5),
//                   // Text(
//                   //   cartList[index]['name'],
//                   //   style: const TextStyle(fontWeight: FontWeight.bold),
//                   // ),
//                   Image.asset(
//                     cartList[index]['image'],
//                     height: MediaQuery.of(context).size.height * 0.1,
//                   ),
//                   InkWell(
//                     onTap: () {
//                       Navigator.pushNamed(context, '/gamepage');
//                     },
//                     child: Text(
//                       'Выбрать',
//                       style: buttonStyleMyPurchases(),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         }),
//   );
// }

Widget checkoutListBuildertwo(snapshot, context, myPurchase) {
  return SizedBox(
    child: ListView.separated(
        padding: const EdgeInsets.all(15),
        scrollDirection: Axis.horizontal,
        itemCount: myPurchase.length,
        separatorBuilder: (context, index) => const SizedBox(width: 5),
        itemBuilder: (context, index) {
          String myPurchaseString = myPurchase.elementAt(index);
          var myPurchaseMap = StringToObject(myPurchaseString);
          return SizedBox(
            width: 110,
            child: InkWell(
              onTap: (() {
                // примерка новой одежды
                Navigator.pushNamed(context, '/heropage');
              }),
              child: Card(
                color: CustomColors.blueGrey,
                child: Column(
                  children: [
                    const SizedBox(height: 5),
                    // Text(
                    //   cartList[index]['name'],
                    //   style: const TextStyle(fontWeight: FontWeight.bold),
                    // ),
                    Image.asset(myPurchaseMap['image'], height: 70),
                    Text(
                      'Выбрать',
                      style: buttonStyleMyPurchases(),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
  );
}
