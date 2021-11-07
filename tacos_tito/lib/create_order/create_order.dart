import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tacos_tito/widgets/all_widgets.dart';
import 'package:tacos_tito/create_order/bloc/order_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateOrder extends StatefulWidget {
  CreateOrder({Key? key}) : super(key: key);

  @override
  _CreateOrderState createState() => _CreateOrderState();
}

class _CreateOrderState extends State<CreateOrder> {
  List<PlateView> platos = [new PlateView()];
  int total = 0, pay_amount = 0;
  var _formKey = GlobalKey<FormState>();
  late OrderBloc _createBloc;
  String direction = "", phone = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Tacos Tito",
              style: TextStyle(
                color: Colors.white,
              )),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.receipt,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.notifications,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            SizedBox(
              width: 20,
            )
          ]),
      body: BlocProvider(
        create: (context) {
          _createBloc = OrderBloc();
          return _createBloc;
        },
        child: BlocListener<OrderBloc, OrderState>(
          listener: (context, state) {
            if (state is CreatedOrderState) Navigator.of(context).pop();
          },
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child: ListView(
              children: [
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
                      "Tu orden",
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
                ListView.builder(
                  itemBuilder: (_, index) => platos[index],
                  itemCount: platos.length,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          platos.add(new PlateView());
                          setState(() {});
                        },
                        child: Text("Añadir plato",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            )),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 60),
                        )),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Total: ",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.share_location),
                      title: Padding(
                        padding: EdgeInsets.only(right: 24),
                        child: TextFormField(
                            //controller: tipController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Dirección",
                              //errorText: validate ? true: ,
                            ),
                            validator: (value) {
                                if (value == null || value.isEmpty){
                                  return "Por favor ingresa un número de teléfono válido";
                                } else {
                                  direction = value;
                                }
                                return null;
                            },
                          ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Padding(
                        padding: EdgeInsets.only(right: 24),
                        child: Container(
                          child: TextFormField(
                              //controller: tipController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Teléfono",
                                //errorText: validate ? true: ,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty || value.length != 10){
                                  return "Por favor ingresa un número de teléfono válido";
                                } else {
                                  phone = value;
                                }
                                return null;
                            },
                            ),
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.monetization_on),
                      title: Padding(
                        padding: EdgeInsets.only(right: 24),
                        child: Container(
                          child: TextFormField(
                              //controller: tipController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Monto con el que pagarás",
                                //errorText: validate ? true: ,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty){
                                  return "Por favor ingresa el monto con el que pagarás";
                                } else {
                                  pay_amount = int.parse(value);
                                }
                                return null;
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        DateTime date = new DateTime.now();
                        var plates = [];
                        for(int i = 0; i < platos.length; i++){
                          var plato = {};
                          //plates["Plato $i"] = platos[i].guisos.length;
                          for(int j = 0; j < platos[i].guisos.length; j++){
                            //plates[platos[i].guisos[j].selectedGuiso] = platos[i].guisos[j].amount;
                            plato[platos[i].guisos[j].selectedGuiso] = platos[i].guisos[j].amount;
                          }
                          plates.add(plato);
                        }
                        if (_formKey.currentState!.validate()) {
                          _createBloc.add(SaveOrderOnlineEvent(
                            orderData: {
                              "date": date,
                              "direction": direction,
                              "phone": phone,
                              "pay_amount": pay_amount,
                              "plates": plates,
                            }
                          )
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Enviando tu orden')),
                          );
          
                          _formKey.currentState!.reset();
                          FocusScope.of(context).unfocus();
                        }
                      },
                      child: Text("Enviar orden",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          )),
                    ),
                    SizedBox(
                      width: 15,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
