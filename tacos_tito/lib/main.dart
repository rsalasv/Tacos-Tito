import 'package:flutter/material.dart';
import 'views/all_views.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
      theme: ThemeData(primarySwatch: Colors.orange),
    );
  }
}