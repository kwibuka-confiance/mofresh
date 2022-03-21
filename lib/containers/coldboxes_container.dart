import 'package:flutter/material.dart';
import 'package:mofresh/widgets/cold_box_widget.dart';

class ColdBoxesContainer extends StatefulWidget {
  const ColdBoxesContainer({Key? key}) : super(key: key);

  @override
  State<ColdBoxesContainer> createState() => _ColdBoxesContainerState();
}

class _ColdBoxesContainerState extends State<ColdBoxesContainer> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) => const ColdBoxContainer());
  }
}
