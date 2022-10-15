import 'dart:async';

class Shop {
  final cartStreamController = StreamController.broadcast();

  Stream get getStream => cartStreamController.stream;

  final Map shopList = {
    'shop_items': [
      {'name': 'Меч', 'image': 'assets/images/sword.png', 'price': 20, 'id': 1},
      {
        'name': 'Брюки',
        'image': 'assets/images/pants.png',
        'price': 100,
        'id': 2
      },
      {
        'name': 'Майка',
        'image': 'assets/images/t-shirt.png',
        'price': 10,
        'id': 3
      },
      {'name': 'Шляпа', 'image': 'assets/images/hat.png', 'price': 90, 'id': 4},
      {
        'name': 'Пальто',
        'image': 'assets/images/coat.png',
        'price': 20,
        'id': 5
      },
      {
        'name': 'Костюм',
        'image': 'assets/images/dress_kolpak.png',
        'price': 120,
        'id': 6
      },
      {
        'name': 'Платье',
        'image': 'assets/images/dress.png',
        'price': 60,
        'id': 7
      },
      {
        'name': 'Шлапа',
        'image': 'assets/images/kolpak.png',
        'price': 10,
        'id': 8
      },
    ],
    'my_items': [],
    'items_id': []
  };

  void addToCart(item) {
    shopList['my_items'].add(item);
  }

  void addToListId(item) {
    shopList['items_id'].add(item);
  }
}

final bloc = Shop();
