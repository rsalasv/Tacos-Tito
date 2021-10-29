import 'package:flutter/material.dart';
import '../widgets/all_widgets.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
            SizedBox(height: 30,),
            Text("Taqueria Tito", style: TextStyle(color: Colors.white, fontSize: 60, fontWeight: FontWeight.bold),),
            SizedBox(height: 100,),
            TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  labelText: "Usuario",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
            ),
            SizedBox(height: 40,),
            TextField(
              obscureText: true,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  labelText: "Contraseña",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.password),
                ),
            ),
            SizedBox(height: 70,),
            Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                
                ElevatedButton(onPressed: ()=>{}, child: Text("Inicia sesión", style: TextStyle(fontSize: 20, color: Colors.white),)),
                SizedBox(width: 50,),
                ElevatedButton(onPressed: ()=>{}, child: Text("Crea una cuenta", style: TextStyle(fontSize: 20, color: Colors.white),)),
              ],)
          ],),
        )
      ],
    );
  }
}

