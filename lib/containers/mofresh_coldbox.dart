import 'package:flutter/material.dart';
import 'package:mofresh/widgets/market_item_wrapper_container.dart';

class MofreshColdBox extends StatefulWidget {
  List MOFRESH_BOXES;
  String title;
  MofreshColdBox(this.MOFRESH_BOXES, this.title, {Key? key}) : super(key: key);

  @override
  State<MofreshColdBox> createState() => _MofreshColdBoxState();
}

class _MofreshColdBoxState extends State<MofreshColdBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                bottom: 15.0, top: 10, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
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
                  children: widget.MOFRESH_BOXES
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
