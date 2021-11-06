import 'package:flutter/material.dart';

class TacoView extends StatefulWidget {
  TacoView({Key? key}) : super(key: key);

  @override
  _TacoViewState createState() => _TacoViewState();
}

class _TacoViewState extends State<TacoView> {
  @override
  int amount = 0;
  final guisos =["Asada", "Adobada", "Chorizo", "Tripa"];
  String? selectedGuiso;
  bool editable=true; //TODO: Permitir cambiar su editabilidad dependiendo de la vista

  Widget build(BuildContext context) {
    return Row(
            children: [
              if(this.editable) ElevatedButton(
                onPressed: (){
                  setState(() {
                    if(amount<6)
                    amount++;
                  });
                },
                child: Icon(Icons.add, color: Colors.white,),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(7),
                ),
              ),
              Text('$amount',
                style: TextStyle(
                  fontSize: 17
                ),
              ),
              if(this.editable) ElevatedButton(
                onPressed: (){
                  setState(() {
                    if(amount>0)
                    amount--;
                  });
                },
                child: Icon(Icons.remove, color: Colors.white,),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(7),
                ),
              ),
              SizedBox(width: 10,),
              if(editable)Container(
                height: 37.0,
                width: 140.0,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.all(Radius.circular(5)),),
                child: Center(
                  child: DropdownButton<String>(
                    value: selectedGuiso,
                    items: guisos.map(builMenuItem).toList(),
                    onChanged: (value)=>setState(()=>this.selectedGuiso = value!),
                  )
                )
              ),
              if(!editable)Container(
                height: 37.0,
                width: 140.0,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.all(Radius.circular(5)),),
                child: Center(
                  child: Text(selectedGuiso!)
                )
              ),
            ]
          );
  }

  DropdownMenuItem<String> builMenuItem(String item)=> DropdownMenuItem(
    value: item,
    child: Text(item),
  );
}