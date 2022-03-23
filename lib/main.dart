import 'package:flutter/material.dart';
import 'package:mofresh/screens/coldbox_description_screen.dart';
import 'package:mofresh/screens/home_screen.dart';
import 'package:mofresh/utils/colors/colorswitch.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MaterialColor primayColor = MaterialColor(0xFF7CB211, color);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MoFresh',
      theme: ThemeData(
        primarySwatch: primayColor,
        fontFamily: 'Poppins',
      ),
      routes: {
        "/": (context) => const HomeScreen(),
        "/cold-box-description": (context) => const ColdBoxDescriptionScreen()
      },
    );
  }
}
