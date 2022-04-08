import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mofresh/widgets/cold_box_widget.dart';
import 'package:mofresh/widgets/market_container_widget.dart';
import 'package:mofresh/widgets/market_item_wrapper_container.dart';

class MofreshColdBox extends StatefulWidget {
  List MOFRESH_MIX_ELEMENTS;
  String title;
  MofreshColdBox(this.MOFRESH_MIX_ELEMENTS, this.title, {Key? key})
      : super(key: key);

  @override
  State<MofreshColdBox> createState() => _MofreshColdBoxState();
}

class _MofreshColdBoxState extends State<MofreshColdBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 20),
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
                  children: widget.MOFRESH_MIX_ELEMENTS
                      .map(
                        (element) => widget.title == "Mofresh Containers"
                            ? ColdBoxContainerMarket(element.mainPhoto,
                                element.storageName, element.description)
                            : MarketItemWrapper(element.mainPhoto,
                                element.storageName, element.description),
                      )
                      .toList())),
        ],
      ),
    );
  }
}
