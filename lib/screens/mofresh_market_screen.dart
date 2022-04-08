import 'package:flutter/material.dart';
import 'package:mofresh/containers/changeContainerToColdBox.dart';
import 'package:mofresh/containers/mofresh_coldbox.dart';
import 'package:mofresh/widgets/searchbar_filter.dart';
import 'package:mofresh/widgets/sections.dart';
import 'package:mofresh/models/coldBox.dart';

class MoFreshMarketScreen extends StatefulWidget {
  const MoFreshMarketScreen({Key? key}) : super(key: key);

  @override
  State<MoFreshMarketScreen> createState() => _MoFreshMarketScreenState();
}

class _MoFreshMarketScreenState extends State<MoFreshMarketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Theme.of(context).primaryColorDark,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart))
          ],
          title: const Text("MoFresh")),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ChangToColdBoxSwitcher(),
              const SectionSelectableWidget(),
              // const SearchBarWidget(),
              MofreshColdBox(MOFRESH_BOX, "Mofresh Cold Box"),
              MofreshColdBox(MOFRESH_FRIDGE, "Mofresh Fridge"),
              MofreshColdBox(MOFRESH_CONTAINERS, "Mofresh Containers")
            ],
          ),
        ),
      ),
    );
  }
}
