import 'package:flutter/material.dart';
import '../widgets/all_widgets.dart';

class PendingOrder extends StatefulWidget {
  PendingOrder({Key? key}) : super(key: key);

  @override
  _PendingOrderState createState() => _PendingOrderState();
}

class _PendingOrderState extends State<PendingOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tacos Tito"),
        leading: Icon(Icons.keyboard_backspace),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            onPressed: (){},
          ),
          
          SizedBox(width: 20,)
        ]
        
      ),
      body: ListView(
        children: [
          SizedBox(height: 35,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 15,),
              Text("Órdenes pendientes",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                ),
              ),
            ],
          ),
          SizedBox(height: 15,),
          
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            child: Column(
              children: [
                OrderView()
              ],
            ),
          ),
        ]
      ),
      floatingActionButton: new FloatingActionButton(
            onPressed: (){},
            child: Icon(Icons.chat),
            tooltip: "Chat",
            
          )
    );
  }
}