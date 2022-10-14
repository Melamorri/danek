import 'dart:async';

class Shop {
  final cartStreamController = StreamController.broadcast();

  Stream get getStream => cartStreamController.stream;

  final Map shopList = {
    'shop_items': [
      {
        'name': 'Юбка',
        'image': 'assets/images/ubka.png',
        'price': '20',
        'id': 1
      },
      {
        'name': 'Юбка',
        'image': 'assets/images/ubka_2.png',
        'price': '100',
        'id': 2
      },
      {
        'name': 'Колпак',
        'image': 'assets/images/kolpak.png',
        'price': '10',
        'id': 3
      },
      {
        'name': 'Шляпа',
        'image': 'assets/images/hat.png',
        'price': '90',
        'id': 4
      },
      {
        'name': 'Юбка',
        'image': 'assets/images/ubka.png',
        'price': '20',
        'id': 5
      },
      {
        'name': 'Юбка',
        'image': 'assets/images/ubka_2.png',
        'price': '100',
        'id': 6
      },
      {
        'name': 'Колпак',
        'image': 'assets/images/kolpak.png',
        'price': '10',
        'id': 7
      },
      {
        'name': 'Шляпа',
        'image': 'assets/images/hat.png',
        'price': '90',
        'id': 8
      },
      {
        'name': 'Юбка',
        'image': 'assets/images/ubka.png',
        'price': '20',
        'id': 9
      },
      {
        'name': 'Юбка',
        'image': 'assets/images/ubka_2.png',
        'price': '100',
        'id': 10
      },
      {
        'name': 'Колпак',
        'image': 'assets/images/kolpak.png',
        'price': '10',
        'id': 11
      },
      {
        'name': 'Шляпа',
        'image': 'assets/images/hat.png',
        'price': '90',
        'id': 12
      },
      {
        'name': 'Юбка',
        'image': 'assets/images/ubka.png',
        'price': '20',
        'id': 13
      },
      {
        'name': 'Юбка',
        'image': 'assets/images/ubka_2.png',
        'price': '100',
        'id': 14
      },
      {
        'name': 'Колпак',
        'image': 'assets/images/kolpak.png',
        'price': '10',
        'id': 15
      },
      {
        'name': 'Шляпа',
        'image': 'assets/images/hat.png',
        'price': '90',
        'id': 16
      },
    ],
    'my_items': []
  };

  void addToCart(item) {
    shopList['my_items'].add(item);
  }
}

final bloc = Shop();
