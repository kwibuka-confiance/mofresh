import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mofresh/models/plates.dart';
import 'package:mofresh/models/products.dart';
import 'package:mofresh/utils/URL.dart';
import 'package:http/http.dart' as http;

class Products with ChangeNotifier {
  late List<BoxCategory> _boxCategory = [];

  Future<void> getMoFreshProducts() async {
    final mUrl = '${Mofresh.url2}getBoxCategory';
    try {
      final result = await http.get(Uri.parse(mUrl));
      final List<BoxCategory> loadedProducts = [];
      final extractedData = json.decode(result.body);
      for (var prod in extractedData) {
        loadedProducts.add(BoxCategory(
            id: prod['id'].toString(),
            imageUrl: Mofresh.imageUrlAPI + prod['boxMainPhoto'],
            name: prod['boxCategory'],
            description: prod['description'],
            buyPrice: prod['buyPrice'],
            rentPrice: prod['boxPrice'],
            color: const Color.fromARGB(255, 2, 92, 92)));
      }
      _boxCategory = loadedProducts;
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  List<Plate> _plateItems = [];

  ///Fetching Plates

  Future<void> getPlates() async {
    final url = '${Mofresh.url2}getPlates';
    try {
      final result = await http.get(Uri.parse(url));
      final List<Plate> loadedPlates = [];
      final extractedData = json.decode(result.body);
      for (var plateData in extractedData) {
        loadedPlates.add(Plate(
            id: plateData['id'].toString(),
            storageName: plateData['storageName'],
            plateDescription: plateData['plate_description'],
            buyPrice: plateData['buy_price'],
            rentPrice: plateData['rent_price'],
            maxTemperature: plateData['max_temperature'],
            platePicture: plateData['platePic'],
            plateType: plateData['plate_type'],
            storageCode: plateData['storageCode']));
      }
      _plateItems = loadedPlates;
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  // Managing Items

  List<BoxCategory> get categoryItems {
    return [..._boxCategory];
  }

  List<Plate> get plateItems {
    return [..._plateItems];
  }

  BoxCategory findProductBoxById(String id) {
    return _boxCategory.firstWhere((box) => box.id == id);
  }

  Plate findById(String id) {
    return _plateItems.firstWhere((plate) => plate.id == id);
  }
}
