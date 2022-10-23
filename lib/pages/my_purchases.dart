import 'package:danek/generated/locale_keys.g.dart';
import 'package:danek/helpers/colors.dart';
import 'package:danek/helpers/StringToObject.dart';
import 'package:danek/helpers/user_preferences.dart';
import 'package:danek/models/animation_button.dart';
import 'package:danek/models/style.dart';
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

  @override
  void initState() {
    super.initState();
    myPurchase = UserPreferences().getMyPurchases() ?? [];
    heroImage = UserPreferences().getHero() ?? '';
    print(myPurchase);
    print(bloc.getStream);
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
                              Text(LocaleKeys.my_purchases.tr(),
                                  style: stackTextStyle_1()),
                              Text(LocaleKeys.my_purchases.tr(),
                                  style: stackTextStyle_2())
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 145,
                          //height: MediaQuery.of(context).size.height * 0.2,
                          child: checkoutListBuildertwo(
                              snapshot, context, myPurchase),
                        ),
                        DragTarget(
                          builder: (BuildContext context,
                              List<Object?> candidateData,
                              List<dynamic> rejectedData) {
                            return Image.asset(
                              heroImage,
                              height: MediaQuery.of(context).size.height * 0.55,
                            );
                          },
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
                                  LocaleKeys.shop.tr().toUpperCase(),
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
                            Text(LocaleKeys.empty.tr(),
                                style: stackTextStyle_1()),
                            Text(LocaleKeys.empty.tr(),
                                style: stackTextStyle_2()),
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
                            Navigator.pushNamed(context, '/shoppage');
                          },
                          child: Text(
                            LocaleKeys.shop.tr().toUpperCase(),
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
          return Column(
            children: [
              SizedBox(
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
                        Column(
                          children: [
                            Draggable(
                              feedback: Image.asset(myPurchaseMap['image'],
                                  height: 130),
                              child: Image.asset(myPurchaseMap['image'],
                                  height: 70),
                            ),
                          ],
                        ),
                        Text(
                          LocaleKeys.select.tr(),
                          style: buttonStyleMyPurchases(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
  );
}
