import 'package:flutter/material.dart';
import 'package:mofresh/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MoFresh',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {"/": (context) => const HomeScreen()},
    );
  }
}
