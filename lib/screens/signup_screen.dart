import 'package:flutter/material.dart';
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
      firstName: "", lastName: "", email: "", password: "");

  @override
  Widget build(BuildContext context) {
    void addToSignUpObjectHandler() {
      var validateForm = _form.currentState!.validate();
      _form.currentState!.save();
    }

    void _continue() {
      Navigator.of(context).pushNamed("/choose-company-status");
    }

    void _goAndLoginHandler() {
      Navigator.of(context).pushNamed("/login");
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 100, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Form(
                child: Container(
                  width: double.infinity,
                  child: Form(
                      key: _form,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Your Informations",
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.bold),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 20.0),
                            child: Text(
                                "Fill your all information about you inorder to complete your account"),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 10),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(305)),
                                      labelText: 'Enter your first name',
                                      labelStyle: const TextStyle(fontSize: 12),
                                      suffixIcon: const Icon(Icons.account_box),
                                      isDense: true,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 0, horizontal: 20)),
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
                                      lastName: _userInformation.lastName,
                                      email: _userInformation.email,
                                      password: _userInformation.password,
                                    );
                                  },
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
                                              borderRadius:
                                                  BorderRadius.circular(305)),
                                          labelText: 'Enter last name',
                                          suffixIcon:
                                              const Icon(Icons.account_box),
                                          labelStyle:
                                              const TextStyle(fontSize: 12),
                                          isDense: true,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  // vertical: 4,
                                                  horizontal: 20)),
                                      textInputAction: TextInputAction.next,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Fill the last name';
                                        }

                                        return null;
                                      },
                                      onSaved: (value) {
                                        _userInformation = UserInformations(
                                          firstName: _userInformation.firstName,
                                          lastName: value.toString(),
                                          email: _userInformation.email,
                                          password: _userInformation.password,
                                        );
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
                                              borderRadius:
                                                  BorderRadius.circular(305)),
                                          labelText: 'Enter email',
                                          suffixIcon:
                                              const Icon(Icons.account_box),
                                          labelStyle:
                                              const TextStyle(fontSize: 12),
                                          isDense: true,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  // vertical: 4,
                                                  horizontal: 20)),
                                      textInputAction: TextInputAction.next,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Fill your email';
                                        }

                                        return null;
                                      },
                                      onSaved: (value) {
                                        _userInformation = UserInformations(
                                          firstName: _userInformation.firstName,
                                          lastName: _userInformation.lastName,
                                          email: value.toString(),
                                          password: _userInformation.password,
                                        );
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
                                              borderRadius:
                                                  BorderRadius.circular(305)),
                                          labelText: 'Enter password',
                                          suffixIcon:
                                              const Icon(Icons.account_box),
                                          labelStyle:
                                              const TextStyle(fontSize: 12),
                                          isDense: true,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  // vertical: 4,
                                                  horizontal: 20)),
                                      textInputAction: TextInputAction.next,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Fill the password';
                                        }

                                        return null;
                                      },
                                      onSaved: (value) {
                                        _userInformation = UserInformations(
                                          firstName: _userInformation.firstName,
                                          lastName: _userInformation.lastName,
                                          email: value.toString(),
                                          password: _userInformation.password,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      child: ElevatedButton(
                        onPressed: _continue,
                        child: isLoading == false
                            ? const Padding(
                                padding: EdgeInsets.symmetric(vertical: 18),
                                child: Text(
                                  "Continue",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Poppins',
                                      fontSize: 18),
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
                                borderRadius: BorderRadius.circular(30)),
                            primary: Theme.of(context).primaryColor),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: _goAndLoginHandler,
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
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
