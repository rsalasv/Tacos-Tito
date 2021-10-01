import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateOrder extends StatefulWidget {
  CreateOrder({Key? key}) : super(key: key);

  @override
  _CreateOrderState createState() => _CreateOrderState();
}

class _CreateOrderState extends State<CreateOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tacos Tito"),
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
          SizedBox(height: 35,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 15,),
              Text("Tu orden",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                ),
              ),
            ],
            
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
              ElevatedButton(
                onPressed: (){},
                child: Icon(Icons.add),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(7),
                ),
              ),
              Text("5",
                style: TextStyle(
                  fontSize: 17
                ),
              ),
              ElevatedButton(
                onPressed: (){},
                child: Icon(Icons.remove),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(7),
                ),
              ),
              SizedBox(width: 10,),
              Container(
                height: 37.0,
                width: 140.0,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.all(Radius.circular(5)),),
                child: Center(
                  child:new Text("Adobada", 
                  style: TextStyle(fontSize: 17,),
                ),
                )
              ),
              SizedBox(width: 25,),
              ElevatedButton(
                onPressed: (){}, 
                child: Icon(Icons.reorder),
                //style: ElevatedButton.styleFrom(
                //  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5) 
                //),
              )
            ]
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              ElevatedButton(
                onPressed: (){},
                child: Icon(Icons.add),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(7),
                ),
              ),
              Text("3",
                style: TextStyle(
                  fontSize: 17
                ),
              ),
              ElevatedButton(
                onPressed: (){},
                child: Icon(Icons.remove),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(7),
                ),
              ),
              SizedBox(width: 10,),
              Container(
                height: 37.0,
                width: 140.0,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.all(Radius.circular(7)),),
                child: Center(
                  child:new Text("Asada", 
                  style: TextStyle(fontSize: 17,),
                ),
                )
              ),
              SizedBox(width: 25,),
              ElevatedButton(
                onPressed: (){}, 
                child: Icon(Icons.reorder),
                //style: ElevatedButton.styleFrom(
                //  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5) 
                //),
              )
            ]
          ),
          SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: (){},
                child: Text("Añadir plato",
                  style: TextStyle(fontSize: 20)
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 60),
                )
              ),
            ],
          ),
          SizedBox(height: 30,),
          Row(
            children: [
              SizedBox(width: 15,),
              Text("Total: \$150",
                style: TextStyle(
                  fontSize: 17,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
          SizedBox(height:30),
          Column(
            children: [
              ListTile(
                leading: Icon(Icons.share_location),
                title: Padding(
                  padding: EdgeInsets.only(right: 24),
                  child: TextField(
                    //controller: tipController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                      ),
                      labelText: "Dirección",
                      //errorText: validate ? true: ,
                    )
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Padding(
                  padding: EdgeInsets.only(right: 24),
                  child: Container(
                    child: TextField(
                      //controller: tipController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                        ),
                        labelText: "Teléfono",
                        //errorText: validate ? true: ,
                      )
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.monetization_on),
                title: Padding(
                  padding: EdgeInsets.only(right: 24),
                  child: Container(
                    child: TextField(
                      //controller: tipController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                        ),
                        labelText: "Monto con el que pagarás",
                        //errorText: validate ? true: ,
                      )
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: (){},
                child: Text("Enviar orden",
                  style: TextStyle(fontSize: 20)
                ),
              ),
              SizedBox(width: 15,)
            ],
          ),
        ],
      ),
    );
  }
}