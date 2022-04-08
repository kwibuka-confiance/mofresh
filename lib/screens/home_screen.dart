import 'package:flutter/material.dart';
import 'package:mofresh/containers/changeContainerToColdBox.dart';
import 'package:mofresh/containers/coldboxes_container.dart';
import 'package:mofresh/screens/mofresh_market_screen.dart';
import 'package:mofresh/screens/profile_screen.dart';
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
  int selectedIndex = 0;

  void _selectedPage(int index) {
    setState(() {
      selectedIndex = index;
    });
    print(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _page = [
      storageHubScreen(),
      MoFreshMarketScreen(),
      storageHubScreen(),
      ProfileScreen()
    ];

    return Scaffold(
      drawer: const Drawer(
        child: SizedBox(
          child: Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
      ),
      // appBar: appBarController(
      //     context, () {}, "Mo Fresh", Colors.white, Colors.white, Colors.green),
      body: _page[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        currentIndex: selectedIndex,
        fixedColor: const Color.fromARGB(255, 0, 150, 20),
        unselectedItemColor: Colors.black54,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Hubs'),
          BottomNavigationBarItem(icon: Icon(Icons.storage), label: 'Storage'),
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Market'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Profile'),
        ],
      ),
    );
  }
}

class storageHubScreen extends StatelessWidget {
  const storageHubScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionSelectableWidget(),
          const SearchBarWidget(),
          ColdBoxesContainer()
        ],
      ),
    );
  }
}
