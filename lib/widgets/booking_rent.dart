import 'package:flutter/material.dart';
import 'package:mofresh/ui_widgets/buyHubSpace.dart';

class BookingOrRent extends StatelessWidget {
  const BookingOrRent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void rentBoxHandler() {
      showModalBottomSheet(
          // isScrollControlled: true,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
            top: Radius.circular(25),
          )),
          context: context,
          builder: (_) {
            // return  ProductRent(boxData.name,boxData.rentPrice);
            return HubRentSpace('productTitle', '12000');
          });
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: ElevatedButton(
        onPressed: rentBoxHandler,
        child: const Text("Book Now"),
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            padding: const EdgeInsets.all(20)),
      ),
    );
  }
}
