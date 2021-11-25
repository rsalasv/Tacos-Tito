import 'package:flutter/material.dart';
import 'package:tacos_tito/models/tacoModel.dart';
import 'package:provider/provider.dart';

class TacoView extends StatefulWidget {
  int amount = 0;
  final guisos =["Asada", "Adobada", "Chorizo", "Tripa"];
  String? selectedGuiso;
  TacoView({Key? key}) : super(key: key);

  @override
  _TacoViewState createState() => _TacoViewState();
}

class _TacoViewState extends State<TacoView> {
  @override
  bool editable=true; //TODO: Permitir cambiar su editabilidad dependiendo de la vista

  Widget build(BuildContext context) {
    final tacoTotal = Provider.of<tacoModel>(context);
    return Row(
            children: [
              if(this.editable) ElevatedButton(
                onPressed: (){
                  setState(() {
                    if(widget.amount > 0) {
                      widget.amount--;
                      tacoTotal.add(false);
                    }
                  });
                },
                child: Icon(Icons.remove, color: Colors.white,),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(7),
                ),
              ),
              Text('${widget.amount}',
                style: TextStyle(
                  fontSize: 17
                ),
              ),
              if(this.editable) ElevatedButton(
                onPressed: (){
                  setState(() {
                    if(widget.amount < 6){
                      widget.amount++;
                      tacoTotal.add(true);
                    } 
                  });
                },
                child: Icon(Icons.add, color: Colors.white,),
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
                    value: widget.selectedGuiso,
                    items: widget.guisos.map(builMenuItem).toList(),
                    onChanged: (value)=>setState(()=>this.widget.selectedGuiso = value!),
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
                  child: Text(widget.selectedGuiso!)
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