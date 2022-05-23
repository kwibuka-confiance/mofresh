import 'package:flutter/material.dart';


class BookingOrRent extends StatelessWidget {

 const  BookingOrRent(
   {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
      child: ElevatedButton(onPressed: () {}, child: const Text("Book Now"),style: ElevatedButton.styleFrom(
       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
       padding: const EdgeInsets.all(20) 
      ),),
    );
  }
}
