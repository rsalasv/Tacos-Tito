import 'package:flutter/material.dart';
import 'package:tacos_tito/login/login.dart';
import '../widgets/all_widgets.dart';
import 'package:bloc/bloc.dart';
import '../auth/user_auth_repository.dart';

class Signin extends StatefulWidget {
  Signin({Key? key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  UserAuthRepository userRep = UserAuthRepository();
  

  final userController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Container(
            margin: EdgeInsets.all(10),
            child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
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
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                    labelText: "Correo",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.phone),
                  ),
                controller: userController,
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
                    labelText: "Contrase??a",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.password),
                  ),
                controller: passController,
              ),
              SizedBox(height: 10,),
              TextField(
                obscureText: true,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                    labelText: "Confirmar contrase??a",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.password),
                  ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment:MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: ()=>{
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    )
                  }, child: Text("Ya tengo cuenta", style: TextStyle(fontSize: 20, color: Colors.white),)),
                  SizedBox(width: 15,),
                  ElevatedButton(onPressed: ()=>{
                    userRep.signUpWithMail(email: userController.text, password: passController.text),
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    )
                  }, child: Text("Crea una cuenta", style: TextStyle(fontSize: 20, color: Colors.white),)),
                  
                ],)
            ],),
          ),
        )
      ],
    );
  }
}

