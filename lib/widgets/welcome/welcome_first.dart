import 'package:flutter/material.dart';

class FirstWelcomeWidget extends StatelessWidget {
  String title;
  String description;
  String imageUrl;
  FirstWelcomeWidget(this.title, this.description, this.imageUrl, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              title,
              style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 40),
            ),
          ),
          Text(
            description,
            style: const TextStyle(
              fontSize: 20,
              height: 1.5,
            ),
            textAlign: TextAlign.justify,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: const EdgeInsets.only(top: 20),
              child: Image.asset(imageUrl),
            ),
          )
        ],
      ),
    );
  }
}
