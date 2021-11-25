import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tacos_tito/views/all_views.dart';
import '../widgets/all_widgets.dart';
import 'bloc/so_bloc.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tacos_tito/search_order/bloc/so_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tacos_tito/auth/user_auth_repository.dart';

import 'orderview.dart';

class PendingOrder extends StatefulWidget {
  PendingOrder({Key? key}) : super(key: key);

  @override
  _PendingOrderState createState() => _PendingOrderState();
}

class _PendingOrderState extends State<PendingOrder> {
  List<OrderView> orders = [new OrderView()];

  Text getPlates(map, value){
    var plates = "";
      for(var i = 0; i < map.length; i++){
        plates += "Plato ${i+1}\n\n";
        for(var j = 0; j < map[i].length; j++)
          plates += map[i].keys.elementAt(j).toString() + " " + map[i].values.elementAt(j).toString() + "\n";
        plates += "\n";
    }
      
    return Text(plates,
      style: TextStyle(
        fontSize: 17,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Tacos Tito",
                style: TextStyle(
                  color: Colors.white,
                )),
            leading: Icon(Icons.keyboard_backspace),
            actions: <Widget>[
              SizedBox(
                width: 20,
              )
            ]),
        body: BlocProvider(
          create: (context) => SoBloc()..add(RequestUserDataEvent()),
          child: BlocConsumer<SoBloc, SoState>(
            listener: (context, state) {
              if (state is NoDataState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("No se encontraron datos..."),
                  ),
                );
              }
            },
            builder: (context, state) {
            if (state is LoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ExistingDataState) {
              return ListView(children: [
                SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Órdenes pendientes",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Column(
                    children: [
                      ListView.builder(
                          itemCount: state.orderList.length,
                          itemBuilder: (BuildContext context, int index){
                            return Column(children: [
        SizedBox(height: 15,),
                ListTile(
                  leading: Text("Ficha #${state.orderList[index]["ficha"]}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.grey
                    ),),
                  title: Text(state.orderList[index]["user"],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17
                    ),
                  ),
                  subtitle: Text(state.orderList[index]["direction"]),
                ),
                ListTile(
                      leading: Icon(Icons.watch_later),
                      title: Padding(
                        padding: EdgeInsets.only(right: 24),
                        child: Text("${DateFormat('dd/MM/yyyy - kk:mm').format(state.orderList[index]["date"].toDate())}"),
                      ),
                    ),
                SizedBox(height: 15,),
                /*Row(
                  children: [
                    SizedBox(width: 15,),
                    Text("Plato",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),*/
                SizedBox(height: 10,),
                
                //ListView.builder(itemBuilder: (_,index)=>state.orderList[index]["plates"],itemCount: state.orderList[index]["plates"].length,shrinkWrap: true, physics: ScrollPhysics(),),
                getPlates(state.orderList[index]["plates"], ""),
                /*Text("${state.orderList[index]["plates"]}",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),*/
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    
                    Text("Total: \$${state.orderList[index]["order_total"]}",
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
                          },
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                        )
                    ],
                  ),
                ),
            ]);}
            return Center(
              child: Container(
                child: Text("No hay datos que mostrar aun...")
              ),
            );
            },
          ),
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Chat()),
            );
          },
          child: Icon(Icons.chat, color: Colors.white),
          tooltip: "Chat",
        ));
  }
}
