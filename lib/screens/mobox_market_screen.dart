import 'package:flutter/material.dart';

class MoFreshMaerketScreen extends StatefulWidget {
  const MoFreshMaerketScreen({Key? key}) : super(key: key);

  @override
  State<MoFreshMaerketScreen> createState() => _MoFreshMaerketScreenState();
}

class _MoFreshMaerketScreenState extends State<MoFreshMaerketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Market"),
      ),
    );
  }
}
