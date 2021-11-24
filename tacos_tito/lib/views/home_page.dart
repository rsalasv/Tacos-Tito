import 'package:flutter/material.dart';
import 'package:tacos_tito/auth/user_auth_repository.dart';
import 'package:tacos_tito/login/login.dart';
import 'package:tacos_tito/models/userModel.dart';
import 'package:tacos_tito/views/all_views.dart';
import '../search_order/search_order.dart';

class HomePage extends StatefulWidget {
  final UserModel user;

  HomePage({Key? key, isAdmin, required this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tacos Tito", style: TextStyle(color: Colors.white,)),
        actions: <Widget>[
          Visibility(child: 
          IconButton(
            icon: Icon(
              Icons.receipt,
              color: Colors.white,
            ),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PendingOrder()),
              );
            },
          ), visible: !widget.user.isAdmin,),
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: (){
              UserAuthRepository().signOutGoogle();
              UserAuthRepository().signOutWithMail();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
          ),
          SizedBox(width: 20,)
        ]
      ),
      body: ListView(
        children: [
          Row(
            children: <Widget>[
              Expanded(
                flex: 4, // 20%
                child: Container(
                  child: Column(children: [
                      Container(height: 150, color: Colors.yellow, child: Image(image: AssetImage('assets/images/mmm_tripas.jpg'),fit: BoxFit.cover,),),
                      Container(height: 150, color: Colors.cyan, child: Image(image: AssetImage('assets/images/tacos_chorizo_placeholder.jpg'),fit: BoxFit.cover,),),
                      Container(height: 150, color: Colors.red, child: Image(image: AssetImage('assets/images/tacos1_placeholder.jpg'),fit: BoxFit.cover,),),
                    ],
                  )
                ),
                
              ),
              Expanded(
                flex: 6, // 60%
                child: Container(
                  height: 450, 
                  color: Colors.green,
                  child: Image(image: AssetImage('assets/images/trompo_pastor.jpg'),fit: BoxFit.cover,),
                ),
              ),
            ], 
          ),
          SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ if (!widget.user.isAdmin)
              ElevatedButton(
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CreateOrder()),
                    );
                },
                child: Text("Ordenar ahora",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 60),
                ),
              ),
            ],
          ),
        ],
        
      ),
      floatingActionButton: new Visibility(child: FloatingActionButton(
            onPressed: (){
              Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SearchOrder()),
                    );
              //TODO remove in case of normal user
            },
            child: Icon(Icons.search, color: Colors.white,),
            tooltip: "Buscar orden",
            
          ), visible: widget.user.isAdmin,)
    );
  }
}