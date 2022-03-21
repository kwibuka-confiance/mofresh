import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({Key? key}) : super(key: key);

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.78,
            child: TextField(
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.green,
                ),
                prefixStyle: const TextStyle(
                    backgroundColor: Colors.green, color: Colors.yellow),
                hintText: 'Search cold box',
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.green.withOpacity(0.3), width: 1.0),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.green.withOpacity(0.5), width: 2.0),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    width: 1,
                    color: Colors.green.withOpacity(0.3),
                    style: BorderStyle.solid)),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.filter_alt_outlined,
                color: Colors.green,
              ),
            ),
          )
        ],
      ),
    );
  }
}
