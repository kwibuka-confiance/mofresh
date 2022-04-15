import 'package:flutter/material.dart';
import 'package:mofresh/models/continueAs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChooseCompany extends StatefulWidget {
  const ChooseCompany({Key? key}) : super(key: key);

  @override
  State<ChooseCompany> createState() => _ChooseCompanyState();
}

class _ChooseCompanyState extends State<ChooseCompany> {
  List<CardsItems> cardsItems = [
    CardsItems(
        name: "INDIVIDUAL",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc, cras tempor leo lacus purus mauris. Ipsum id in dolor ",
        imageUrl: "assets/illustrations/Illustration - pavan 675.png"),
    CardsItems(
        name: "COMPANY",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc, cras tempor leo lacus purus mauris. Ipsum id in dolor ",
        imageUrl: "assets/illustrations/Group.png"),
    CardsItems(
        name: "COOPERATIVE",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc, cras tempor leo lacus purus mauris. Ipsum id in dolor ",
        imageUrl: "assets/illustrations/Illustration - Asset 30 1.png"),
  ];

  Widget continueAsWidget(
      BuildContext context, name, description, imageUrl, signUpArgs) {
    final clientContact = signUpArgs['clientContact'];
    final clientEmail = signUpArgs['clientEmail'];
    final clientUsername = signUpArgs['clientUsername'];
    final clientNames = signUpArgs['clientNames'];

    void sendToPreferences() async {
      SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.setString("username", clientUsername);
      await pref.setString("clientNames", clientNames);

      await pref.setString("contact", clientContact);
      await pref.setString("email", clientEmail);
      await pref.setString("status", name);
    }

    return InkWell(
      onTap: () async {
        if (name == "COMPANY" || name == "COOPERATIVE") {
          sendToPreferences();
          await Navigator.of(context).pushReplacementNamed('/home');
        } else {
          sendToPreferences();
          await Navigator.of(context).pushReplacementNamed('/mofresh-market');
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Material(
          elevation: 3,
          child: Container(
            padding: const EdgeInsets.all(10),
            height: 130,
            width: double.infinity,
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          fontSize: 20, height: 1.5, letterSpacing: 1),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      description,
                      style: const TextStyle(height: 1.5),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.30,
                child: Image.asset(imageUrl),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final signUpArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                "Continue as",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Column(
              children: cardsItems
                  .map((element) => continueAsWidget(context, element.name,
                      element.description, element.imageUrl, signUpArgs))
                  .toList(),
            ),
          ],
        ),
      ],
    ));
  }
}
