import 'package:flutter/material.dart';
import 'package:mofresh/provider/cart.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  static const routeName = '/cart-screen';

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
    final cart = Provider.of<Cart>(context);
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
            foregroundColor: Colors.white,
            backgroundColor: Theme.of(context).primaryColorDark,
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(CartScreen.routeName);
                  },
                  icon: const Icon(Icons.shopping_cart))
            ],
            title: const Text("Cart")),
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 300,
                  child: Expanded(
                      child: ListView.builder(
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) => cartItemWidget(
                        context,
                        cart.items.values.toList()[index].title,
                        cart.items.values.toList()[index].price.toString(),
                        cart.items.values.toList()[index].imageUrl),
                  )),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                  margin: const EdgeInsets.only(left: 10),
                                  width: 60,
                                  child: Image.asset(
                                      'assets/paymentStuff/momo.png'),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  width: 60,
                                  child: Image.asset(
                                      'assets/paymentStuff/visa.jpg'),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 10),
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
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 10.0, left: 10),
                              child: Text(
                                "Phone Number",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFormField(
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(305)),
                                        labelText: 'Enter phone number',
                                        suffixIcon: const Icon(Icons.phone),
                                        labelStyle:
                                            const TextStyle(fontSize: 12),
                                        isDense: true,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                // vertical: 4,
                                                horizontal: 20)),
                                    textInputAction: TextInputAction.done,
                                    validator: (value) {
                                      if (value!.isEmpty &&
                                          !value.contains('@') &&
                                          !value.contains('.')) {
                                        return 'Fill valid email';
                                      }

                                      return null;
                                    },
                                    // onSaved: (value) {
                                    //   _userInformation = UserInformations(
                                    //     firstName: _userInformation.firstName,
                                    //     lastName: _userInformation.lastName,
                                    //     email: value.toString(),
                                    //     phoneNumber:
                                    //         _userInformation.phoneNumber,
                                    //     password: _userInformation.password,
                                    //   );
                                    // },
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(top: 20),
                                    width: double.infinity,
                                    child: Container(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pushNamed('/payment-sucess');
                                        },
                                        child: const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 18),
                                          child: Text(
                                            "Confirm Payment",
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
                                            primary: Theme.of(context)
                                                .primaryColorDark),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
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

  Container cartItemWidget(
      BuildContext context, String title, priceAmount, imgUrl) {
    print(imgUrl);
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 110,
            child: Image.network(
             imgUrl,
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
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      const Text("100 * 100 CM"),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: const Text(
                            "Medecines and Pharmaceuticals",
                            style: TextStyle(fontSize: 11),
                          )),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  fontSize: 15, fontWeight: FontWeight.bold),
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
                        priceAmount,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColorDark),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
