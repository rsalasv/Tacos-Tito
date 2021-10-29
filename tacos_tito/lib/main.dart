import 'package:flutter/material.dart';
import 'package:tacos_tito/views/home_page.dart';
import 'views/all_views.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SearchOrder(),
      theme: ThemeData(primarySwatch: Colors.orange),
    );
  }
}
