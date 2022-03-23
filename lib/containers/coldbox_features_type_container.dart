import 'package:flutter/material.dart';
import 'package:mofresh/models/coldBox_feature.dart';
import 'package:mofresh/widgets/box_feature.dart';

class ColdBoxfeatures extends StatefulWidget {
  const ColdBoxfeatures({Key? key}) : super(key: key);

  @override
  State<ColdBoxfeatures> createState() => _ColdBoxfeaturesState();
}

class _ColdBoxfeaturesState extends State<ColdBoxfeatures> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cold Container Details",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Theme.of(context).primaryColorDark),
          ),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: listOfFeature.length,
            itemBuilder: (context, index) => BoxFeature(
                listOfFeature[index].featureName,
                listOfFeature[index].featureImage,
                listOfFeature[index].featureValue),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 130,
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
          ),
        ],
      ),
    );
  }
}
