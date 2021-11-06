import 'package:flutter/material.dart';
import 'package:tacos_tito/views/all_views.dart';
import 'package:auth_buttons/auth_buttons.dart';
import '../widgets/all_widgets.dart';
import 'dart:ui';

class LoginForm extends StatelessWidget {
    // cambiar a un solo value changed que reciba enum de login
  final ValueChanged<bool> onGoogleLoginTap;
  final ValueChanged<bool> onFacebookLoginTap;

  LoginForm({
    Key? key,
    required this.onGoogleLoginTap,
    required this.onFacebookLoginTap,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            margin: EdgeInsets.all(10),
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              SizedBox(height: 80,),
              Text("Taqueria Tito", style: TextStyle(color: Colors.white, fontSize: 60, fontWeight: FontWeight.bold),),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 32),
                child: Row(
                  children: [
                    Expanded(
                      child: FacebookAuthButton(
                        onPressed: () => onFacebookLoginTap(true),
                        text: "Iniciar con Facebook",
                        style: AuthButtonStyle(borderRadius: 18),
                      ),
                    ),
                  ],
                ),
              ),
  
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 32),
                child: Row(
                  children: [
                    Expanded(
                      child: GoogleAuthButton(
                        onPressed: () => onGoogleLoginTap(true),
                        text: "Iniciar con Google",
                        style: AuthButtonStyle(borderRadius: 18),
                        darkMode: false,
                      ),
                    ),
                  ],
                ),
              ),

              TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                    labelText: "Usuario",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
              ),

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
              
              Row(
                mainAxisAlignment:MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: ()=>{
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    )
                  }, child: Text("Inicia sesión", style: TextStyle(fontSize: 20, color: Colors.white),)),
                  SizedBox(width: 35,),
                  ElevatedButton(onPressed: ()=>{
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Signin()),
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

