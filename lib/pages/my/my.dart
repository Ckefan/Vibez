import 'package:flutter/material.dart';

class My extends StatefulWidget {
  @override
  _MyState createState() => _MyState();
}

class _MyState extends State<My> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.grey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("按钮"),
          IconButton(
            icon: Icon(
              Icons.add,
              size: 150,
              color: Colors.red,
            ),
            onPressed: () {
              print(12011231);
            },
          ),
          IconButton(
            icon: Icon(Icons.access_alarm),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
