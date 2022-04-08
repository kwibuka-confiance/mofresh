import 'package:flutter/material.dart';

class BookingOrRent extends StatelessWidget {
  String leftAction;
  String rightAction;
  String action;
  BookingOrRent(
    this.rightAction,
    this.leftAction,
    this.action, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void buyButtonClickedHandler() {
      Navigator.of(context).pushNamed("/cart-screen");
    }

    void rentButtonClickedHandler() {
      Navigator.of(context).pushNamed("/cart-screen");
    }

    return GestureDetector(
      onTap: () {
        if (action == "booking") {
          Navigator.of(context).pushNamed("/booking-screen");
        } else {
          return;
        }
      },
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          width: 100,
          decoration: BoxDecoration(
              backgroundBlendMode: BlendMode.color,
              borderRadius: BorderRadius.circular(40),
              color: Theme.of(context).primaryColorDark,
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).primaryColorDark,
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(3, 1),
                )
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  if (action != "booking") {
                    buyButtonClickedHandler();
                  } else {
                    return;
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    child: Text(
                      rightAction,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                height: 20,
                width: 1,
              ),
              action != "booking"
                  ? GestureDetector(
                      onTap: () {
                        if (action != "booking") {
                          rentButtonClickedHandler();
                        } else {
                          return;
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: SizedBox(
                          child: Text(
                            "Rent",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Column(
                        children: [
                          Text(
                            "Price Per box",
                            style: TextStyle(
                                fontSize: 10,
                                color: const Color.fromARGB(255, 255, 255, 255)
                                    .withOpacity(0.7)),
                          ),
                          const Text(
                            "23,000 RWF",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          Text(
                            "1 Month",
                            style: TextStyle(
                                fontSize: 10,
                                color: const Color.fromARGB(255, 255, 255, 255)
                                    .withOpacity(0.7)),
                          )
                        ],
                      ),
                    ),
            ],
          )),
    );
  }
}
