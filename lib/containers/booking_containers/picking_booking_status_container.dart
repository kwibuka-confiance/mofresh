import 'package:flutter/material.dart';
import 'package:mofresh/models/booking_status.dart';

class ChoosingBookingStatus extends StatelessWidget {
  const ChoosingBookingStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                  child:
                      Image.asset("assets/icons_and_placeholder/mofresh.png"),
                ),
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Continue as",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    children: bookingStatus
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6.0),
                            child: Container(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    primary: Colors.white),
                                onPressed: () {
                                  Navigator.of(context).pushNamed(
                                      "/booking-screen",
                                      arguments: {"id": e.status});
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Text(
                                    e.status.toUpperCase(),
                                    style: TextStyle(
                                        color:
                                            Theme.of(context).primaryColorDark,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
