import 'dart:ui';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:mofresh/models/tag.dart';
import 'package:mofresh/provider/cart.dart';
import 'package:mofresh/provider/products.dart';
import 'package:mofresh/screens/box_product_screen.dart';
import 'package:mofresh/screens/cart_page_screen.dart';
import 'package:mofresh/screens/dashboard.dart';
import 'package:mofresh/screens/home_screen.dart';
import 'package:mofresh/screens/storageHubScreen.dart';
import 'package:mofresh/utils/colors/colorswitch.dart';
import 'package:provider/provider.dart';

class HomeScreenL extends StatefulWidget {
  const HomeScreenL({Key? key}) : super(key: key);

  static const routeName = '/get-plate';

  @override
  State<HomeScreenL> createState() => _HomeScreenLState();
}

class _HomeScreenLState extends State<HomeScreenL> {
  @override
  bool _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      Provider.of<Products>(context).getMoFreshProducts();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final _mofreshProducts = productData.categoryItems;
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: const [
            Text(
              "Hello,",
              style: TextStyle(fontSize: 25, color: Colors.black),
            ),
            Text(
              "Confiance",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              maxRadius: 16,
              backgroundColor: Theme.of(context).primaryColorDark,
              foregroundColor: Colors.white,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(DashboardScreen.routeName);
                },
                icon: const Icon(
                  Icons.notifications,
                  size: 18,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
                icon: Badge(
                  badgeColor: MoFreshColor.accentColor,
                  badgeContent: Text(
                    cart.itemsCount.toString(),
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  child: Icon(
                    Icons.shopping_cart,
                    color: Theme.of(context).primaryColorDark,
                    size: 30,
                  ),
                )),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          // Hubs
          Container(
            margin: const EdgeInsets.all(15),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
                color: MoFreshColor.primarColor,
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                    image: NetworkImage(
                        'https://kivu.mofresh.rw/img/gC5Z6xWmP9pez82f5Ua61HhRUXUqRHX5HB2AGnvN.jpg'),
                    fit: BoxFit.cover)),
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: Colors.white.withOpacity(0.1),
                              style: BorderStyle.solid),
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(15)),
                      // height: 100,
                      padding: const EdgeInsets.all(10),
                      child: Column(children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Mofresh Hub",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed(StorageHubScreen.routeName);
                                },
                                style: const ButtonStyle(),
                                child: const Text("Get one near you",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: const Text(
                                "KEEP YOUR PRODUCTIVITY SAFELY",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Row(
                              children: categoryList
                                  .map((e) => Container(
                                        margin: const EdgeInsets.only(
                                            right: 5, top: 10),
                                        child: Row(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              child: SizedBox(
                                                height: 20,
                                                width: 20,
                                                child: Image.network(
                                                  e.tagImage,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            // const Padding(
                                            //   padding:  EdgeInsets.only(left:4.0),
                                            //   child:  Text("Fruits",style: TextStyle(color: Colors.white),),
                                            // )
                                          ],
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ],
                        )
                      ]),
                    ),
                  ),
                ),
              ),
              // todo BOXES Containers
            ]),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            width: double.infinity,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                "MoFresh Products",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.9,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: _mofreshProducts.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                          BoxProductScreen.routeName,
                          arguments: _mofreshProducts[index].id);
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 3, horizontal: 3),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    _mofreshProducts[index].imageUrl),
                                fit: BoxFit.cover),
                            color: const Color.fromARGB(255, 2, 77, 18),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 15, sigmaY: 20),
                                    child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 0.5,
                                                style: BorderStyle.solid,
                                                color: Colors.white
                                                    .withOpacity(0.3)),
                                            color: _mofreshProducts[index]
                                                .color
                                                .withOpacity(0.5),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                _mofreshProducts[index].name,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  width: 90,
                                                  child: const Text(
                                                    'Available for Buy and Rents',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 13),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    IconButton(
                                                        onPressed: () {},
                                                        icon: const Icon(
                                                            Icons
                                                                .add_shopping_cart,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    226,
                                                                    136,
                                                                    0)))
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )),
                  );
                },
              )
            ]),
          )
        ]),
      ),
    );
  }
}
