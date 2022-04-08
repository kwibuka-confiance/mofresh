import 'package:flutter/material.dart';
import 'package:mofresh/models/coldBox.dart';
import 'package:mofresh/widgets/market_item_wrapper_container.dart';

class MofreshColdBox extends StatefulWidget {
  const MofreshColdBox({Key? key}) : super(key: key);

  @override
  State<MofreshColdBox> createState() => _MofreshColdBoxState();
}

class _MofreshColdBoxState extends State<MofreshColdBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                bottom: 15.0, top: 10, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Mofresh ColdBox",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "View All",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: MOFRESH_BOX
                      .map(
                        (element) => MarketItemWrapper(element.mainPhoto,
                            element.storageName, element.description),
                      )
                      .toList())),
        ],
      ),
    );
  }
}
