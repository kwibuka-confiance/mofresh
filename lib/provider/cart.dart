import 'package:flutter/material.dart';

class CartItem { 
  final String id;
  final String title;
  final int quantity;
  final imageUrl;
  final double price;

  CartItem(
      {required this.id,
      required this.title,
      required this.quantity,
      required this.imageUrl,
      required this.price});
}

class Cart with ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemsCount {
    // ignore: unnecessary_null_comparison
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(String prodId, double price, String title, imgUrl) {
    if (_items.containsKey(prodId)) {
      //
      _items.update(
          prodId,
          (exixtingCartItem) => CartItem(
              id: prodId,
              title: title,
              quantity: exixtingCartItem.quantity + 1,
              imageUrl: imgUrl,
              price: price));
    } else {
      _items.putIfAbsent(
          prodId,
          () => CartItem(
              id: DateTime.now().toString(),
              title: title,
              quantity: 1,
              imageUrl: imgUrl,
              price: price));
    }
    notifyListeners();
  }
}
