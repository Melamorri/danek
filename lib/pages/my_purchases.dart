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
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Shop;
    List<Shop> shop = [];
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
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('Мои покупки'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.75,
              child: GridView.builder(
                  padding: const EdgeInsets.all(15),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemCount: shop.length + 1,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (() {}),
                      child: Card(
                        child: Column(
                          children: [
                            const SizedBox(height: 5),
                            Text(
                              arguments.name,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Image.asset(
                              arguments.id,
                              height: 50,
                            ),
                            SizedBox(
                              width: 80,
                              height: 30,
                              child: TextButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        CustomColors.blueStandartColor),
                                  ),
                                  onPressed: () {
                                    // переход на героя в новой одежде
                                  },
                                  child: const Text(
                                    'Применить',
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: CustomColors.blackColor),
                                  )),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            const SizedBox(height: 20),
            AnimatedButton(
              color: CustomColors.yellowColor,
              borderColor: CustomColors.yellowColor,
              shadowColor: CustomColors.orangeColor,
              onPressed: () {
                Navigator.pushNamed(context, '/shoppage');
              },
              child: Text(
                'НАЗАД',
                style: textStyleButton(),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
