import 'package:flutter/material.dart';
import 'package:mofresh/containers/booking_containers/picking_booking_status_container.dart';
import 'package:mofresh/screens/booking_screen.dart';
import 'package:mofresh/screens/choose-company-screen.dart';
import 'package:mofresh/screens/coldbox_description_screen.dart';
import 'package:mofresh/screens/home_screen.dart';
import 'package:mofresh/screens/login_screen.dart';
import 'package:mofresh/screens/mobox_market_screen.dart';
import 'package:mofresh/screens/signup_screen.dart';
import 'package:mofresh/screens/welcome_screen.dart';
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
        "/": (context) => const WelcomeScreen(),
        "/sign-up": (context) => const SignUpStarted(),
        "/choose-company-status": (context) => const ChooseCompany(),
        "/login": (context) => const Login(),
        "/home": (context) => const HomeScreen(),
        "/cold-box-description": (context) => const ColdBoxDescriptionScreen(),
        "/booking-screen-status": (context) => const ChoosingBookingStatus(),
        "/booking-screen": (context) => const BookingScreen(),
        "/mofresh-market": (context) => const MoFreshMaerketScreen()
      },
    );
  }
}
