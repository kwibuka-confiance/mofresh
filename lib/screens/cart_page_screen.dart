import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int numberOfItems = 1;
  int totalAmount = 200000;
  int price = 200000;
  int step = 1;

  void next() {
    setState(() {
      step = step + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
            foregroundColor: Colors.white,
            backgroundColor: Theme.of(context).primaryColorDark,
            actions: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.shopping_cart))
            ],
            title: const Text("Cart")),
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Container(
                        width: 120,
                        height: 110,
                        child: Image.network(
                          "https://kivu.mofresh.rw/img/1oYtgzozFKiAhngGzFTlcoQ93msPcute2mmx5kmE.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        height: 110,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 8.0),
                                    child: Text(
                                      "Mo Fresh Grey",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ),
                                  Text("100 * 100 CM"),
                                  Text("Medecines and Pharmaceuticals"),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            setState(() {
                                              if (numberOfItems <= 1) {
                                                return;
                                              }
                                              numberOfItems = numberOfItems - 1;
                                              totalAmount = totalAmount - price;
                                            });
                                          },
                                          child: const Icon(
                                            Icons.remove,
                                          )),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          numberOfItems.toString(),
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      InkWell(
                                          onTap: () {
                                            setState(() {
                                              numberOfItems = numberOfItems + 1;
                                              totalAmount = totalAmount + price;
                                            });
                                          },
                                          child: const Icon(
                                            Icons.add,
                                          ))
                                    ],
                                  ),
                                  Text(
                                    "RWF 200,000",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Theme.of(context).primaryColorDark),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Positioned(
                width: MediaQuery.of(context).size.width,
                bottom: 0,
                child: step != 1
                    ? Container(
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25))),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Total",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    'RWF ${totalAmount.toString()}',
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 1,
                              color: Colors.black,
                              margin: const EdgeInsets.only(bottom: 10),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 60,
                                  child: Image.asset(
                                      'assets/paymentStuff/momo.png'),
                                ),
                                Container(
                                  width: 60,
                                  child: Image.asset(
                                      'assets/paymentStuff/visa.jpg'),
                                ),
                                Container(
                                  width: 60,
                                  child: Image.asset(
                                      'assets/paymentStuff/PayPal.png'),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 10),
                                  width: 60,
                                  child: Image.asset(
                                      'assets/paymentStuff/MasterCard.png'),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    : Container(
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25))),
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Total",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  'RWF ${totalAmount.toString()}',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 1,
                            color: Colors.black,
                            margin: const EdgeInsets.only(bottom: 20),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Tip",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColorDark),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(bottom: 20.0),
                                child: Text(
                                    "You can pay using different payment gateways like MoMo, Paypaland Credit cards"),
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: Container(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      next();
                                    },
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 18),
                                      child: Text(
                                        "Continue",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Poppins',
                                            fontSize: 18),
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        primary:
                                            Theme.of(context).primaryColorDark),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ]),
                      ))
          ],
        ));
  }
}
