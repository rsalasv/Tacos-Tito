import 'package:flutter/material.dart';
//import 'package:tacos_tito/views/chat_page.dart';
import 'package:tacos_tito/views/home_page.dart';
import 'views/all_views.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.orange),
    );
  }
}
