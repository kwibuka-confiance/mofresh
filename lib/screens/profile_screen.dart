import 'package:flutter/material.dart';
import 'package:mofresh/models/userTask.dart';
import 'package:mofresh/widgets/profilewidget.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? username = 'Kwibuka Confiance';

  late String usernameG = '';
  late String statusG = '';
  late String contactG = '';
  late String clientNamesG = '';
  @override
  void initState() {
    super.initState();

    void getUser() async {
      SharedPreferences pref = await SharedPreferences.getInstance();
      final String? username = pref.getString('username');
      final String? status = pref.getString('status');
      final String? contact = pref.getString('contact');
      final String? clientNames = pref.getString('clientNames');
      setState(() {
        usernameG = username!;
        statusG = status!;
        contactG = contact!;
        clientNamesG = clientNames!;
      });
    }

    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.loose,
      children: [
        Positioned(
          width: MediaQuery.of(context).size.width,
          top: 0,
          child: Container(
            padding: const EdgeInsets.only(top: 60),
            constraints: const BoxConstraints(minHeight: 200),
            color: Theme.of(context).primaryColorDark,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(left: 28.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              clientNamesG.toUpperCase(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: Icon(
                                  Icons.email,
                                  color: Colors.white,
                                  size: 12,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  usernameG,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ]),
          ),
        ),
        Positioned(
          width: MediaQuery.of(context).size.width,
          top: MediaQuery.of(context).size.height * 0.3,
          child: Container(
            padding: const EdgeInsets.only(top: 40),
            child: ListView.builder(
                primary: true,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: userList.length,
                itemBuilder: (context, index) => UserTaskWidget(
                    userList[index].id,
                    userList[index].icon,
                    userList[index].name)),
          ),
        ),
        Positioned(
            width: MediaQuery.of(context).size.width,
            top: 160,
            child: CircleAvatar(
              minRadius: 40,
              child: Text(
                username!.substring(0, 2).toUpperCase(),
                style:
                    const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              ),
              backgroundColor: const Color.fromARGB(255, 158, 156, 156),
            )),
      ],
    );
  }
}
