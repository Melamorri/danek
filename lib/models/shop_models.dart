/// The [dart:async] is neccessary for using streams
import 'dart:async';

class Shop {
  /// The [cartStreamController] is an object of the StreamController class
  /// .broadcast enables the stream to be read in multiple screens of our app
  final cartStreamController = StreamController.broadcast();

  /// The [getStream] getter would be used to expose our stream to other classes
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
    //shopList['shop items'].remove(item);
    shopList['my_items'].add(item);
    //cartStreamController.sink.add(shopList);
  }

  // void removeFromCart(item) {
  //   shopList['cart items'].remove(item);
  //   shopList['shop items'].add(item);
  //   cartStreamController.sink.add(shopList);
  // }

  /// The [dispose] method is used
  /// to automatically close the stream when the widget is removed from the widget tree
  // void dispose() {
  //   cartStreamController.close(); // close our StreamController
  // }
}

final bloc = Shop();
