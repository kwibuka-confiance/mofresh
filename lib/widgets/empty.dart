import 'package:flutter/material.dart';

class EmptyFeature extends StatelessWidget {
  const EmptyFeature({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Column(children: [
        Container(
          child: Image.asset('assets/icons_and_placeholder/Group 21.png'),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Text(
            "This feature isn't available",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        )
      ]),
    );
  }
}
