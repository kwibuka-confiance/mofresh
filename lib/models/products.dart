import 'package:flutter/material.dart';

class MoFreshProduct {
  String id;
  String boxCategory;
  String boxMainPhoto;
  String description;
  String rentPrice;
  String buyPrice;

  

  MoFreshProduct(
      {required this.id,
      required this.boxCategory,
      required this.boxMainPhoto,
      required this.description,
      required this.rentPrice,
      required this.buyPrice,
      });
}

class BoxCategory {
  String id;
  String name;
  String imageUrl;
  String description;
  Color color = const Color.fromARGB(255, 2, 114, 30);

  BoxCategory({required this.id, required this.imageUrl, required this.name, required this.description, required this.color});
}
