import 'package:flutter/material.dart';
import 'package:mofresh/models/tag.dart';

class SectionSelectableWidget extends StatefulWidget {
  const SectionSelectableWidget({Key? key}) : super(key: key);

  @override
  State<SectionSelectableWidget> createState() =>
      _SectionSelectableWidgetState();
}

class _SectionSelectableWidgetState extends State<SectionSelectableWidget> {
  final bool _isSelected = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, bottom: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: categoryList
              .map(
                (e) => Container(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: Column(
                    children: [
                      _isSelected
                          ? Padding(
                              padding: const EdgeInsets.only(bottom: 4.0),
                              child: CircleAvatar(
                                maxRadius: 25,
                                backgroundImage: NetworkImage(e.tagImage),
                              ),
                            )
                          : Container(
                              margin: const EdgeInsets.only(bottom: 4),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(e.tagImage),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(10)),
                              width: 50,
                              height: 50,
                            ),
                      Text(
                        e.tagName,
                        style: TextStyle(
                            color: Theme.of(context).primaryColorDark,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
