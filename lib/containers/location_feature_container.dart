import 'package:flutter/material.dart';
import 'package:mofresh/widgets/empty.dart';

class LocationContainer extends StatefulWidget {
  const LocationContainer({Key? key}) : super(key: key);

  @override
  State<LocationContainer> createState() => _LocationContainerState();
}

class _LocationContainerState extends State<LocationContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const EmptyFeature(),
    );
  }
}
