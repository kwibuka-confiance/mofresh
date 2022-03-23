import 'package:flutter/material.dart';

class PricingContainer extends StatefulWidget {
  const PricingContainer({Key? key}) : super(key: key);

  @override
  State<PricingContainer> createState() => _PricingContainerState();
}

class _PricingContainerState extends State<PricingContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(child: Text("Pricing Page")),
    );
  }
}
