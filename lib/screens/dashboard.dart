import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../utils/financialDatas.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
    late List<ExpanseData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Your Products"),
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).primaryColorDark,
      ),
      body: SingleChildScrollView(
        child: Container(child: Column(
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
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 8.0),
                                      child: Text(
                                        "Mo Fresh Grey",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    ),
                                    Text("100 * 100 CM"),
                                    Text("Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,molestiae quas vel sint commodi repudiandae "),
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
           padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
           decoration: BoxDecoration(
             color: Colors.grey[200],
             borderRadius: BorderRadius.circular(20)),
           child: Row(children: [
           Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
             const Padding(
               padding:  EdgeInsets.only(bottom:8.0,left: 5),
               child:  Text("Engredient Fit",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
             ),
             Row(children: [
               Column(children:[
                 Container(
                   margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                   height: 50,width: 50,child: Image.network("https://cdn.britannica.com/17/196817-050-6A15DAC3/vegetables.jpg",fit: BoxFit.cover,)),
                 const Text("Fruits")
               ]),
                Column(children:[
                 Container(
                   margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                   height: 50,width: 50,child: Image.network("https://cdn.britannica.com/17/196817-050-6A15DAC3/vegetables.jpg",fit: BoxFit.cover,)),
                 const Text("Fruits")
               ]),
             ],)
           ],),
            Container(margin: const EdgeInsets.symmetric(horizontal: 10),height: 100,width: 2,color:Theme.of(context).primaryColorDark),
            Column(children: [
              Container(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const[
                Text("Coldbox size",style: TextStyle(fontWeight: FontWeight.bold) ),
                Text("120cm * 120cm")
                ],),),
                       Column(children: [
              Container(
                 padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const[
                Text("Temperature",style: TextStyle(fontWeight: FontWeight.bold),),
                Text("100 C")
                ],),)
            ],)
            ],)
         ]),),
      
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              height: 300,
              child: SfCartesianChart(
                tooltipBehavior: _tooltipBehavior,
                title: ChartTitle(
                    text: "Tracking Weekly",
                    textStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,)),
                series: <ChartSeries>[
                  StackedAreaSeries<ExpanseData, String>(
                      color: Colors.lightGreen,
                      dataSource: _chartData,
                      xValueMapper: (ExpanseData expanseData, _) =>
                          expanseData.expenseCategory,
                      yValueMapper: (ExpanseData expanseData, _) =>
                          expanseData.jan)
                ],
                primaryXAxis: CategoryAxis(),
              )),
          ],
        )),
      ),
    );
  }
}
