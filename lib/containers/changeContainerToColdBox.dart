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
    tabController = TabController(length: 4, vsync: this);
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
      margin: const EdgeInsets.only(top: 50, bottom: 20),
      width: double.infinity,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            // width: MediaQuery.of(context).size.width,
            // decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(25), color: Colors.cyan),
            child: Column(
              children: [
                TabBar(
                    controller: tabController,
                    labelColor: Color.fromARGB(255, 255, 255, 255),
                    unselectedLabelColor: Colors.black,
                    indicator: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        borderRadius: BorderRadius.circular(25)),
                    tabs: const [
                      Tab(
                        text: "Cold Box",
                      ),
                      Tab(
                        text: "Fridge",
                      ),
                      Tab(
                        text: "Containers",
                      ),
                      Tab(
                        text: "Plate",
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
