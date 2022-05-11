import 'package:flutter/material.dart';
import 'package:mofresh/models/coldBox.dart';

class Products with ChangeNotifier {
 final List<Box> _items =   [
  Box(
      id: '1',
      mainPhoto:
          "https://kivu.mofresh.rw/img/mS3zTr8t1xNqjXLfanoqAh9mGVFu9otwWmorhVnn.jpg",
      storageName: 'MoFresh Box',
      description: 'In publishing and graphic design, Lorem ipsum is a real '),
  Box(
      id: '2',
      mainPhoto:
          "https://kivu.mofresh.rw/box/qWMekFYf2WqSq42PAhhQPYB8hkRe3JyCaCkLrKYG.jpg",
      storageName: 'MoFresh Box',
      description: 'In publishing and graphic design, Lorem ipsum is a real '),
  Box(
      id: '3',
      mainPhoto:
          "https://kivu.mofresh.rw/img/mS3zTr8t1xNqjXLfanoqAh9mGVFu9otwWmorhVnn.jpg",
      storageName: 'MoFresh Box',
      description: 'In publishing and graphic design, Lorem ipsum is a '),
  Box(
      id: '4',
      mainPhoto:
          "https://kivu.mofresh.rw/box/qWMekFYf2WqSq42PAhhQPYB8hkRe3JyCaCkLrKYG.jpg",
      storageName: 'MoFresh Box',
      description: 'In publishing and graphic design, Lorem ipsum is a '),
]; 

  List<Box> get items {
    return [..._items];
  }

  void displayProducts() {
    notifyListeners();
  }
}
