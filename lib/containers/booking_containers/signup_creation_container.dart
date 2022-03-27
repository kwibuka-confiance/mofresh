import 'package:flutter/material.dart';
import 'package:mofresh/containers/booking_containers/customerInfo.dart';
import 'package:mofresh/models/customer_information.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var step = 1;
  var firstInfoArray = [];
  var secondInfoArray = [];

  void nextStep() {
    setState(() {
      step = step + 1;
    });
  }

  void previousStep() {
    setState(() {
      step = step - 1;
    });
  }

  void savePatientHandler() {}
  @override
  Widget build(BuildContext context) {
    var renderWidgetToDom;
    if (step == 1) {
      renderWidgetToDom = CustomerPageOne(nextStep);
    }
    return Container(
      child: Column(
        children: [
          SizedBox(
              height: 150,
              child: Image.asset("assets/icons_and_placeholder/mofresh.png")),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Individual",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          renderWidgetToDom
        ],
      ),
    );
  }
}
