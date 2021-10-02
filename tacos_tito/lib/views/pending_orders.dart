import 'package:flutter/material.dart';

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
                SizedBox(height: 15,),
                ListTile(
                  leading: Text("Ficha #47",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.grey
                    ),),
                  title: Text("Ricardo Salas",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17
                    ),
                  ),
                  subtitle: Text("Cortijo de San Agustín, Camino del labrador #13"),
                ),
                ListTile(
                      leading: Icon(Icons.watch_later),
                      title: Padding(
                        padding: EdgeInsets.only(right: 24),
                        child: Text("03/11/2021 - 14:39"),
                      ),
                    ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    SizedBox(width: 15,),
                    Text("Plato 1",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    
                    SizedBox(width: 15,),
                    Container(
                      height: 37.0,
                      width: 220.0,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.all(Radius.circular(5)),),
                      child: Center(
                        child:new Text("5 Adobada (\$13c/u)", 
                        style: TextStyle(fontSize: 17,),
                      ),
                      )
                    ),
                  ]
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(width: 15,),
                    Container(
                      height: 37.0,
                      width: 220.0,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.all(Radius.circular(7)),),
                      child: Center(
                        child:new Text("3 Asada (\$13c/u)", 
                        style: TextStyle(fontSize: 17,),
                      ),
                      )
                    )
                  ]
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    
                    Text("Total: \$104.00",
                      style: TextStyle(
                        fontSize: 17,

                      ),
                      textAlign: TextAlign.right,
                    ),
                    SizedBox(width: 15,),
                  ],
                ),
                SizedBox(height: 15,),
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