import 'package:flutter/material.dart';

class BoxFeature extends StatelessWidget {
  String featureName;
  String featureImage;
  String featureValue;
  BoxFeature(this.featureName, this.featureImage, this.featureValue, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(
                color: const Color.fromARGB(255, 114, 114, 114),
                style: BorderStyle.solid,
                width: 1)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              featureName,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Container(width: 20, child: Image.asset(featureImage)),
            Text(featureValue),
          ],
        ));
  }
}
