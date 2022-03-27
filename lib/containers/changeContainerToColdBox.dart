import 'package:flutter/material.dart';

class ChangToColdBoxSwitcher extends StatefulWidget {
  const ChangToColdBoxSwitcher({Key? key}) : super(key: key);

  @override
  State<ChangToColdBoxSwitcher> createState() => _ChangToColdBoxSwitcherState();
}

class _ChangToColdBoxSwitcherState extends State<ChangToColdBoxSwitcher>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      width: double.infinity,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Theme.of(context).primaryColorDark),
            child: Column(
              children: [
                TabBar(
                    controller: tabController,
                    labelColor: const Color.fromRGBO(253, 178, 24, 1),
                    unselectedLabelColor: Colors.white,
                    indicator: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25)),
                    tabs: const [
                      Tab(
                        text: "Cold Storage",
                      ),
                      Tab(
                        text: "Cold Box",
                      ),
                    ])
              ],
            ),
          ),
        ],
      ),
    );
  }
}
