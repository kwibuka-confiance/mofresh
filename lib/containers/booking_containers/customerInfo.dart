import 'package:flutter/material.dart';
import 'package:mofresh/models/customer_information.dart';

class CustomerPageOne extends StatefulWidget {
  Function nextStep;
  // Function savePatientHandler;
  // var informationOfFirst;
  CustomerPageOne(this.nextStep);

  @override
  _CustomerPageOneState createState() => _CustomerPageOneState();
}

class _CustomerPageOneState extends State<CustomerPageOne> {
  bool isLoading = false;
  final _form = GlobalKey<FormState>();
  String dropdownValue = 'age 1-12';

  @override
  Widget build(BuildContext context) {
    var _customerInformations =
        CustomerInformation(names: '', email: '', password: '');

    _patientFirstInfoHandler() {
      var validateForm = _form.currentState!.validate();
      _form.currentState!.save();

      // if (validateForm) {
      //   widget.informationOfFirst.add({
      //     "names": _customerInformations.names,
      //     "email": _customerInformations.email,
      //     "pasword": _customerInformations.password
      //   });
      // }
      widget.nextStep();
    }

    // print(dataArray);

    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Form(
                key: _form,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                labelText: 'Enter your names',
                                labelStyle: const TextStyle(fontSize: 12),
                                suffixIcon: const Icon(Icons.account_circle),
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 20)),
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Fill your correct name";
                              }

                              return null;
                            },
                            onSaved: (value) {
                              _customerInformations = CustomerInformation(
                                  names: value.toString(),
                                  email: _customerInformations.email,
                                  password: _customerInformations.password);
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                labelText: 'Enter your email',
                                suffixIcon: const Icon(Icons.email),
                                labelStyle: const TextStyle(fontSize: 12),
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                    // vertical: 4,
                                    horizontal: 20)),
                            textInputAction: TextInputAction.next,
                            // obscureText: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'your email';
                              }

                              return null;
                            },
                            onSaved: (value) {
                              _customerInformations = CustomerInformation(
                                  names: _customerInformations.names,
                                  email: value.toString(),
                                  password: _customerInformations.password);
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                labelText: 'Enter your password',
                                suffixIcon: const Icon(Icons.lock),
                                labelStyle: const TextStyle(fontSize: 12),
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                    // vertical: 4,
                                    horizontal: 20)),
                            textInputAction: TextInputAction.next,
                            obscureText: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Fill the password';
                              }

                              return null;
                            },
                            onSaved: (value) {
                              _customerInformations = CustomerInformation(
                                  names: _customerInformations.names,
                                  email: _customerInformations.email,
                                  password: value.toString());
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        child: ElevatedButton(
                          onPressed: _patientFirstInfoHandler,
                          child: isLoading == false
                              ? const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 18),
                                  child: Text(
                                    "Next",
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.white),
                                  ),
                                )
                              : const SizedBox(
                                  width: 18,
                                  height: 18,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              primary: Theme.of(context).primaryColorDark),
                        ),
                      ),
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
