import 'package:flutter/material.dart';

class PaymentWidget extends StatefulWidget {
  String clientCode;
  PaymentWidget(this.clientCode, {Key? key}) : super(key: key);

  @override
  State<PaymentWidget> createState() => _PaymentWidgetState();
}

class _PaymentWidgetState extends State<PaymentWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                  'RWF ${widget.clientCode}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
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
                child: Image.asset('assets/paymentStuff/momo.png'),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                width: 60,
                child: Image.asset('assets/paymentStuff/visa.jpg'),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                width: 60,
                child: Image.asset('assets/paymentStuff/PayPal.png'),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10),
                width: 60,
                child: Image.asset('assets/paymentStuff/MasterCard.png'),
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
                          borderRadius: BorderRadius.circular(305)),
                      labelText: 'Enter phone number',
                      suffixIcon: const Icon(Icons.phone),
                      labelStyle: const TextStyle(fontSize: 12),
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
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
                        Navigator.of(context).pushNamed('/payment-sucess');
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 18),
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
                              borderRadius: BorderRadius.circular(30)),
                          primary: Theme.of(context).primaryColorDark),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
