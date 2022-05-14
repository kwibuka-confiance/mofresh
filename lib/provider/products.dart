import 'package:flutter/material.dart';
import 'package:mofresh/models/coldBox.dart';
import 'package:mofresh/models/plates.dart';
import 'package:mofresh/models/products.dart';
import 'package:mofresh/utils/URL.dart';

class Products with ChangeNotifier {
  final List<MoFreshProduct> _items = [
    MoFreshProduct(
        id: '1',
        boxCategory: "Fridge",
        boxMainPhoto:
            "https://kivu.mofresh.rw/img/mS3zTr8t1xNqjXLfanoqAh9mGVFu9otwWmorhVnn.jpg",
        buyPrice: "50000",
        rentPrice: "3000",
    
        description:
            "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitiamolestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit tenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitiamolestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit tenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,",
        ),
    MoFreshProduct(
        id: '2',
        boxCategory: "Container",
        boxMainPhoto:
            "https://kivu.mofresh.rw/box/qWMekFYf2WqSq42PAhhQPYB8hkRe3JyCaCkLrKYG.jpg",
        buyPrice: "39000",
        rentPrice: "2900",
        description:
            "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitiamolestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit tenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitiamolestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit tenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,",
       ),
    MoFreshProduct(
        id: '3',
        boxCategory: "Box",
        boxMainPhoto:
            "https://kivu.mofresh.rw/img/73xtsZIh7o5lHE5JoVlm8o0kZt2gV7zcM3tC6OOC.jpg",
        buyPrice: "23000",
        rentPrice: "2300",
       
        description:
            "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitiamolestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit tenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitiamolestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit tenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,",
        ),
    MoFreshProduct(
        id: '4',
        boxCategory: "Premium Box",
        boxMainPhoto:
            "https://kivu.mofresh.rw/img/dX11CLnQ7VCdKRo8iM3FA63rpfcMNaCSIWd0RGrj.png",
        buyPrice: "60000",
        rentPrice: "6000",
       
        description:
            "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitiamolestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit tenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitiamolestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit tenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit ",
       ),
  ];

  final List<BoxCategory> _boxCategory = [
    BoxCategory(
        id: "1",
        imageUrl: Mofresh.imageUrlAPI +
            "img/1oYtgzozFKiAhngGzFTlcoQ93msPcute2mmx5kmE.jpg",
        name: "Fridge",
        description:
            "n publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.",color: const Color.fromARGB(255, 0, 86, 216),),
              
    BoxCategory(
        id: "2",
        imageUrl: Mofresh.imageUrlAPI +
            "img/gC5Z6xWmP9pez82f5Ua61HhRUXUqRHX5HB2AGnvN.jpg",
        name: "Container",
        description:
            "n publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.",
             color: const Color.fromARGB(255, 0, 88, 15),
            ),
    BoxCategory(
        id: "3",
        imageUrl: Mofresh.imageUrlAPI +
            "img/73xtsZIh7o5lHE5JoVlm8o0kZt2gV7zcM3tC6OOC.jpg",
        name: "Box",
        description:
            "n publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.",
            color: const Color.fromARGB(255, 243, 33, 243),
            ),
    BoxCategory(
        id: "4",
        imageUrl: Mofresh.imageUrlAPI +
            "img/73xtsZIh7o5lHE5JoVlm8o0kZt2gV7zcM3tC6OOC.jpg",
        name: "Premium Box",
        description:
            "n publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.",
             color: const Color.fromARGB(255, 2, 92, 92),
            ),
  ];

  final List<Plate> _plateItems = [
    Plate(
        id: "1",
        storageName: "Plate 1",
        plateDescription:
            "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitiamolestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit tenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitiamolestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit tenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit ",
        buyPrice: "50000",
        rentPrice: "5000",
        maxTemperature: "-35",
        platePicture: "img/dX11CLnQ7VCdKRo8iM3FA63rpfcMNaCSIWd0RGrj.png",
        plateType: "Blue",
        storageCode: "CS-620FBDDCC5F6E"),
    Plate(
        id: "2",
        storageName: "Plate 2",
        plateDescription:
            "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitiamolestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit tenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitiamolestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit tenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit ",
        buyPrice: "55000",
        rentPrice: "5500",
        maxTemperature: "-45",
        platePicture: "img/8QbBvezD3ByHrDsBqaWPgKspXDKmWOIDdMWbvn9t.png",
        plateType: "Blue",
        storageCode: "CS-620FBDDCC5F6E"),
    Plate(
        id: "3",
        storageName: "Plate 3",
        plateDescription:
            "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitiamolestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit tenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitiamolestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit tenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit ",
        buyPrice: "70000",
        rentPrice: "6400",
        maxTemperature: "-55",
        platePicture: "img/5CX5lpBayfDZzvkkLxYMYgyjf79dPc8zkJSjwlIi.png",
        plateType: "Blue",
        storageCode: "CS-620FBDDCC5F6E")
  ];

  // Managing Items

  List<BoxCategory> get categoryItems {
    return [..._boxCategory];
  }

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
