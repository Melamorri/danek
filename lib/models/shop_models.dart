import 'dart:async';

import 'package:danek/pages/choose_heroes.dart';

class Shop {
  final cartStreamController = StreamController.broadcast();

  Stream get getStream => cartStreamController.stream;

  final Map shopList = {
    'shop_items': [
      {
        'name': 'Меч',
        'image': 'assets/images/sword.png',
        'price': 20,
        'id': 1,
        'genre': 'Bird'
      },
      {
        'name': 'Брюки',
        'image': 'assets/images/pants.png',
        'price': 100,
        'id': 2,
        'genre': 'Deniz'
      },
      {
        'name': 'Майка',
        'image': 'assets/images/t-shirt.png',
        'price': 70,
        'id': 3,
        'genre': 'Deniz'
      },
      {
        'name': 'Шляпа',
        'image': 'assets/images/hat.png',
        'price': 90,
        'id': 4,
        'genre': 'Leo'
      },
      {
        'name': 'Пальто',
        'image': 'assets/images/coat.png',
        'price': 250,
        'id': 5,
        'genre': 'Deniz'
      },
      {
        'name': 'Костюм',
        'image': 'assets/images/dress_kolpak.png',
        'price': 170,
        'id': 6,
        'genre': 'Danaya'
      },
      {
        'name': 'Платье',
        'image': 'assets/images/dress.png',
        'price': 120,
        'id': 7,
        'genre': 'Danaya'
      },
      {
        'name': 'Шлапа',
        'image': 'assets/images/kolpak.png',
        'price': 50,
        'id': 8,
        'genre': 'Danaya'
      },
      {
        'name': 'Костюм',
        'image': 'assets/images/dress_kolpak_2.png',
        'price': 150,
        'id': 9,
        'genre': 'Danaya'
      },
      {
        'name': 'Платье',
        'image': 'assets/images/dress_2.png',
        'price': 100,
        'id': 10,
        'genre': 'Danaya'
      },
      {
        'name': 'Шлапа',
        'image': 'assets/images/kolpak_2.png',
        'price': 50,
        'id': 11,
        'genre': 'Danaya'
      },
      {
        'name': 'Соник',
        'image': 'assets/images/sonik.png',
        'price': 400,
        'id': 12,
        'genre': 'Bird'
      },
      {
        'name': 'Человек-паук',
        'image': 'assets/images/spider.png',
        'price': 600,
        'id': 13,
        'genre': 'Danaya'
      },
      {
        'name': 'Доктор Стрэндж',
        'image': 'assets/images/dr_strange.png',
        'price': 500,
        'id': 14,
        'genre': 'Bird'
      },
    ],
    'my_items': [],
    'items_id': []
  };

  // void addToCart(item) {
  //   shopList['my_items'].add(item);
  //   shopList['shop_items'].remove(item);
  //   cartStreamController.sink.add(shopList);
  // }

  // void dispose() {
  //   cartStreamController.close(); // close our StreamController
  // }

}

final bloc = Shop();
