import 'package:flutter/material.dart';
import 'package:mofresh/containers/booking_containers/picking_booking_status_container.dart';
import 'package:mofresh/containers/booking_containers/signup_creation_container.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(
                height: 100,
              ),
              SignUp()
            ],
          ),
        ),
      ),
    );
  }
}
