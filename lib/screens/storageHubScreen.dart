
import 'package:flutter/material.dart';
import 'package:mofresh/containers/coldboxes_container.dart';
import 'package:mofresh/widgets/searchbar_filter.dart';
import 'package:mofresh/widgets/sections.dart';
class StorageHubScreen extends StatelessWidget {
  static const routeName = '/hubs';
  const StorageHubScreen({
    Key? key,
  }) : super(key: key);

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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionSelectableWidget(),
              const SearchBarWidget(),
              ColdBoxesContainer()
            ],
          ),
        ),
      ),
    );
  }
}
