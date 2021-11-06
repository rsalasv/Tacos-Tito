import 'package:flutter/material.dart';
import 'all_widgets.dart';
import 'tacoview.dart';

class OrderView extends StatefulWidget {
  OrderView({Key? key}) : super(key: key);

  @override
  _OrderViewState createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  List<PlateView> platos=[new PlateView()];
  int ficha=47;
  int dia=3;
  int mes=11;
  int year=2021;
  String direccion="Cortijo de San Agustín, Camino del labrador #13";
  String cliente="John Cena";
  num total=104.00;
  
  @override
  Widget build(BuildContext context) {
    return Column(children: [
        SizedBox(height: 15,),
                ListTile(
                  leading: Text("Ficha #$ficha",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.grey
                    ),),
                  title: Text(cliente,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17
                    ),
                  ),
                  subtitle: Text(direccion),
                ),
                ListTile(
                      leading: Icon(Icons.watch_later),
                      title: Padding(
                        padding: EdgeInsets.only(right: 24),
                        child: Text("$dia/$mes/$year"),
                      ),
                    ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    SizedBox(width: 15,),
                    Text("Plato",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                ListView.builder(itemBuilder: (_,index)=>platos[index],itemCount: platos.length,shrinkWrap: true, physics: ScrollPhysics(),),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    
                    Text("Total: \$ $total",
                      style: TextStyle(
                        fontSize: 17,

                      ),
                      textAlign: TextAlign.right,
                    ),
                    SizedBox(width: 15,),
                  ],
                ),
                SizedBox(height: 15,),
      ]);
  }
}

/*class OrderView extends StatelessWidget {
  const OrderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<PlateView> platos=[new PlateView()];
    int ficha=47;
    int dia=3;
    int mes=11;
    int year=2021;
    String direccion="Cortijo de San Agustín, Camino del labrador #13";
    String cliente="John Cena";
    num total=104.00;

    return Container(
      child: Column(children: [
        SizedBox(height: 15,),
                ListTile(
                  leading: Text("Ficha #$ficha",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.grey
                    ),),
                  title: Text(cliente,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17
                    ),
                  ),
                  subtitle: Text(direccion),
                ),
                ListTile(
                      leading: Icon(Icons.watch_later),
                      title: Padding(
                        padding: EdgeInsets.only(right: 24),
                        child: Text("$dia/$mes/$year"),
                      ),
                    ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    SizedBox(width: 15,),
                    Text("Plato",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                ListView.builder(itemBuilder: (_,index)=>platos[index],itemCount: platos.length,shrinkWrap: true, physics: ScrollPhysics(),),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    
                    Text("Total: \$ $total",
                      style: TextStyle(
                        fontSize: 17,

                      ),
                      textAlign: TextAlign.right,
                    ),
                    SizedBox(width: 15,),
                  ],
                ),
                SizedBox(height: 15,),
      ]),
    );
  }
}*/