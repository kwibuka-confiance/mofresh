import 'package:flutter/material.dart';
import 'package:mofresh/models/products.dart';

class Products with ChangeNotifier {
  final List<MoFreshProduct> _items = [
    MoFreshProduct(id: '1', districtName: "Gasabo", mainPhoto:  "https://kivu.mofresh.rw/img/mS3zTr8t1xNqjXLfanoqAh9mGVFu9otwWmorhVnn.jpg", provinceName: "Kigali", sectorName: "Kinyinya", storageName: "MO CONTAINER", storageOverview: "In publishing and graphic design, Lorem ipsum is a real", color: const Color.fromARGB(255, 0, 86, 216)),
    MoFreshProduct(id: '2', districtName: "Gasabo", mainPhoto:  "https://kivu.mofresh.rw/box/qWMekFYf2WqSq42PAhhQPYB8hkRe3JyCaCkLrKYG.jpg", provinceName: "Kigali", sectorName: "Kinyinya", storageName: "MO BOX", storageOverview: "In publishing and graphic design, Lorem ipsum is a real", color: Color.fromARGB(255, 0, 88, 15)),
    MoFreshProduct(id: '3', districtName: "Gasabo", mainPhoto:  "https://kivu.mofresh.rw/img/mS3zTr8t1xNqjXLfanoqAh9mGVFu9otwWmorhVnn.jpg", provinceName: "Kigali", sectorName: "Kinyinya", storageName: "MO FRIDGE", storageOverview: "In publishing and graphic design, Lorem ipsum is a real", color: Color.fromARGB(255, 2, 92, 92)),
    MoFreshProduct(id: '4', districtName: "Gasabo", mainPhoto:  "https://kivu.mofresh.rw/box/qWMekFYf2WqSq42PAhhQPYB8hkRe3JyCaCkLrKYG.jpg", provinceName: "Kigali", sectorName: "Kinyinya", storageName: "MO PLATE", storageOverview: "In publishing and graphic design, Lorem ipsum is a real", color: const Color.fromARGB(255, 243, 33, 243)),
    
  ];

  List<MoFreshProduct> get items {
    return [..._items];
  }

  void displayProducts() {
    notifyListeners();
  }
}
