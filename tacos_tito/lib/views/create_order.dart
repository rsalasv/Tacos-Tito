import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tacos_tito/widgets/all_widgets.dart';

class CreateOrder extends StatefulWidget {
  CreateOrder({Key? key}) : super(key: key);

  @override
  _CreateOrderState createState() => _CreateOrderState();
}

class _CreateOrderState extends State<CreateOrder> {
  List<PlateView> platos=[new PlateView()];
  int total = 0;

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
          ListView.builder(itemBuilder: (_,index)=>platos[index],itemCount: platos.length,shrinkWrap: true, physics: ScrollPhysics(),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: (){
                  platos.add(new PlateView());
                  setState(() {});
                },
                child: Text("Añadir plato",
                  style: TextStyle(fontSize: 20, color: Colors.white,)
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
              Text("Total: \$$total",
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
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: (){},
                child: Text("Enviar orden",
                  style: TextStyle(fontSize: 20, color: Colors.white,)
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