import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:indexed/indexed.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({ Key? key }) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
   int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
     final List _imageUrls = ["https://kivu.mofresh.rw/img/mS3zTr8t1xNqjXLfanoqAh9mGVFu9otwWmorhVnn.jpg", "https://kivu.mofresh.rw/img/mS3zTr8t1xNqjXLfanoqAh9mGVFu9otwWmorhVnn.jpg", "https://kivu.mofresh.rw/img/mS3zTr8t1xNqjXLfanoqAh9mGVFu9otwWmorhVnn.jpg"];
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
                      "Hello",
                      style: const TextStyle(color: Colors.white),
                    )),
              ),
            ),
          ],
        )
      ]),
    );
  }
}