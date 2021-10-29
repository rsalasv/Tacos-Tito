import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tacos Tito", style: TextStyle(color: Colors.white,)),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.receipt,
              color: Colors.white,
            ),
            onPressed: (){},
          ),
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
          Row(
            children: <Widget>[
              Expanded(
                flex: 4, // 20%
                child: Container(
                  child: Column(children: [
                      Container(height: 150, color: Colors.yellow),
                      Container(height: 150, color: Colors.cyan),
                      Container(height: 150, color: Colors.red),
                    ],
                  )
                ),
                
              ),
              Expanded(
                flex: 6, // 60%
                child: Container(
                  height: 450, 
                  color: Colors.green,
                ),
              ),
            ], 
          ),
          SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: (){},
                child: Text("Ordenar ahora",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 60),
                )
              ),
            ],
          ),
        ],
        
      ),
      floatingActionButton: new FloatingActionButton(
            onPressed: (){},
            child: Icon(Icons.shopping_cart_outlined, color: Colors.white,),
            tooltip: "Carrito de compras",
            
          )
    );
  }
}