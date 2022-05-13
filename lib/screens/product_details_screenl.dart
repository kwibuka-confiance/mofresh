import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:mofresh/models/tag.dart';
import 'package:mofresh/provider/cart.dart';
import 'package:mofresh/provider/products.dart';
import 'package:mofresh/screens/cart_page_screen.dart';
import 'package:mofresh/utils/URL.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreenL extends StatefulWidget {
  const ProductDetailsScreenL({Key? key}) : super(key: key);
  static const routeName = '/description_details_product';
  @override
  State<ProductDetailsScreenL> createState() => _ProductDetailsScreenLState();
}

class _ProductDetailsScreenLState extends State<ProductDetailsScreenL> {
  @override
  Widget build(BuildContext context) {
    final plateId = ModalRoute.of(context)!.settings.arguments as String;
    final loadedProduct =
        Provider.of<Products>(context, listen: false).findById(plateId);
    final cartItems = Provider.of<Cart>(context);
    final cart = cartItems.itemsCount;
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                elevation: 0,
                // foregroundColor: Theme.of(context).primaryColorDark,
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back),
                  // color: Theme.of(context).primaryColorDark,
                ),
                expandedHeight: 300,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    background: Hero(
                  tag: loadedProduct.id,
                  child: Container(
                      child: Image.network(
                    Mofresh.imageUrlAPI + loadedProduct.platePicture,
                    fit: BoxFit.cover,
                  )),
                )),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications,
                      color: Color.fromARGB(255, 189, 113, 0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(CartScreen.routeName);
                      },
                      icon: Badge(
                        badgeContent: Text(cartItems.itemsCount.toString()),
                        child: const Icon(Icons.shopping_cart,
                            color: Color.fromARGB(255, 189, 113, 0)),
                      ),
                    ),
                  )
                ],
              ),

              // BODY
              SliverList(
                delegate: SliverChildListDelegate([
                  Container(
                      padding: const EdgeInsets.only(top: 10),
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Wrap(
                        direction: Axis.horizontal,
                        spacing: 3,
                        runSpacing: 5,
                        children: categoryList
                            .map(
                              (e) => Container(
                                margin: const EdgeInsets.only(left: 3),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 1),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black)),
                                child: Text(e.tagName),
                              ),
                            )
                            .toList(),
                      )),
                  Container(
                    margin: const EdgeInsets.only(
                        top: 10, left: 14, right: 10, bottom: 10),
                    color: Colors.black,
                    height: .3,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: Column(children: [
                            const Icon(Icons.cloud_done),
                            const Text("Temperature",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13)),
                            Text(loadedProduct.maxTemperature)
                          ]),
                        ),
                        Container(
                          child: Column(children: [
                            const Icon(Icons.merge_type),
                            const Text("Type",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13)),
                            Text(loadedProduct.plateType)
                          ]),
                        ),
                        Container(
                          child: Column(children: [
                            const Icon(Icons.code_off),
                            const Text("Storage Code",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13)),
                            Text(loadedProduct.storageCode)
                          ]),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        top: 10, left: 14, right: 10, bottom: 10),
                    color: Colors.black,
                    height: .3,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              "Description",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                          Text(loadedProduct.plateDescription),
                        ]),
                  ),
                ]),
              )
            ],
          ),
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(4, 141, 42, 1),
                    borderRadius: BorderRadius.circular(25)),
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          cartItems.addItem(
                              loadedProduct.id,
                              double.parse(loadedProduct.buyPrice),
                              loadedProduct.storageName,
                               Mofresh.imageUrlAPI+loadedProduct.platePicture);
                        },
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: const Text(
                              "Buy",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                      ),
                      const Text(
                        "Rent",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )
                    ]),
              ))
        ],
      ),
    );
  }
}
