import 'package:flutter/material.dart';

class RatingContainer extends StatefulWidget {
  const RatingContainer({Key? key}) : super(key: key);

  @override
  State<RatingContainer> createState() => _RatingContainerState();
}

class _RatingContainerState extends State<RatingContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(child: Text("Rating Page")),
    );
  }
}
