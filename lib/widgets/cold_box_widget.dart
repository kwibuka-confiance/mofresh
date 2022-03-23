import 'package:flutter/material.dart';
import 'package:mofresh/models/tag.dart';

class ColdBoxContainer extends StatelessWidget {
  String id;
  String districtName;
  String mainPhoto;
  String provinceName;
  String sectorName;
  String storageName;
  String storageOverview;
  String tag;

  ColdBoxContainer(
      this.id,
      this.tag,
      this.districtName,
      this.mainPhoto,
      this.provinceName,
      this.sectorName,
      this.storageName,
      this.storageOverview,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed("/cold-box-description", arguments: {
          'id': id,
          "districtName": districtName,
          'mainPhoto': mainPhoto,
          'provinceName': provinceName,
          'sectorName': sectorName,
          'storageName': storageName,
          'tag': tag,
          'storageOverview': storageOverview
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 2),
              )
            ]),
        height: 150,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
              child: Container(
                color: Colors.white,
                height: double.infinity,
                width: MediaQuery.of(context).size.width * 0.35,
                child: Hero(
                  tag: id,
                  child: FadeInImage(
                    placeholder: const AssetImage(
                        "assets/icons_and_placeholder/placeholderImage2.png"),
                    image: NetworkImage("https://kivu.mofresh.rw/$mainPhoto"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.55,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    storageName,
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  // Container(
                  //   width: MediaQuery.of(context).size.width * 0.6,
                  //   child: Row(
                  //     mainAxisSize: MainAxisSize.min,
                  //     children: tagList
                  //         .map((index) => Container(
                  //             decoration: BoxDecoration(
                  //                 color: Colors.green,
                  //                 borderRadius: BorderRadius.circular(20)),
                  //             padding: const EdgeInsets.symmetric(
                  //                 vertical: 10, horizontal: 10),
                  //             child: Text(
                  //               index.tagName,
                  //               style: const TextStyle(
                  //                   color: Colors.white,
                  //                   fontWeight: FontWeight.bold),
                  //             )))
                  //         .toList(),
                  //   ),
                  // ),
                  GridView.builder(
                      shrinkWrap: true,
                      primary: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                              childAspectRatio: 2.5,
                              maxCrossAxisExtent: 100),
                      itemCount: tagList.length,
                      itemBuilder: ((context, index) => Container(
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(20)),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: Text(
                            tagList[index].tagName,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )))),
                  Text(
                    "$provinceName  $districtName",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
