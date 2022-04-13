import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mofresh/containers/coldbox_features_type_container.dart';
import 'package:mofresh/utils/URL.dart';
import 'package:mofresh/widgets/booking_rent.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:indexed/indexed.dart';

class MarketBoxDetailsScreen extends StatefulWidget {
  const MarketBoxDetailsScreen({Key? key}) : super(key: key);

  @override
  State<MarketBoxDetailsScreen> createState() => _MarketBoxDetailsScreenState();
}

class _MarketBoxDetailsScreenState extends State<MarketBoxDetailsScreen> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final title = routeArgs['title'];
    final description = routeArgs['description'];
    final imageUrl = "${Mofresh.imageUrlAPI}${routeArgs['imageUrl']}";

    final List _imageUrls = [imageUrl, imageUrl, imageUrl];

    return Scaffold(
      body: Stack(children: [
        CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: const Color.fromRGBO(4, 141, 42, 1),
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back),
                color: Colors.white,
              ),
              expandedHeight: 250,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: 1,
                  child: Indexer(
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                            height: 290,
                            viewportFraction: 1,
                            onPageChanged: ((index, reason) => {
                                  setState(
                                    () => activeIndex = index,
                                  )
                                })),
                        items: _imageUrls.map((contents) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 0),
                                  child: Image.network(
                                    contents,
                                    fit: BoxFit.cover,
                                  ));
                            },
                          );
                        }).toList(),
                      ),
                      Indexed(
                        index: 100,
                        child: Positioned(
                          bottom: 10,
                          width: MediaQuery.of(context).size.width,
                          child: Align(
                            alignment: Alignment.center,
                            child: AnimatedSmoothIndicator(
                              activeIndex: activeIndex,
                              count: _imageUrls.length,
                              effect: const WormEffect(
                                  activeDotColor: Colors.green),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                centerTitle: false,
                title: Container(
                    width: double.infinity,
                    child: Text(
                      title,
                      style: const TextStyle(color: Colors.white),
                    )),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Container(
                padding: const EdgeInsets.only(
                    top: 10, left: 10, right: 10, bottom: 20),
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromRGBO(217, 225, 228, 1)),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10),
                      child: Text("Description",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                    ),
                    Text(
                      description,
                      style: const TextStyle(fontSize: 17),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
              const ColdBoxfeatures(),
            ]))
          ],
        ),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BookingOrRent("Buy", "Rent", "order")),
      ]),
    );
  }
}
