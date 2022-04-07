import 'package:flutter/material.dart';
import 'package:mofresh/ui_widgets/button.dart';
import 'package:mofresh/widgets/welcome/welcome_first.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int activeIndex = 0;
  final pages = [
    FirstWelcomeWidget(
        "Welcome",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc, cras tempor leo lacus purus mauris. Ipsum id in dolor est vitae et habitasse cum.",
        "assets/illustrations/Group 140.png"),
    FirstWelcomeWidget(
        "About us",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc, cras tempor leo lacus purus mauris. Ipsum id in dolor est vitae et habitasse cum.",
        "assets/illustrations/Group 17.png"),
    FirstWelcomeWidget(
        "What we help",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc, cras tempor leo lacus purus mauris. Ipsum id in dolor est vitae et habitasse cum.",
        "assets/illustrations/The Munchies Table for Three.png"),
  ];
  @override
  Widget build(BuildContext context) {
    void signupButtonHandler() {
      print("swiftmotion is Here");
    }

    void _loginNavigationHandler() {
      print("Confiance");
    }

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          Center(
            child: CarouselSlider(
              options: CarouselOptions(
                  height: 400.0,
                  viewportFraction: 1,
                  onPageChanged: ((index, reason) => {
                        setState(
                          () => activeIndex = index,
                        )
                      })),
              items: pages.map((contents) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: contents);
                  },
                );
              }).toList(),
            ),
          ),
          Center(
            child: AnimatedSmoothIndicator(
              activeIndex: activeIndex,
              count: pages.length,
              effect: const WormEffect(activeDotColor: Colors.green),
            ),
          ),
          Container(
            child: Button(signupButtonHandler),
          ),
          InkWell(
              onTap: _loginNavigationHandler,
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 20),
                ),
              ))
        ],
      ),
    );
  }
}
