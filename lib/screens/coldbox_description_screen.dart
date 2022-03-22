import 'package:flutter/material.dart';
import 'package:mofresh/models/coldBox.dart';

class ColdBoxDescriptionScreen extends StatefulWidget {
  const ColdBoxDescriptionScreen({Key? key}) : super(key: key);

  @override
  State<ColdBoxDescriptionScreen> createState() =>
      _ColdBoxDescriptionScreenState();
}

class _ColdBoxDescriptionScreenState extends State<ColdBoxDescriptionScreen> {
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
        storageName: routeArg['storageName']);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: Icon(Icons.menu),
            expandedHeight: 250,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: coldBox.id,
                child: Image.network(
                  'https://kivu.mofresh.rw/${coldBox.mainPhoto}',
                  fit: BoxFit.cover,
                ),
              ),
              title: Container(child: Text(coldBox.storageName)),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coldBox.storageName,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                  Text(
                    "${coldBox.provinceName}, ${coldBox.districtName}",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).secondaryHeaderColor),
                  ),
                ],
              ),
            )
          ]))
        ],
      ),
    );
  }
}
