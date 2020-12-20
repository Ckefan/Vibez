import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllowComboReact extends StatefulWidget {
  @override
  _AllowComboReactState createState() => _AllowComboReactState();
}

class _AllowComboReactState extends State<AllowComboReact> {
  final greyColor = Color.fromRGBO(184, 184, 184, 1);
  var _lights = true;

  List<Padding> _buildList() => <List>[
        [
          SizedBox(),
          Text(' Allow Combo/React',
              style: TextStyle(fontSize: 17.0, color: Colors.white)),
          CupertinoSwitch(
            value: _lights,
            activeColor: Color.fromRGBO(41, 169, 224, 1),
            trackColor: Colors.white,
            onChanged: (bool value) {
              setState(() {
                _lights = value;
              });
            },
          ),
        ],
        [
          SizedBox(),
          Text(
              ' Allowing Combo/React allows other users to use your post in their posts. Your username will always show up with your posts.',
              style: TextStyle(fontSize: 12.0, color: greyColor)),
          SizedBox(width: 20),
        ],
      ]
          .asMap()
          .map(
            (index, e) => MapEntry(
              index,
              Padding(
                padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    e[0],
                    Expanded(
                      child: e[1],
                    ),
                    e[2]
                  ],
                ),
              ),
            ),
          )
          .values
          .toList();

  void operation(int index) {
    print(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Allow Combo/React'),
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        leading: null,
      ),
      body: Container(
        color: Colors.black,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: _buildList(),
        ),
      ),
    );
  }
}
