import 'package:flutter/material.dart';
import 'package:tacos_tito/widgets/all_widgets.dart';

class SearchOrder extends StatefulWidget {
  SearchOrder({Key? key}) : super(key: key);

  @override
  _SearchOrderState createState() => _SearchOrderState();
}

class _SearchOrderState extends State<SearchOrder> {
  List<OrderView> orders =[new OrderView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tacos Tito'),
        ),
        body: Center(
          child: ListView(
            padding: EdgeInsets.all(10),
            children: [
              Column(children: [
                TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, size:  30,),
                    border: OutlineInputBorder()
                  ),),
                  ListView.builder(itemBuilder: (_,index)=>orders[index],itemCount: orders.length,shrinkWrap: true, physics: ScrollPhysics(),)
              ],)
            ],
          ),
        ),
      );
  }
}


