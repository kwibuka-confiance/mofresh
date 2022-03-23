import 'package:flutter/material.dart';

class ServicesContainer extends StatefulWidget {
  const ServicesContainer({Key? key}) : super(key: key);

  @override
  State<ServicesContainer> createState() => _ServicesContainerState();
}

class _ServicesContainerState extends State<ServicesContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(child: Text("Services Page")),
    );
  }
}
