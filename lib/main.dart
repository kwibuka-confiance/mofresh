import 'package:flutter/material.dart';
import 'package:mofresh/containers/booking_containers/picking_booking_status_container.dart';
import 'package:mofresh/screens/booking_screen.dart';
import 'package:mofresh/screens/buy_product_detail_screen.dart';
import 'package:mofresh/screens/cart_page_screen.dart';
import 'package:mofresh/screens/choose-company-screen.dart';
import 'package:mofresh/screens/coldbox_description_screen.dart';
import 'package:mofresh/screens/dashboard.dart';
import 'package:mofresh/screens/home_screen.dart';
import 'package:mofresh/screens/login_screen.dart';
import 'package:mofresh/screens/mofresh_market_details_screen.dart';
import 'package:mofresh/screens/mofresh_market_screen.dart';
import 'package:mofresh/screens/notification_screen.dart';
import 'package:mofresh/screens/signup_screen.dart';
import 'package:mofresh/screens/successful_screen.dart';
import 'package:mofresh/screens/welcome_screen.dart';
import 'package:mofresh/ui_widgets/waiting-page.dart';
import 'package:mofresh/utils/colors/colorswitch.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late String routeNameGlobal = '/welcomes';
  late String usernameG = '';
  late String statusG = '';
  late String contactG = '';

  @override
  void initState() {
    getAvailableTokenHandler();
    super.initState();
  }

  getAvailableTokenHandler() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final String? username = pref.getString('username');
    final String? status = pref.getString('status');
    final String? contact = pref.getString('contact');
    final String? logged = pref.getString("logged");

    setState(() {
      usernameG = username!;
      statusG = status!;
      contactG = contact!;
    });

    routeDefined() {
      String routeName = '/welcomes';
      if (usernameG.isNotEmpty) {
        return "/home";
      }
      return routeName;
    }

    setState(() {
      routeNameGlobal = routeDefined();
    });
  }

  @override
  Widget build(BuildContext context) {
    print(routeNameGlobal);
    MaterialColor primayColor = MaterialColor(0xFF7CB211, color);
    print(contactG);
    print(usernameG);
    print(statusG);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MoFresh',
      theme: ThemeData(
        primarySwatch: primayColor,
        fontFamily: 'Poppins',
      ),
      home: WaitingPage(routeNameGlobal),
      routes: {
        "/welcomes": (context) => const WelcomeScreen(),
        "/sign-up": (context) => const SignUpStarted(),
        "/choose-company-status": (context) => const ChooseCompany(),
        "/login": (context) => const Login(),
        "/home": (context) => const HomeScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        "/cold-box-description": (context) => const ColdBoxDescriptionScreen(),
        "/booking-screen-status": (context) => const ChoosingBookingStatus(),
        "/booking-screen": (context) => const BookingScreen(),
        "/mofresh-market": (context) => const MoFreshMarketScreen(),
        "/mofresh-market-details": (context) => const MarketBoxDetailsScreen(),
        "/cart-screen": (context) => const CartScreen(),
        "/payment-sucess": (context) => const SuccessfulyScreen(),
        DashboardScreen.routeName: (context) => const NotificationScreen(),
        BuyProductDetailScreen.routeName : (context) => const BuyProductDetailScreen()
      },
    );
  }
}
