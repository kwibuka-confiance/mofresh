import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mofresh/models/tag.dart';

class HomeScreenL extends StatefulWidget {
  const HomeScreenL({ Key? key }) : super(key: key);

  @override
  State<HomeScreenL> createState() => _HomeScreenLState();
}

class _HomeScreenLState extends State<HomeScreenL> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(children: [
          // Header
          Container(
            padding: const EdgeInsets.only(top: 40,right: 10,left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              
              Row(children: const[
              Text("Hello, ",style: TextStyle(fontSize: 25),),
              Text("Confiance",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              ],),
              Row(children: [
              Padding(
                padding: const EdgeInsets.only(right:10.0),
                child: CircleAvatar(maxRadius:20 ,backgroundColor: Theme.of(context).primaryColorDark,foregroundColor: Colors.white,child: IconButton(onPressed: (){},icon: const Icon(Icons.notifications,size: 18,),),),
              ),
              IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart,color: Theme.of(context).primaryColorDark,size: 30,))
              ],)
            ],),
          ),
            // Hubs
            Container(
              margin: const EdgeInsets.all(15),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration:  BoxDecoration(
                     borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(image: NetworkImage('https://kivu.mofresh.rw/img/gC5Z6xWmP9pez82f5Ua61HhRUXUqRHX5HB2AGnvN.jpg'),fit: BoxFit.cover) ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [                                                                                                                                                                                                                                         
              Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10,                                                    vertical: 10),                                    
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
                    child: Container(
                     decoration: BoxDecoration(
                       border: Border.all(width: 1,color: Colors.white.withOpacity(0.1),style: BorderStyle.solid),
                      color: Colors.white.withOpacity(0.1),                                        
                       borderRadius: BorderRadius.circular(15)),
                      // height: 100,
                      padding: const EdgeInsets.all(10),
                      child: Column(children: [                                
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [const Text("Mofresh Hub",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                      ElevatedButton(onPressed: (){},style: ButtonStyle(), child: const Text("Book Places",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)))
                      ],),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: const Text("KEEP YOUR PRODUCTIVITY SAFELY",style: TextStyle(color: Colors.white),),),
                          Row(
                            children: categoryList.map((e) => Container(
                               margin: const EdgeInsets.only(right: 5,top: 10),
                              child: Row(
                                
                                children: [
                                ClipRRect(
                                      borderRadius:BorderRadius.circular(4),
      
                                  child: SizedBox(                       
                                    height: 20,width: 20,child: Image.network(e.tagImage,fit: BoxFit.cover,),),
                                ),
                                // const Padding(
                                //   padding:  EdgeInsets.only(left:4.0),
                                //   child:  Text("Fruits",style: TextStyle(color: Colors.white),),
                                // )
                                ],),
                            )).toList(),),
                        ],
                      )
                      
                    ]),),
                  ),
                ),
              ),
              // todo BOXES Containers
            ]),),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                width: double.infinity ,
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
               const Text("Containers",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
               GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: 5
                    ,horizontal: 5),
                    decoration: BoxDecoration(
                      image: const DecorationImage(image: NetworkImage('https://kivu.mofresh.rw/img/73xtsZIh7o5lHE5JoVlm8o0kZt2gV7zcM3tC6OOC.jpg'),fit: BoxFit.cover),
                    color: const Color.fromARGB(255, 2, 77, 18),
                      borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [

                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 5,sigmaY: 5),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 49, 49, 49).withOpacity(0.3),
                                    borderRadius:BorderRadius.circular(10)),
                                  child: Column(
                                    children: [
                                     const Padding(
                                        padding:  EdgeInsets.all(8.0),
                                        child:  Text("COLD BOX",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                         Container(
                                           padding: const EdgeInsets.only(left: 10),
                                           width: 90,
                                           child: const Text('Available for Buy and Rents',style: TextStyle(color: Colors.white,fontSize: 13),),),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                            IconButton(onPressed: (){}, icon: const Icon(Icons.add_shopping_cart,color: Color.fromARGB(255, 226, 136, 0)))
                                          ],),
                                        ],
                                      )
                                    ],
                                  )),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  );
                },
              )
              ]) ,)
        ]),
      ),
    );
  }
}
