import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mofresh/models/coldBox.dart';
import 'package:mofresh/utils/URL.dart';
import 'package:mofresh/widgets/cold_box_widget.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:mofresh/widgets/shimmer_loader.dart';

class ColdBoxesContainer extends StatefulWidget {
  const ColdBoxesContainer({Key? key}) : super(key: key);

  @override
  State<ColdBoxesContainer> createState() => _ColdBoxesContainerState();
}

class _ColdBoxesContainerState extends State<ColdBoxesContainer> {
  void console(args) => print(args);
  bool isLoading = false;
  final List<ColdBox> coldBoxes = [];

  @override
  void initState() {
    gettingAllColdBoxesHandler();
    super.initState();
  }

  void gettingAllColdBoxesHandler() async {
    try {
      setState(() {
        isLoading = true;
      });
      var request =
          http.Request('GET', Uri.parse('${Mofresh().url}/storagesView'));

      http.StreamedResponse response = await request.send();

      console(request);
      var result = [];
      if (response.statusCode == 200) {
        result = jsonDecode(await response.stream.bytesToString());

        for (var element in result) {
          setState(() {
            isLoading = false;
            coldBoxes.add(ColdBox(
                id: element['id'].toString(),
                tags: element['storageTags'],
                districtName: element['districtName'].toString(),
                mainPhoto: element['mainPhoto'].toString(),
                provinceName: element['provinceName'].toString(),
                sectorName: element['sectorName'].toString(),
                storageName: element['storageName'].toString()));

            isLoading = false;
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
    return isLoading
        ? ShimmerSpinner()
        : ListView.builder(
            shrinkWrap: true,
            primary: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: coldBoxes.length,
            itemBuilder: (context, index) => ColdBoxContainer(
                coldBoxes[index].id,
                coldBoxes[index].tags,
                coldBoxes[index].districtName,
                coldBoxes[index].mainPhoto,
                coldBoxes[index].provinceName,
                coldBoxes[index].sectorName,
                coldBoxes[index].storageName));
  }
}
