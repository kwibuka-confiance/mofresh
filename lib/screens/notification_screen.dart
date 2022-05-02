import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({ Key? key }) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Notifications",),backgroundColor: Theme.of(context).primaryColorDark,foregroundColor: Colors.white,),
      body: Container(
        margin: const EdgeInsets.only(top: 50,left: 20,right: 20)
        ,child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: const [
        NotificationWiget("Humidity","Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga ",'now'),
        NotificationWiget("Temperature","Check your box is at risk",'2 days ago'),
        NotificationWiget("Rent","Check your box (3000B) Subscription is need to be upgraded ",'3 days ago'),
      
      ]),)
      
    );
  }
}

class NotificationWiget extends StatelessWidget {
  final String title;
  final String message;
  final String status;
  const NotificationWiget(this.title,this.message,this.status,{
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            
            decoration: BoxDecoration(
            color: Colors.grey[200],
              borderRadius: BorderRadius.circular(15)),
            padding:const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
            child:Column(
            crossAxisAlignment: CrossAxisAlignment.start
            ,children:  [
            Text(title,style:const TextStyle(fontWeight: FontWeight.bold)),
            Text(message)
          ],)),
          Padding(
            padding: const EdgeInsets.only(left:5.0),
            child: Text(status,style: const TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
          )
        ],
      ),
    );
  }
}