import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mofresh/models/tag.dart';
import 'package:mofresh/provider/cart.dart';
import 'package:mofresh/provider/products.dart';
import 'package:mofresh/screens/cart_page_screen.dart';
import 'package:mofresh/screens/product_details_screenl.dart';
import 'package:mofresh/ui_widgets/productPlate.dart';
import 'package:mofresh/utils/URL.dart';
import 'package:mofresh/widgets/shimmer_loader.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart';

class MoreProductScreen extends StatefulWidget {
  const MoreProductScreen({Key? key}) : super(key: key);

  @override
  State<MoreProductScreen> createState() => _MoreProductScreenState();
}

class _MoreProductScreenState extends State<MoreProductScreen> {
  bool _isInit = true;
  bool _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Products>(context).getPlates().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final plateItemsProvider = Provider.of<Products>(context);
    final plateItems = plateItemsProvider.plateItems;
    print(plateItems);
    // final cart = Provider.of<Cart>(context, listen: false);
    // print(cart.itemsCount.toString());
    return Scaffold(
      appBar: AppBar(
          foregroundColor: Theme.of(context).primaryColorDark,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "Plates",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications),
            ),
            Consumer<Cart>(
              builder: (_, cartData, chi) => Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(CartScreen.routeName);
                  },
                  icon: Badge(
                      badgeContent: Text(
                        cartData.itemsCount.toString(),
                        style: const TextStyle(
                            color: Color.fromARGB(255, 1, 156, 40),
                            fontWeight: FontWeight.bold),
                      ),
                      badgeColor: Colors.orange,
                      child: chi),
                ),
              ),
              child: const Icon(Icons.shopping_cart),
            )
          ]),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Stack(children: [
        Container(
          margin: const EdgeInsets.only(top: 100),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.7,
          child: Image.network(
            "https://media.istockphoto.com/photos/multicolored-fresh-fruits-on-white-background-picture-id1314537818?b=1&k=20&m=1314537818&s=612x612&w=0&h=GfKdnYJuNtU7LfEdZCPwYblqmNxBFqr1tSjxcuCDKVU=",
            fit: BoxFit.cover,
          ),
        ),
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        margin: const EdgeInsets.only(),
                        child: Text(
                          "Get Or Change Your Plates",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Theme.of(context).primaryColorDark),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: Text(
                        "lorem ipsumhello word",
                        style: TextStyle(color: Colors.orange[800]),
                      ),
                    )
                  ],
                ),
              ),
              ListView.builder(
                primary: true,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: plateItems.length,
                itemBuilder: (context, index) => MoreProductWidget(
                    plateItems[index].id,
                    plateItems[index].storageName,
                    plateItems[index].platePicture,
                    plateItems[index].maxTemperature,
                    plateItems[index].buyPrice,
                    plateItems[index].plateDescription),
              )
            ],
          ),
        )
      ]),
    );
  }
}

class MoreProductWidget extends StatelessWidget {
  String id;
  String plateName;
  String imageUrl;
  String maxTemperature;
  String price;
  String description;
  MoreProductWidget(
    this.id,
    this.plateName,
    this.imageUrl,
    this.maxTemperature,
    this.price,
    this.description, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    print(price);

    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(ProductDetailsScreenL.routeName, arguments: id);
      },
      child: Container(
        margin: const EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.white,
                        style: BorderStyle.solid,
                        width: .7),
                    color: const Color.fromARGB(255, 192, 192, 192)
                        .withOpacity(0.4),
                    // color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        child: Text("M"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              plateName,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              maxTemperature,
                              style: const TextStyle(
                                fontWeight: FontWeight.w100,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(description.substring(0, 130).toString()),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColorDark,
                          borderRadius: BorderRadius.circular(10)),
                      width: double.infinity,
                      height: 200,
                      child: Image.network(
                        Mofresh.imageUrlAPI + imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Row(
                    children: categoryList
                        .map((e) => Container(
                              margin: const EdgeInsets.only(right: 5, top: 10),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(4),
                                    child: SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: Image.network(
                                        e.tagImage,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ))
                        .toList(),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColorDark,
                                borderRadius: BorderRadius.circular(5)),
                            padding: const EdgeInsets.symmetric(
                                vertical: 3, horizontal: 20),
                            child: InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(25))),
                                    context: context,
                                    builder: (_) =>
                                        ProductRent(plateName, price));
                              },
                              child: Row(
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.only(right: 4.0),
                                    child: Icon(
                                      Icons.read_more,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "Rent",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            cart.addItem(id, double.parse(price), plateName,
                                Mofresh.imageUrlAPI + imageUrl);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColorDark,
                                borderRadius: BorderRadius.circular(5)),
                            padding: const EdgeInsets.symmetric(
                                vertical: 3, horizontal: 20),
                            child: Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(right: 4.0),
                                  child: Icon(
                                    Icons.local_grocery_store_sharp,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "Add to Cart",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
