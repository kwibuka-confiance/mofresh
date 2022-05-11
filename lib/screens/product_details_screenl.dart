import 'package:flutter/material.dart';
import 'package:mofresh/models/tag.dart';

class ProductDetailsScreenL extends StatefulWidget {
  const ProductDetailsScreenL({Key? key}) : super(key: key);
  static const routeName = '/description_details_product';
  @override
  State<ProductDetailsScreenL> createState() => _ProductDetailsScreenLState();
}

class _ProductDetailsScreenLState extends State<ProductDetailsScreenL> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                elevation: 0,
                // foregroundColor: Theme.of(context).primaryColorDark,
                backgroundColor: Color.fromARGB(255, 255, 255, 255),
                leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back),
                  // color: Theme.of(context).primaryColorDark,
                ),
                expandedHeight: 300,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    background: Hero(
                  tag: '1',
                  child: Container(
                      child: Image.network(
                          "https://kivu.mofresh.rw/img/mS3zTr8t1xNqjXLfanoqAh9mGVFu9otwWmorhVnn.jpg",fit: BoxFit.cover,)),
                )),
                actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_cart),
                )
              ],
             
              ),

              // BODY
              SliverList(delegate: SliverChildListDelegate([
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width ,
                  margin:const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  child: Wrap(
                    direction: Axis.horizontal,
                    spacing: 3,
                    runSpacing: 5,
                    children: categoryList.map((e) => Container(
                      
                      margin: const EdgeInsets.only(left: 3),
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical:1),
                      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                      child:  Text(e.tagName),),).toList(),)),

                      Container(
                        margin: const EdgeInsets.only(top: 10,left: 14, right: 10,bottom: 10),
                        color: Colors.black,height: .3,),

                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: 
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                        
                        Container(child: Column(children: [
                        Icon(Icons.ten_mp_rounded),
                        Text("Temperature",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 13))
                      ]),),

                       Container(child: Column(children: [
                        Icon(Icons.ten_mp_rounded),
                        Text("Temperature",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 13))
                      ]),),


                       Container(child: Column(children: [
                        Icon(Icons.ten_mp_rounded),
                        Text("Temperature",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 13))
                      ]),),
                      
                      ],)
                      ,),
                       Container(
                        margin: const EdgeInsets.only(top: 10,left: 14, right: 10,bottom: 10),
                        color: Colors.black,height: .3,),

                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                          child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical:8.0),
                            child: Text("Description",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                          ),
                          Text("Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitiamolestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit tenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitiamolestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit tenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,"),  
                          Text("Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitiamolestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit tenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitiamolestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit tenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,"),                    ]),),
                          
                                            ]),)
                          

            ],
          ),

          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              decoration: BoxDecoration(
              color: const Color.fromRGBO(4, 141, 42, 1),
                borderRadius: BorderRadius.circular(12)),
              margin: const  EdgeInsets.symmetric(vertical: 20,horizontal: 20),
              padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
              child: 
          Row(children: [
            Text("Buy"),
            Text("Rent")
          ]),))
        ],
      ),
    );
  }
}
