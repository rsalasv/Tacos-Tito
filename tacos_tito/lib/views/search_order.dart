import 'package:flutter/material.dart';

class SearchOrder extends StatefulWidget {
  SearchOrder({Key? key}) : super(key: key);

  @override
  _SearchOrderState createState() => _SearchOrderState();
}

class _SearchOrderState extends State<SearchOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tacos Tito'),
        ),
        body: Center(
          child: ListView(
            children: [
              ListTile(
                leading: Icon(Icons.search),
                title: Padding(
                  padding: EdgeInsets.only(right: 24),
                  child: Container(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'type in journal name...',
                        hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        )
                      ),
                    ),
                  ),
                ),
              ),
              Text('Hello World')
            ],
          ),
        ),
      );
  }
}


