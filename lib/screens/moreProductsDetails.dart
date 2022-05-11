import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mofresh/models/tag.dart';

class MoreProductScreen extends StatefulWidget {
  const MoreProductScreen({ Key? key }) : super(key: key);

  @override
  State<MoreProductScreen> createState() => _MoreProductScreenState();
}

class _MoreProductScreenState extends State<MoreProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).primaryColorDark,
        backgroundColor: Colors.transparent,
 elevation: 0,
        title:const Text("Plates",style: TextStyle(fontWeight: FontWeight.bold),),
        actions: [ 
    IconButton(onPressed: (){}, icon: const Icon(Icons.notifications),),
    IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_cart),)
      ]),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Stack(children: [
        
        Container( 
                    margin: const EdgeInsets.only(top: 0,left: 20,right: 20),
          child: Column(
              
                crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  margin: const EdgeInsets.only(),
                  child: Text("Get Or Change Your Plates",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Theme.of(context).primaryColorDark),))
              
              ,Padding(
                padding: const EdgeInsets.only(bottom:18.0),
                child: Text("lorem ipsumhello word",style: TextStyle(color: Colors.orange[800]),),
              )
              ],),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
              child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                decoration: BoxDecoration(
                color: const Color.fromARGB(255, 151, 151, 151).withOpacity(0.4),
              // color: Colors.white,
                borderRadius: BorderRadius.circular(12)),
                child: Column(
                children: [
                Row( 
                  children: [
                const  CircleAvatar(child: Text("H"),),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children:  const [Text("Plate 1",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,),),const Text("Good Autoresponder",style: TextStyle(fontWeight: FontWeight.w100,),)],),
                   )
                ],),
               const Padding(
                  padding: const EdgeInsets.symmetric(vertical:8.0),
                  child: const Text("In publishing and graphic design, Lorem ipsum is a real In publishing and graphic design, Lorem ipsum is a real"),
                )
               ,ClipRRect(
                 borderRadius: BorderRadius.circular(10),
                 child: Container(
              
                   decoration: BoxDecoration(
                     color:Theme.of(context).primaryColorDark,borderRadius: BorderRadius.circular(10)),
                   width: double.infinity,
                   height: 200,
                   child: Image.network("https://kivu.mofresh.rw/img/mS3zTr8t1xNqjXLfanoqAh9mGVFu9otwWmorhVnn.jpg",fit: BoxFit.cover,),),
               )
              , Row( children: categoryList
                                      .map((e) => Container(
                                            margin: const EdgeInsets.only(
                                                right: 5, top: 10),
                                            child: Row(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  child: SizedBox(
                                                    height: 20,
                                                    width: 20,
                                                    child: Image.network(
                                                      e.tagImage,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                               
                                              ],
                                            ),
                                          ))
                                      .toList(),
                                ),
                      
                                Container(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right:8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                        color:Theme.of(context).primaryColorDark,
                                          borderRadius: BorderRadius.circular(5)),
                                        padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 20),
                                        child: Row(children: const [Padding(
                                          padding: EdgeInsets.only(right: 4.0),
                                          child: Icon(Icons.read_more,color: Colors.white,),
                                        ),   Text("Rent", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)],),),
                                    ),
                                      Container(
                                      decoration: BoxDecoration(
                                      color:Theme.of(context).primaryColorDark,
                                        borderRadius: BorderRadius.circular(5)),
                                      padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 20),
                                      child: Row(children: const [Padding(
                                        padding: EdgeInsets.only(right: 4.0),
                                        child: Icon(Icons.local_grocery_store_sharp,color: Colors.white,),
                                      ),   Text("Buy", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)],),),
                                  ],),
                                )
              ]),),
            ),
          )
        ]),)
      ]),
    );
  }
}