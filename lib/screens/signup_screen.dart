import 'package:flutter/material.dart';
import 'package:mofresh/provider/UI.dart';
import 'package:mofresh/provider/auth.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';

class SignUpStarted extends StatefulWidget {
  const SignUpStarted({Key? key}) : super(key: key);

  @override
  _SignUpStartedState createState() => _SignUpStartedState();
}

class _SignUpStartedState extends State<SignUpStarted> {
  bool isLoading = false;

  final _form = GlobalKey<FormState>();

  // ignore: prefer_typing_uninitialized_variables
  var currentDate;
  var _userInformation = const UserInformations(
      firstName: "",
      lastName: "",
      email: "",
      username: "",
      phoneNumber: "",
      clientTin: "",
      location: '',
      businessType: "",
      password: "");

  @override
  Widget build(BuildContext context) {
    final stepper = Provider.of<UI>(context);
    void _continue() async {
      var validateForm = _form.currentState!.validate();
      _form.currentState!.save();

      if (validateForm && stepper.step == 1) {
        Provider.of<Auth>(context, listen: false)
            .signUp(
                "${_userInformation.firstName} ${_userInformation.lastName}",
                _userInformation.phoneNumber,
                _userInformation.email,
                _userInformation.username,
                _userInformation.clientTin,
                _userInformation.password,
                _userInformation.location,
                _userInformation.businessType)
            .then((result) {
          setState(() {
            isLoading = true;
          });
        }).whenComplete(() {
          setState(() {
            isLoading = false;
          });
          Navigator.of(context).pushNamed("/home");
        }).onError((error, stackTrace) {
          setState(() {
            isLoading = false;
          });
          print(error);
        });
      }
    }

    void _goAndLoginHandler() {
      Navigator.of(context).pushNamed("/login");
    }

    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 50,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Form(
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  child: Form(
                      key: _form,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          stepper.step == 1
                              ? const Text(
                                  "More Informations",
                                  style: TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold),
                                )
                              : const Text(
                                  "Your Informations",
                                  style: TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold),
                                ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 20.0),
                            child: Text(
                                "Fill your all information about you inorder to complete your account"),
                          ),
                          stepper.step == 0
                              ? Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20, bottom: 10),
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(305)),
                                            labelText: 'Enter your first name',
                                            labelStyle:
                                                const TextStyle(fontSize: 12),
                                            suffixIcon:
                                                const Icon(Icons.account_box),
                                            isDense: true,
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 0,
                                                    horizontal: 20)),
                                        textInputAction: TextInputAction.next,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Fill your first name";
                                          }

                                          return null;
                                        },
                                        onSaved: (value) {
                                          _userInformation = UserInformations(
                                              firstName: value.toString(),
                                              lastName:
                                                  _userInformation.lastName,
                                              email: _userInformation.email,
                                              phoneNumber:
                                                  _userInformation.phoneNumber,
                                              password:
                                                  _userInformation.password,
                                              businessType:
                                                  _userInformation.businessType,
                                              clientTin:
                                                  _userInformation.clientTin,
                                              location:
                                                  _userInformation.location,
                                              username:
                                                  _userInformation.username);
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextFormField(
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            305)),
                                                labelText: 'Enter last name',
                                                suffixIcon: const Icon(
                                                    Icons.account_box),
                                                labelStyle: const TextStyle(
                                                    fontSize: 12),
                                                isDense: true,
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                        // vertical: 4,
                                                        horizontal: 20)),
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Fill the last name';
                                              }

                                              return null;
                                            },
                                            onSaved: (value) {
                                              _userInformation =
                                                  UserInformations(
                                                      firstName:
                                                          _userInformation
                                                              .firstName,
                                                      lastName:
                                                          value.toString(),
                                                      email: _userInformation
                                                          .email,
                                                      phoneNumber:
                                                          _userInformation
                                                              .phoneNumber,
                                                      password: _userInformation
                                                          .password,
                                                      businessType:
                                                          _userInformation
                                                              .businessType,
                                                      clientTin:
                                                          _userInformation
                                                              .clientTin,
                                                      location: _userInformation
                                                          .location,
                                                      username: _userInformation
                                                          .username);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextFormField(
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            305)),
                                                labelText: 'Your email',
                                                suffixIcon:
                                                    const Icon(Icons.email),
                                                labelStyle: const TextStyle(
                                                    fontSize: 12),
                                                isDense: true,
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                        // vertical: 4,
                                                        horizontal: 20)),
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value!.isEmpty &&
                                                  !value.contains('@') &&
                                                  !value.contains('.')) {
                                                return 'Fill valid email';
                                              }

                                              return null;
                                            },
                                            onSaved: (value) {
                                              _userInformation =
                                                  UserInformations(
                                                      firstName:
                                                          _userInformation
                                                              .firstName,
                                                      lastName: _userInformation
                                                          .lastName,
                                                      email: value.toString(),
                                                      phoneNumber:
                                                          _userInformation
                                                              .phoneNumber,
                                                      password: _userInformation
                                                          .password,
                                                      businessType:
                                                          _userInformation
                                                              .businessType,
                                                      clientTin:
                                                          _userInformation
                                                              .clientTin,
                                                      location: _userInformation
                                                          .location,
                                                      username: _userInformation
                                                          .username);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextFormField(
                                            keyboardType: TextInputType.phone,
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            305)),
                                                labelText: 'Your phone number',
                                                suffixIcon:
                                                    const Icon(Icons.phone),
                                                labelStyle: const TextStyle(
                                                    fontSize: 12),
                                                isDense: true,
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                        // vertical: 4,
                                                        horizontal: 20)),
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Fill the phone number';
                                              }

                                              return null;
                                            },
                                            onSaved: (value) {
                                              _userInformation =
                                                  UserInformations(
                                                      firstName:
                                                          _userInformation
                                                              .firstName,
                                                      lastName: _userInformation
                                                          .lastName,
                                                      email: _userInformation
                                                          .email,
                                                      phoneNumber:
                                                          value.toString(),
                                                      password: _userInformation
                                                          .password,
                                                      businessType:
                                                          _userInformation
                                                              .businessType,
                                                      clientTin:
                                                          _userInformation
                                                              .clientTin,
                                                      location: _userInformation
                                                          .location,
                                                      username: _userInformation
                                                          .username);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextFormField(
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            305)),
                                                labelText: 'Enter password',
                                                suffixIcon:
                                                    const Icon(Icons.lock),
                                                labelStyle: const TextStyle(
                                                    fontSize: 12),
                                                isDense: true,
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                        // vertical: 4,
                                                        horizontal: 20)),
                                            textInputAction:
                                                TextInputAction.done,
                                            onFieldSubmitted: (_) {
                                              _continue();
                                            },
                                            obscureText: true,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Fill the password';
                                              }

                                              return null;
                                            },
                                            onSaved: (value) {
                                              _userInformation =
                                                  UserInformations(
                                                      firstName:
                                                          _userInformation
                                                              .firstName,
                                                      lastName: _userInformation
                                                          .lastName,
                                                      email: _userInformation
                                                          .email,
                                                      phoneNumber:
                                                          _userInformation
                                                              .phoneNumber,
                                                      password:
                                                          value.toString(),
                                                      businessType:
                                                          _userInformation
                                                              .businessType,
                                                      clientTin:
                                                          _userInformation
                                                              .clientTin,
                                                      location: _userInformation
                                                          .location,
                                                      username: _userInformation
                                                          .username);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              : Container(
                                  child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20, bottom: 10),
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(305)),
                                            labelText: 'Enter Business Type',
                                            labelStyle:
                                                const TextStyle(fontSize: 12),
                                            suffixIcon:
                                                const Icon(Icons.business),
                                            isDense: true,
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 0,
                                                    horizontal: 20)),
                                        textInputAction: TextInputAction.next,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Fill your business type";
                                          }

                                          return null;
                                        },
                                        onSaved: (value) {
                                          _userInformation = UserInformations(
                                              firstName:
                                                  _userInformation.firstName,
                                              lastName:
                                                  _userInformation.lastName,
                                              email: _userInformation.email,
                                              phoneNumber:
                                                  _userInformation.phoneNumber,
                                              password:
                                                  _userInformation.password,
                                              businessType: value.toString(),
                                              clientTin:
                                                  _userInformation.clientTin,
                                              location:
                                                  _userInformation.location,
                                              username:
                                                  _userInformation.username);
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextFormField(
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            305)),
                                                labelText: 'Enter TIN Number',
                                                suffixIcon: const Icon(
                                                    Icons.text_increase),
                                                labelStyle: const TextStyle(
                                                    fontSize: 12),
                                                isDense: true,
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                        // vertical: 4,
                                                        horizontal: 20)),
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Fill valid TIN Number';
                                              }

                                              return null;
                                            },
                                            onSaved: (value) {
                                              _userInformation =
                                                  UserInformations(
                                                      firstName:
                                                          _userInformation
                                                              .firstName,
                                                      lastName: _userInformation
                                                          .lastName,
                                                      email: _userInformation
                                                          .email,
                                                      phoneNumber:
                                                          _userInformation
                                                              .phoneNumber,
                                                      password: _userInformation
                                                          .password,
                                                      businessType:
                                                          _userInformation
                                                              .businessType,
                                                      clientTin:
                                                          value.toString(),
                                                      location: _userInformation
                                                          .location,
                                                      username: _userInformation
                                                          .username);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextFormField(
                                            // keyboardType: TextInputType.phone,
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            305)),
                                                labelText: 'Your Location',
                                                suffixIcon:
                                                    const Icon(Icons.phone),
                                                labelStyle: const TextStyle(
                                                    fontSize: 12),
                                                isDense: true,
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                        // vertical: 4,
                                                        horizontal: 20)),
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Fill the Location';
                                              }

                                              return null;
                                            },
                                            onSaved: (value) {
                                              _userInformation =
                                                  UserInformations(
                                                      firstName:
                                                          _userInformation
                                                              .firstName,
                                                      lastName: _userInformation
                                                          .lastName,
                                                      email: _userInformation
                                                          .email,
                                                      phoneNumber:
                                                          _userInformation
                                                              .phoneNumber,
                                                      password: _userInformation
                                                          .password,
                                                      businessType:
                                                          _userInformation
                                                              .businessType,
                                                      clientTin:
                                                          _userInformation
                                                              .clientTin,
                                                      location:
                                                          value.toString(),
                                                      username: _userInformation
                                                          .username);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextFormField(
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            305)),
                                                labelText: 'Username',
                                                suffixIcon:
                                                    const Icon(Icons.lock),
                                                labelStyle: const TextStyle(
                                                    fontSize: 12),
                                                isDense: true,
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                        // vertical: 4,
                                                        horizontal: 20)),
                                            textInputAction:
                                                TextInputAction.done,
                                            onFieldSubmitted: (_) {
                                              _continue();
                                            },
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Fill Username';
                                              }

                                              return null;
                                            },
                                            onSaved: (value) {
                                              _userInformation =
                                                  UserInformations(
                                                firstName:
                                                    _userInformation.firstName,
                                                lastName:
                                                    _userInformation.lastName,
                                                email: _userInformation.email,
                                                phoneNumber: _userInformation
                                                    .phoneNumber,
                                                password:
                                                    _userInformation.password,
                                                businessType: _userInformation
                                                    .businessType,
                                                clientTin:
                                                    _userInformation.clientTin,
                                                location:
                                                    _userInformation.location,
                                                username: value.toString(),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                        ],
                      )),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    width: double.infinity,
                    child: stepper.step == 0
                        ? ElevatedButton(
                            onPressed:
                                stepper.step == 0 ? stepper.next : _continue,
                            child: isLoading == false
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 18,
                                    ),
                                    child: isLoading
                                        ? const Center(
                                            child: CircularProgressIndicator())
                                        : Text(
                                            stepper.step == 1
                                                ? "Sign Up"
                                                : "Continue",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Poppins',
                                                fontSize: 18),
                                          ),
                                  )
                                : const SizedBox(
                                    width: 15,
                                    height: 15,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  ),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                primary: Theme.of(context).primaryColor),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        stepper.previous();
                                      },
                                      icon: const Icon(Icons.arrow_back),
                                    ),
                                    const Text("Back")
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                onPressed: _continue,
                                child: isLoading == false
                                    ? Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 18, horizontal: 30),
                                        child: Text(
                                          stepper.step == 1
                                              ? "Sign Up"
                                              : "Continue",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Poppins',
                                              fontSize: 18),
                                        ),
                                      )
                                    : const SizedBox(
                                        width: 15,
                                        height: 15,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      ),
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    primary: Theme.of(context).primaryColor),
                              ),
                            ],
                          ),
                  ),
                ),
                InkWell(
                  onTap: _goAndLoginHandler,
                  child: SingleChildScrollView(
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      child: const Text(
                        "Login",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}
