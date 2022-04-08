import 'package:flutter/material.dart';

class MarketItemWrapper extends StatelessWidget {
  String imageUrl;
  String title;
  String description;
  MarketItemWrapper(this.imageUrl, this.title, this.description, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromARGB(255, 228, 228, 228)),
          // color: Colors.amber,
          height: 250,
          width: MediaQuery.of(context).size.width * 0.5,
          child: Column(
            children: [
              Container(
                height: 140,
                width: MediaQuery.of(context).size.width * 0.5,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    color: Color.fromARGB(255, 228, 228, 228)),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Text(
                          title,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(
                        description,
                        // style: TextStyle(backgroundColor: Colors.amber),
                      ),
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Order",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Theme.of(context).primaryColorDark),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
