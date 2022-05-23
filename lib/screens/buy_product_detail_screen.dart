import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mofresh/containers/certificate_features_container.dart';
import 'package:mofresh/containers/coldbox_features_type_container.dart';
import 'package:mofresh/containers/location_feature_container.dart';
import 'package:mofresh/containers/pricing_feature_container.dart';
import 'package:mofresh/containers/rating_feature_container.dart';
import 'package:mofresh/containers/services_features_container.dart';
import 'package:mofresh/models/coldBox.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:mofresh/widgets/booking_rent.dart';

class BuyProductDetailScreen extends StatefulWidget {
  const BuyProductDetailScreen({Key? key}) : super(key: key);
  static const routeName = 'buy-product';

  @override
  State<BuyProductDetailScreen> createState() => _BuyProductDetailScreenState();
}

class _BuyProductDetailScreenState extends State<BuyProductDetailScreen> {
  bool isExpanded = true;
  int finalActIdFinal = 0;

  void setExpandableWidgetHandler() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final coldBox = ColdBox(
        id: routeArg['id'],
        tags: routeArg['tag'],
        districtName: routeArg['districtName'],
        mainPhoto: routeArg['mainPhoto'],
        provinceName: routeArg['provinceName'],
        sectorName: routeArg['sectorName'],
        storageName: routeArg['storageName'],
        storageOverview: routeArg['storageOverview']);

    print(routeArg['id']);

    return Scaffold(
      body: Stack(
        children: [
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
                // floating: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: Hero(
                    tag: coldBox.id,
                    child: Image.network(
                      'https://kivu.mofresh.rw/${coldBox.mainPhoto}',
                      fit: BoxFit.cover,
                    ),
                  ),
                  centerTitle: false,
                  title: Container(
                      width: double.infinity,
                      child: Text(
                        coldBox.storageName,
                        style: const TextStyle(color: Colors.white),
                      )),
                ),
              ),
              SliverList(
                  delegate: SliverChildListDelegate([
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        coldBox.storageName,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColorDark),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          "${coldBox.provinceName}, ${coldBox.districtName}",
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(253, 178, 24, 1),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: setExpandableWidgetHandler,
                        child: RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                                text: isExpanded
                                    ? coldBox.storageOverview.substring(0, 400)
                                    : coldBox.storageOverview,
                                style: const TextStyle(
                                    color: Colors.black, height: 1.5),
                                children: [
                                  TextSpan(
                                      text: isExpanded
                                          ? '...  show more'
                                          : ' show less',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = setExpandableWidgetHandler),
                                ])),
                      )
                    ],
                  ),
                ),
                const ColdBoxfeatures(),
                Container(
                  height: 300,
                  margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: ContainedTabBarView(
                    tabBarProperties: TabBarProperties(
                        // isScrollable: false,
                        indicatorColor: Colors.amber,
                        labelColor: Theme.of(context).primaryColorDark,
                        labelStyle:
                            const TextStyle(fontWeight: FontWeight.bold),
                        unselectedLabelColor:
                            const Color.fromARGB(207, 0, 0, 0)),
                    tabs: const [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          'Location',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          "Pricing",
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          "Certificates",
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          "Services",
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          "Rating",
                        ),
                      ),
                    ],
                    views: const [
                      LocationContainer(),
                      PricingContainer(),
                      CertificateContainer(),
                      ServicesContainer(),
                      RatingContainer(),
                    ],
                    // ignore: avoid_print
                    onChange: (index) => print(index),
                    initialIndex: finalActIdFinal,
                  ),
                ),
                const SizedBox(
                  height: 60,
                )
              ])),
            ],
          ),
        const  Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: BookingOrRent(),
          )
        ],
      ),
    );
  }
}
