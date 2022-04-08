import 'package:flutter/material.dart';
import 'package:mofresh/models/tag.dart';

class ColdBoxContainerMarket extends StatelessWidget {
  String mainPhoto;
  String description;
  String title;

  ColdBoxContainerMarket(this.mainPhoto, this.title, this.description,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed("/cold-box-description", arguments: {
          "title": title,
          'mainPhoto': mainPhoto,
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
                  tag: 1,
                  child: FadeInImage(
                    placeholder: const AssetImage(
                        "assets/icons_and_placeholder/placeholderImage2.png"),
                    image: NetworkImage(mainPhoto),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.55,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
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
                      itemCount: categoryTags.length,
                      itemBuilder: ((context, index) => Container(
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(20)),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: Text(
                            categoryTags[index].tagName,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )))),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    description,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text(
                          "Order",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Theme.of(context).primaryColorDark),
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
