import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tacos_tito/auth/user_auth_repository.dart';
import 'package:tacos_tito/views/pending_orders.dart';
import 'package:tacos_tito/widgets/all_widgets.dart';
import 'package:tacos_tito/create_order/bloc/order_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

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
  Position? currentPos;
  var fichaData;
  Future<String?> getFicha() async {
    try {
      var ficha = await FirebaseFirestore.instance.collection("ficha").doc("ficha");
      
      
      await ficha.get().then((snapshot) {
        fichaData = snapshot.data()!['ficha'].toString();
      }); 
      print("ficha data " + fichaData);
      await ficha.update({"ficha":int.parse(fichaData)+1});
      return fichaData;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if(!serviceEnabled){
      print("No está habilitada la localización :(");
    }
    permission = await Geolocator.checkPermission();
    if(permission==LocationPermission.denied){
      permission = await Geolocator.checkPermission();
    }

    if(permission == LocationPermission.deniedForever){
      print("f");
    }

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    try{
      List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks[0];
      setState(() {
        currentPos = position;
        direction = "${place.street}, ${place.locality}";
      });
    }catch(e){
      print(e);
    }

    return position;
  }

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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PendingOrder()),
                );
              },
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
                      leading: ElevatedButton(onPressed: (){ _determinePosition();}
                      , child: Icon(Icons.my_location, color: Colors.white,)),
                      title: Padding(
                        padding: EdgeInsets.only(right: 24),
                        child: DecoratedBox(decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)), child: Text(direction),) 
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
                      onPressed: () async {
                        await getFicha();
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
                        if (_formKey.currentState!.validate())  {
                          String? userName = UserAuthRepository().user!.email;
                          
                          _createBloc.add(SaveOrderOnlineEvent(
                            orderData: {
                              "ficha":fichaData,
                              "date": date,
                              "direction": direction,
                              "phone": phone,
                              "pay_amount": pay_amount,
                              "plates": plates,
                              "user": userName,
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
