import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tacos_tito/widgets/all_widgets.dart';
import 'package:tacos_tito/search_order/bloc/so_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tacos_tito/auth/user_auth_repository.dart';

class SearchOrder extends StatefulWidget {
  SearchOrder({Key? key}) : super(key: key);

  @override
  _SearchOrderState createState() => _SearchOrderState();
}

class _SearchOrderState extends State<SearchOrder> {
  List<OrderView> orders = [new OrderView()];

  Text getPlates(map, nombre){

    var plates = "";
    /*if(nombre != ""){
      for(var i = 0; i < map.length; i++){
        plates += "Plato $i\n\n";
        for(var j = 0; j < map[i].length; j++)
          plates += map[i].keys.elementAt(j).toString() + " " + map[i].values.elementAt(j).toString() + "\n";
        plates += "\n";
      }*/
    //}else{
      for(var i = 0; i < map.length; i++){
        plates += "Plato ${i+1}\n\n";
        for(var j = 0; j < map[i].length; j++)
          plates += map[i].keys.elementAt(j).toString() + " " + map[i].values.elementAt(j).toString() + "\n";
        plates += "\n";
      }
    //}
      
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
        title: Text('Tacos Tito'),
      ),
      body: BlocProvider(
        create: (context) => SoBloc()..add(RequestDataEvent()),
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
              return Center(
                child: ListView(
                  padding: EdgeInsets.all(10),
                  children: [
                    Column(
                      children: [
                        TextField(
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                size: 30,
                              ),
                              border: OutlineInputBorder()),
                        ),
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
                    
                    Text("Total: \$"+state.orderList[index]["order_total"].toString(),
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
                    )
                  ],
                ),
              );
            }
            return Center(
              child: Container(
                child: Text("No hay datos que mostrar aun...")
              ),
            );
          },
        ),
      ),
    );
  }
}
