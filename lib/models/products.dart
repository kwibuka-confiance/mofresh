import 'package:flutter/material.dart';

class MoFreshProduct {
  String id;
  String storageName;
  String mainPhoto;
  String provinceName;
  String districtName;
  String sectorName;
  String storageOverview;
  List moreProducts;
  Color color = const Color.fromARGB(255, 2, 114, 30);

  MoFreshProduct(
      {required this.id,
      required this.districtName,
      required this.mainPhoto,
      required this.provinceName,
      required this.sectorName,
      required this.storageName,
      required this.storageOverview,
      required this.color,
      required this.moreProducts
      });
}
