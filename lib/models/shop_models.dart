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
    shopList['shop_items'].remove(item);
    cartStreamController.sink.add(shopList);
    // if (shopList['my_items']['id'].toString() ==
    //     shopList['shop_items']['id'].toString()) {
    //   print('есть');
    // }
  }

  void addToListId(item) {
    shopList['items_id'].add(item);
  }

  void dispose() {
    cartStreamController.close(); // close our StreamController
  }

  void compare(item) {
    if (!shopList['my_items']['id'].toString().contains(item)) {
      shopList['shop_items']['id'].add();
      print('Добавили');
    } else {
      print('Уже есть');
    }
  }

  List filterList(List list, {bool removeAllOccurrences = false}) {
    final List my_items = [];
    final List shop_items = [];

    return shop_items;
  }

  // _mapEquals(Map<String, int> map1, Map<String, int> map2) {
  //   if (map1.keys.length != map2.keys.length) return false;

  //   for (String k in map1.keys) {
  //     if (!map2.containsKey(k)) return false;
  //     if (map1[k] != map2[k]) return false;
  //     print('Добавили');
  //   }

  //   return true;
  // }
}

final bloc = Shop();
