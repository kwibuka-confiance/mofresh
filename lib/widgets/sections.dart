import 'package:flutter/material.dart';

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
          children: const <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Vegetables"),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Vegetables"),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Vegetables"),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Vegetables"),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Vegetables"),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Vegetables"),
            ),
          ],
        ),
      ),
    );
  }
}
