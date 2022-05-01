import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Your Products"),
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).primaryColorDark,
      ),
      body: Container(child: Column(
        children: [
          Container(
                  width: MediaQuery.of(context).size.width,
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
                        // height: 110,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              
                             width: MediaQuery.of(context).size.width * 0.55,
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
                                  Text("Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,molestiae quas vel sint commodi repudiandae "),
                                ],
                              ),
                            ),
                           
                          ],
                        ),
                      )
                    ],
                  ),
                )
        ],
      )),
    );
  }
}
