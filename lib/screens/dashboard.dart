import 'package:flutter/material.dart';
import 'package:mofresh/screens/buy_product_detail_screen.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../utils/financialDatas.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);
  static const routeName = '/notification';

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late List<ExpanseData> _chartData;
  late TooltipBehavior _tooltipBehavior;
  dynamic isModalOpen = false;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(isModalOpen);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Your Products"),
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).primaryColorDark,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(DashboardScreen.routeName);
              },
              icon: const Icon(Icons.notifications)),
          IconButton(
              onPressed: () {
                setState(() {
                  isModalOpen = !isModalOpen;
                });
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
                child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Container(
                        width: 120,
                        height: 110,
                        child: Image.network(
                          "https://kivu.mofresh.rw/img/1oYtgzozFKiAhngGzFTlcoQ93msPcute2mmx5kmE.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.55,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      children: const [
                                        Text(
                                          "Mo Fresh Grey ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        Text("( B001 )")
                                      ],
                                    ),
                                  ),
                                  const Text("100 * 100 CM"),
                                  const Text(
                                      "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,molestiae quas vel sint commodi repudiandae "),
                                ],
                              ),
                            ),
                            // adding ingredients
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 8.0, left: 5),
                          child: Text(
                            "Engredient Fit",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        Row(
                          children: [
                            Column(children: [
                              Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
                                  height: 50,
                                  width: 50,
                                  child: Image.network(
                                    "https://cdn.britannica.com/17/196817-050-6A15DAC3/vegetables.jpg",
                                    fit: BoxFit.cover,
                                  )),
                              const Text("Fruits")
                            ]),
                            Column(children: [
                              Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
                                  height: 50,
                                  width: 50,
                                  child: Image.network(
                                    "https://images.squarespace-cdn.com/content/v1/5c812e1b2727be1d59be0907/1584984891098-71YB1S4YX7OR7HIBV9K2/mixed+meat+3.PNG?format=2500w",
                                    fit: BoxFit.cover,
                                  )),
                              const Text("Meat")
                            ]),
                          ],
                        )
                      ],
                    ),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        height: 100,
                        width: 2,
                        color: Theme.of(context).primaryColorDark),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("Coldbox size",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text("120cm * 120cm")
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Temperature",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text("100 C")
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ]),
                ),
                Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    height: 300,
                    child: SfCartesianChart(
                      tooltipBehavior: _tooltipBehavior,
                      title: ChartTitle(
                          text: "Tracking Weekly Temperature",
                          textStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          )),
                      series: <ChartSeries>[
                        StackedAreaSeries<ExpanseData, String>(
                            color: Theme.of(context).primaryColorDark,
                            dataSource: _chartData,
                            xValueMapper: (ExpanseData expanseData, _) =>
                                expanseData.expenseCategory,
                            yValueMapper: (ExpanseData expanseData, _) =>
                                expanseData.jan)
                      ],
                      primaryXAxis: CategoryAxis(),
                    )),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            "Humidity (Now)",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                        ),
                        Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(right: 8),
                              color: const Color.fromARGB(255, 216, 216, 216),
                              height: 40,
                              width: double.infinity,
                              child: const Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    '23 °C',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                            ),
                            Container(
                              color: Theme.of(context).primaryColorDark,
                              height: 40,
                              width: MediaQuery.of(context).size.width * 0.4,
                            ),
                          ],
                        )
                      ]),
                )
              ],
            )),
            isModalOpen == true
                ? Align(
                    alignment: Alignment.topRight,
                    child: Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: const Color.fromARGB(255, 46, 46, 46)
                                      .withOpacity(0.3),
                                  offset: const Offset(0.0, 1.0),
                                  blurRadius: 3.0,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10)),
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Column(
                            children: [
                              // https://kivu.mofresh.rw/img/1oYtgzozFKiAhngGzFTlcoQ93msPcute2mmx5kmE.jpg
                              productTypeSelectionWidget(
                                  context,
                                  "1",
                                  "Mofresh Box",
                                  "https://kivu.mofresh.rw/box/3fDoYqoqTCY76MOOvwJPwcze0tebeksjxhmbRoYy.jpg",
                                  "Lorem ipsum dolor sit amet consectetur adipisicing elit."),
                              productTypeSelectionWidget(
                                  context,
                                  '2',
                                  "Mofresh Container",
                                  "https://kivu.mofresh.rw/box/iZbHsi7M68MXHq1UVK35X5vEDbI1pO6QBzjlOMSs.jpg",
                                  "Lorem ipsum dolor sit amet consectetur adipisicing elit. "),
                              productTypeSelectionWidget(
                                  context,
                                  '3',
                                  "Mofresh Fridge",
                                  "https://kivu.mofresh.rw/box/ajKsGIS7UrxvWD8Rrzp4t9LPBpvAl3aETIGKL3IK.jpg",
                                  "Lorem ipsum dolor sit amet consectetur adipisicing elit. "),
                              productTypeSelectionWidget(
                                  context,
                                  '4',
                                  "Mofresh Hub",
                                  "https://kivu.mofresh.rw/img/gC5Z6xWmP9pez82f5Ua61HhRUXUqRHX5HB2AGnvN.jpg",
                                  "Lorem ipsum dolor sit amet consectetur adipisicing elit. "),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  Widget productTypeSelectionWidget(
      BuildContext context,id, title, image, content) {
    return InkWell(
      onTap: () {
          Navigator.of(context).pushNamed(BuyProductDetailScreen.routeName,arguments: {
                "id": id,
                "tag": 'Fruit',
                "mainPhoto": image.toString().substring(0,23),
                "districtName":"Gasabo",
                "provinceName": "Kigali",
                "sectorName": "Kinyinya",
                "storageName": title,
                "storageOverview": content
          }); 
   
      },
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Row(
            children: [
              Container(
                height: 50,
                width: 50,
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: Text(
                          content,
                          style: const TextStyle(fontSize: 10),
                        ))
                  ],
                ),
              )
            ],
          )),
    );
  }
}
