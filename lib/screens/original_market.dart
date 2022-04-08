import 'package:flutter/material.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({Key? key}) : super(key: key);

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Theme.of(context).primaryColorDark,
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart))
          ],
          title: const Text("MoFresh")),
      body: Center(child: Text("Our Market Comming Soon")),
    );
  }
}
