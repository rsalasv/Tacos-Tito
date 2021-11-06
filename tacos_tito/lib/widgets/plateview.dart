import 'package:flutter/material.dart';
import 'tacoview.dart';

class PlateView extends StatefulWidget {
  PlateView({Key? key}) : super(key: key);
  
  @override
  _PlateViewState createState() => _PlateViewState();
}

class _PlateViewState extends State<PlateView> {
  List<TacoView> guisos=[new TacoView()];

  addGuiso(){
    guisos.add(new TacoView());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
          ListView.builder(itemBuilder: (_,index)=>guisos[index],itemCount: guisos.length,shrinkWrap: true),
          Row(children: [
            //ListView.builder(itemBuilder: (_,index)=>guisos[index],itemCount: guisos.length,shrinkWrap: true),
            //TacoView(),
            SizedBox(width: 25,),
            ElevatedButton(
                onPressed: (){
                  addGuiso();
                }, 
                child: Icon(Icons.add, color: Colors.white,),
              )
          ],),
          SizedBox(height: 40,),
          
    ],);
  }
}