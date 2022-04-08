import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Theme.of(context).primaryColorDark,
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart))
          ],
          title: const Text("Cart")),
      body: const Center(child: Text('Cart Screen comming soom')),
    );
  }
}
