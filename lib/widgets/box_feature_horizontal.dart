import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BoxFeatureHorizontal extends StatelessWidget {
  String featureName;
  String featureValue;
  String featureImage;
  BoxFeatureHorizontal(this.featureName, this.featureValue, this.featureImage,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 10),
      child: Row(
        children: [
          CircleAvatar(
            child: Image.asset(featureImage),
            // backgroundColor: Theme.of(context).primaryColorDark,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Text(
                    featureName,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(featureValue),
              ],
            ),
          )
        ],
      ),
    );
  }
}
