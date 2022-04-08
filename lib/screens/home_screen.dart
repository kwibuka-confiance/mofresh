import 'package:flutter/material.dart';
import 'package:mofresh/containers/changeContainerToColdBox.dart';
import 'package:mofresh/containers/coldboxes_container.dart';
import 'package:mofresh/widgets/app_bar.dart';
import 'package:mofresh/widgets/cold_box_widget.dart';
import 'package:mofresh/widgets/searchbar_filter.dart';
import 'package:mofresh/widgets/sections.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: SizedBox(
          child: Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
      ),
      appBar: appBarController(
          context, () {}, "Mo Fresh", Colors.white, Colors.white, Colors.green),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionSelectableWidget(),
            const SearchBarWidget(),
            ColdBoxesContainer()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // onTap: _selectedPage,
        // currentIndex: selectedIndex,
        fixedColor: Colors.black,
        unselectedItemColor: Colors.black54,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Hubs'),
          BottomNavigationBarItem(icon: Icon(Icons.feed), label: 'Storage'),
          BottomNavigationBarItem(icon: Icon(Icons.feed), label: 'Market'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Profile'),
        ],
      ),
    );
  }
}
