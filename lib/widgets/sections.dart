import 'package:flutter/material.dart';
import 'package:mofresh/models/tag.dart';

class SectionSelectableWidget extends StatefulWidget {
  const SectionSelectableWidget({Key? key}) : super(key: key);

  @override
  State<SectionSelectableWidget> createState() =>
      _SectionSelectableWidgetState();
}

class _SectionSelectableWidgetState extends State<SectionSelectableWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, bottom: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: categoryList
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    e.tagName,
                    style: TextStyle(
                        color: Theme.of(context).primaryColorDark,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
