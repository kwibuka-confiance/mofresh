import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mofresh/containers/changeContainerToColdBox.dart';
import 'package:mofresh/containers/mofresh_coldbox.dart';
import 'package:mofresh/utils/URL.dart';
import 'package:mofresh/widgets/searchbar_filter.dart';
import 'package:mofresh/widgets/sections.dart';
import 'package:mofresh/models/coldBox.dart';
import 'package:http/http.dart' as http;
import 'package:mofresh/widgets/shimmer_loader.dart';

class MoFreshMarketScreen extends StatefulWidget {
  const MoFreshMarketScreen({Key? key}) : super(key: key);

  @override
  State<MoFreshMarketScreen> createState() => _MoFreshMarketScreenState();
}

class _MoFreshMarketScreenState extends State<MoFreshMarketScreen> {
  bool isBoxLoading = false;
  bool isFridgeLoading = false;
  bool isContainerLoading = false;
  final List<Box> _coldBoxes = [];
  final List<Box> _coldFridge = [];
  final List<BoxContainer> _coldContainer = [];
  void console(args) => print(args);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gettingAllColdBoxesHandler();
    gettingAllColdFridgeHandler();
    gettingAllContainersHandler();
  }

  void gettingAllColdBoxesHandler() async {
    try {
      setState(() {
        isBoxLoading = true;
      });
      var request = http.Request('GET', Uri.parse('${Mofresh.url2}viewBox'));

      http.StreamedResponse response = await request.send();

      console(request);
      var result = [];
      if (response.statusCode == 200) {
        result = jsonDecode(await response.stream.bytesToString());

        for (var element in result) {
          setState(() {
            isBoxLoading = false;
            _coldBoxes.add(Box(
                id: element['id'],
                mainPhoto: element['boxMainPhoto'],
                storageName: element['storageName'],
                description: element['description']));

            isBoxLoading = false;
          });
        }
      } else {
        console(response.reasonPhrase);
      }
    } catch (error) {
      console(error);
    }
  }

  void gettingAllColdFridgeHandler() async {
    try {
      setState(() {
        isFridgeLoading = true;
      });
      var request =
          http.Request('GET', Uri.parse('${Mofresh.url2}simpleSpaces'));

      http.StreamedResponse response = await request.send();

      console(request);
      var result = [];
      if (response.statusCode == 200) {
        result = jsonDecode(await response.stream.bytesToString());

        for (var element in result) {
          setState(() {
            isFridgeLoading = false;
            _coldFridge.add(Box(
                id: element['id'],
                mainPhoto: element['mainPhoto'],
                storageName: element['storageName'],
                description: element['storageOverview']));

            isFridgeLoading = false;
          });
        }
      } else {
        console(response.reasonPhrase);
      }
    } catch (error) {
      console(error);
    }
  }

  void gettingAllContainersHandler() async {
    try {
      setState(() {
        isContainerLoading = true;
      });
      var request = http.Request('GET', Uri.parse('${Mofresh.url2}viewBox'));

      http.StreamedResponse response = await request.send();

      console(request);
      var result = [];
      if (response.statusCode == 200) {
        result = jsonDecode(await response.stream.bytesToString());

        for (var element in result) {
          setState(() {
            isContainerLoading = false;
            _coldContainer.add(BoxContainer(
                id: element['id'],
                mainPhoto: element['mainPhoto'],
                storageName: element['storageName'],
                description: element['storageOverview']));

            isContainerLoading = false;
          });
        }
      } else {
        console(response.reasonPhrase);
      }
    } catch (error) {
      console(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    console(_coldBoxes);
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
              MofreshColdBox(_coldBoxes, "Mofresh Cold Box", isBoxLoading),
              MofreshColdBox(_coldFridge, "Mofresh Fridge", isFridgeLoading),
              MofreshColdBox(
                  _coldContainer, "Mofresh Containers", isContainerLoading)
            ],
          ),
        ),
      ),
    );
  }
}
