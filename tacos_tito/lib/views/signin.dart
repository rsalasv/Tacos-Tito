import 'package:flutter/material.dart';
import '../widgets/all_widgets.dart';

class Signin extends StatefulWidget {
  Signin({Key? key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
            SizedBox(height: 80,),
            Text("Taqueria Tito", style: TextStyle(color: Colors.white, fontSize: 60, fontWeight: FontWeight.bold),),
            Text("Crear cuenta", style: TextStyle(color: Colors.white, fontSize: 24),),
            TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  labelText: "Nombre(s)",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person_add),
                ),
            ),
            SizedBox(height: 10,),
            TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  labelText: "Apellido",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person_add_alt),
                ),
            ),
            SizedBox(height: 10,),
            TextField(
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  labelText: "Telefono",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                ),
            ),
            SizedBox(height: 10,),
            TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  labelText: "Apodo",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.verified_user)
                ),
            ),
            SizedBox(height: 10,),
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
            SizedBox(height: 10,),
            TextField(
              obscureText: true,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  labelText: "Confirmar contraseña",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.password),
                ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: ()=>{}, child: Text("Ya tengo cuenta", style: TextStyle(fontSize: 20, color: Colors.white),)),
                SizedBox(width: 50,),
                ElevatedButton(onPressed: ()=>{}, child: Text("Crea una cuenta", style: TextStyle(fontSize: 20, color: Colors.white),)),
              ],)
          ],),
        )
      ],
    );
  }
}

