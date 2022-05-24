import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mofresh/models/coldBox.dart';
import 'package:mofresh/models/plates.dart';
import 'package:mofresh/models/products.dart';
import 'package:mofresh/utils/URL.dart';
import 'package:mofresh/utils/colors/colorswitch.dart';
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

  List<Plate> _plateItems = [
    // Plate(
    //     id: "1",
    //     storageName: "Plate 1",
    //     plateDescription:
    //         "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitiamolestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit tenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitiamolestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit tenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit ",
    //     buyPrice: "50000",
    //     rentPrice: "5000",
    //     maxTemperature: "-35",
    //     platePicture: "img/dX11CLnQ7VCdKRo8iM3FA63rpfcMNaCSIWd0RGrj.png",
    //     plateType: "Blue",
    //     storageCode: "CS-620FBDDCC5F6E"),
    // Plate(
    //     id: "2",
    //     storageName: "Plate 2",
    //     plateDescription:
    //         "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitiamolestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit tenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitiamolestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit tenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit ",
    //     buyPrice: "55000",
    //     rentPrice: "5500",
    //     maxTemperature: "-45",
    //     platePicture: "img/8QbBvezD3ByHrDsBqaWPgKspXDKmWOIDdMWbvn9t.png",
    //     plateType: "Blue",
    //     storageCode: "CS-620FBDDCC5F6E"),
    // Plate(
    //     id: "3",
    //     storageName: "Plate 3",
    //     plateDescription:
    //         "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitiamolestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit tenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitiamolestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit tenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit ",
    //     buyPrice: "70000",
    //     rentPrice: "6400",
    //     maxTemperature: "-55",
    //     platePicture: "img/5CX5lpBayfDZzvkkLxYMYgyjf79dPc8zkJSjwlIi.png",
    //     plateType: "Blue",
    //     storageCode: "CS-620FBDDCC5F6E")
  ];

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
