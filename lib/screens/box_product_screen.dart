import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:mofresh/models/products.dart';
import 'package:mofresh/models/tag.dart';
import 'package:mofresh/provider/cart.dart';
import 'package:mofresh/provider/products.dart';
import 'package:mofresh/screens/cart_page_screen.dart';
import 'package:mofresh/utils/colors/colorswitch.dart';
import 'package:provider/provider.dart';

class BoxProductScreen extends StatefulWidget {
  const BoxProductScreen({Key? key}) : super(key: key);

  static const routeName = '/box-products';
  @override
  State<BoxProductScreen> createState() => _BoxProductScreenState();
}

class _BoxProductScreenState extends State<BoxProductScreen> {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final cartItems = Provider.of<Cart>(context);

    final boxData = productData.findProductBoxById(productId);
    return Scaffold(
      // appBar: AppBar(title: const Text("Fridge"), actions: [
      //   IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
      //   IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
      // ]),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                elevation: 0,
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Theme.of(context).primaryColor,
                  ),
                  // color: Theme.of(context).primaryColorDark,
                ),
                expandedHeight: 400,
                centerTitle: true,
                pinned: true,
                title: Text(
                  boxData.name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                ),
                flexibleSpace: FlexibleSpaceBar(
                    background: Hero(
                  tag: boxData.id,
                  child: Container(
                      child: Image.network(
                    boxData.imageUrl,
                    fit: BoxFit.cover,
                  )),
                )),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications,
                      color: MoFreshColor.accentColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(CartScreen.routeName);
                      },
                      icon: Badge(
                        badgeColor: MoFreshColor.primarColor,
                        
                        badgeContent: Text(cartItems.itemsCount.toString(),style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                        child: const Icon(Icons.shopping_cart,
                            color: MoFreshColor.accentColor),
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
                          child: Column(children: const [
                            const Icon(Icons.cloud_done,color: MoFreshColor.accentColor,),
                            const Text("Size",),
                            Text("100 CM cube",style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13))
                          ]),
                        ),
                        Container(
                          child: Column(children: [
                            const Icon(Icons.merge_type,color: MoFreshColor.accentColor,),
                            const Text("Rent Price",
                                ),
                            Text("200 RWF",style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13))
                          ]),
                        ),
                        Container(
                          child: Column(children: [
                            const Icon(Icons.code_off,color: MoFreshColor.accentColor,),
                            const Text("Buy Price",
                                ),
                            Text("2000 RWF",style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13))
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
                          Text(boxData.description),
                        ]),
                  ),
                ]),
              )
            ],
          ),
          // Positioned(
          //     bottom: 0,
          //     right: 0,
          //     left: 0,
          //     child: Container(
          //       decoration: BoxDecoration(
          //           color: const Color.fromRGBO(4, 141, 42, 1),
          //           borderRadius: BorderRadius.circular(25)),
          //       margin:
          //           const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          //       padding:
          //           const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          //       child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceAround,
          //           children: [
          //             GestureDetector(
          //               onTap: () {
          //                 cartItems.addItem(
          //                     loadedProduct.id,
          //                     double.parse(loadedProduct.buyPrice),
          //                     loadedProduct.storageName,
          //                     Mofresh.imageUrlAPI + loadedProduct.platePicture);
          //               },
          //               child: Container(
          //                   padding: const EdgeInsets.symmetric(
          //                       vertical: 10, horizontal: 50),
          //                   child: const Text(
          //                     "Buy",
          //                     style: TextStyle(
          //                         fontWeight: FontWeight.bold,
          //                         color: Colors.white),
          //                   )),
          //             ),
          //             GestureDetector(
          //               onTap: () {
          //                 showModalBottomSheet(
          //     bottom: 0,
          //     right: 0,
          //                     borderRadius: BorderRadius.vertical(top: Radius.circular(25),)
          //                   ),
          //                     context: context,
          //                     builder: (_) {
          //                       return  ProductRent(loadedProduct.storageName,loadedProduct.rentPrice);
          //                     });
          //               },
          //               child: Container(
          //                 padding: const EdgeInsets.symmetric(
          //                     vertical: 10, horizontal: 50),
          //                 child: const Text(
          //                   "Rent",
          //                   style: TextStyle(
          //                       fontWeight: FontWeight.bold,
          //                       color: Colors.white),
          //                 ),
          //               ),
          //             )
          //           ]),
          //     ))
        ],
      ),
    );
  }
}
