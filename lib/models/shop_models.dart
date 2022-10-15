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
