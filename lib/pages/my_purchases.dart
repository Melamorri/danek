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
        body: SingleChildScrollView(
          child: StreamBuilder(
            stream: bloc.getStream,
            initialData: bloc.shopList,
            builder: (context, snapshot) {
              return snapshot.data['my_items'].length > 0
                  ? Column(
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
                          height: MediaQuery.of(context).size.height * 0.22,
                          child: checkoutListBuildertwo(snapshot, context),
                        ),
                        Image.asset(
                          'assets/images/girl1.png',
                          height: MediaQuery.of(context).size.height * 0.55,
                        ),
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
                                // герой в новой одежде переходит на свою страницу
                                Navigator.pushNamed(context, '/heropage');
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
                          Stack(
                            children: [
                              Text("Ничего нет", style: stackTextStyle_1()),
                              Text("Ничего нет", style: stackTextStyle_2()),
                            ],
                          ),
                          const SizedBox(height: 50),
                          Image.asset(
                            'assets/images/smile.png',
                            width: 160,
                          ),
                          const SizedBox(height: 70),
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

Widget checkoutListBuildertwo(snapshot, context) {
  return SizedBox(
    //height: MediaQuery.of(context).size.height * 0.25,
    child: ListView.separated(
        padding: const EdgeInsets.all(15),
        scrollDirection: Axis.horizontal,
        itemCount: snapshot.data["my_items"].length,
        separatorBuilder: (context, index) => const SizedBox(width: 5),
        itemBuilder: (context, index) {
          final cartList = snapshot.data["my_items"];
          return SizedBox(
            width: MediaQuery.of(context).size.width * 0.28,
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
                    Image.asset(
                      cartList[index]['image'],
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
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
