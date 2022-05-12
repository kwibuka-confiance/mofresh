import 'package:flutter/material.dart';
import 'package:mofresh/models/plates.dart';
import 'package:mofresh/models/products.dart';

class Products with ChangeNotifier {
  final List<MoFreshProduct> _items = [
    MoFreshProduct(
        id: '1',
        districtName: "Gasabo",
        mainPhoto:
            "https://kivu.mofresh.rw/img/mS3zTr8t1xNqjXLfanoqAh9mGVFu9otwWmorhVnn.jpg",
        provinceName: "Kigali",
        sectorName: "Kinyinya",
        storageName: "MO CONTAINER",
        storageOverview:
            "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitiamolestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit tenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitiamolestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit tenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,",
        color: const Color.fromARGB(255, 0, 86, 216),
        moreProducts: []),
    MoFreshProduct(
        id: '2',
        districtName: "Gasabo",
        mainPhoto:
            "https://kivu.mofresh.rw/box/qWMekFYf2WqSq42PAhhQPYB8hkRe3JyCaCkLrKYG.jpg",
        provinceName: "Kigali",
        sectorName: "Kinyinya",
        storageName: "MO BOX",
        storageOverview:
            "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitiamolestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit tenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitiamolestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit tenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,",
        color: Color.fromARGB(255, 0, 88, 15),
        moreProducts: []),
    MoFreshProduct(
        id: '3',
        districtName: "Gasabo",
        mainPhoto:
            "https://kivu.mofresh.rw/img/mS3zTr8t1xNqjXLfanoqAh9mGVFu9otwWmorhVnn.jpg",
        provinceName: "Kigali",
        sectorName: "Kinyinya",
        storageName: "MO FRIDGE",
        storageOverview:
            "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitiamolestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit tenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitiamolestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit tenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,",
        color: Color.fromARGB(255, 2, 92, 92),
        moreProducts: []),
    MoFreshProduct(
        id: '4',
        districtName: "Gasabo",
        mainPhoto:
            "https://kivu.mofresh.rw/box/qWMekFYf2WqSq42PAhhQPYB8hkRe3JyCaCkLrKYG.jpg",
        provinceName: "Kigali",
        sectorName: "Kinyinya",
        storageName: "MO PLATE",
        storageOverview:
            "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitiamolestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit tenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitiamolestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit tenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,",
        color: const Color.fromARGB(255, 243, 33, 243),
        moreProducts: []),
  ];

  final List<Plate> _plateItems = [
    Plate(
        id: "1",
        storageName: "Plate 1",
        plateDescription:
            "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum",
        buyPrice: "50,000 RWF",
        rentPrice: "5000 RWF",
        maxTemperature: "-35",
        platePicture: "img/dX11CLnQ7VCdKRo8iM3FA63rpfcMNaCSIWd0RGrj.png",
        plateType: "Blue",
        storageCode: "CS-620FBDDCC5F6E"),
    Plate(
        id: "2",
        storageName: "Plate 2",
        plateDescription:
            "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum",
        buyPrice: "50,000 RWF",
        rentPrice: "5000 RWF",
        maxTemperature: "-45",
        platePicture: "img/8QbBvezD3ByHrDsBqaWPgKspXDKmWOIDdMWbvn9t.png",
        plateType: "Blue",
        storageCode: "CS-620FBDDCC5F6E"),
    Plate(
        id: "3",
        storageName: "Plate 3",
        plateDescription:
            "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum",
        buyPrice: "50,000 RWF",
        rentPrice: "5000 RWF",
        maxTemperature: "-55",
        platePicture: "img/5CX5lpBayfDZzvkkLxYMYgyjf79dPc8zkJSjwlIi.png",
        plateType: "Blue",
        storageCode: "CS-620FBDDCC5F6E")
  ];

  // Managing Items

  List<Plate> get plateItems {
    return [..._plateItems];
  }

  List<MoFreshProduct> get items {
    return [..._items];
  }

  Plate findById(String id) {
    return _plateItems.firstWhere((plate) => plate.id == id);
  }
}
