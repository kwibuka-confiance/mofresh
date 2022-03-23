import 'package:flutter/material.dart';

class BoxFeatureM {
  String featureName;
  String featureValue;
  String featureImage;
  BoxFeatureM(
      {required this.featureName,
      required this.featureValue,
      required this.featureImage});
}

final List<BoxFeatureM> listOfFeature = [
  BoxFeatureM(
      featureName: "Storage Type",
      featureValue: "Vegetable, Meats",
      featureImage: "assets/icons_and_placeholder/placeholderImage2.png"),
  BoxFeatureM(
      featureName: "Road Accessibility",
      featureValue: " 100m",
      featureImage: "assets/icons_and_placeholder/placeholderImage2.png"),
  BoxFeatureM(
      featureName: "Type of Electricity",
      featureValue: "Vegetable, Meats",
      featureImage: "assets/icons_and_placeholder/placeholderImage2.png"),
  BoxFeatureM(
      featureName: "Temperature zones",
      featureValue: "23~-25℃, -18~-20℃, +18~-3℃,",
      featureImage: "assets/icons_and_placeholder/placeholderImage2.png"),
  BoxFeatureM(
      featureName: "Cold Storage area",
      featureValue: "12,700 Square Meters",
      featureImage: "assets/icons_and_placeholder/placeholderImage2.png"),
  BoxFeatureM(
      featureName: "Available Space",
      featureValue: " 25,000 Square Meters",
      featureImage: "assets/icons_and_placeholder/placeholderImage2.png"),
];
