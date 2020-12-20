import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActivityStatus extends StatefulWidget {
  @override
  _ActivityStatusState createState() => _ActivityStatusState();
}

class _ActivityStatusState extends State<ActivityStatus> {
  final greyColor = Color.fromRGBO(184, 184, 184, 1);
  var _lights = true;

  List<Padding> _buildList() => <List>[
        [
          SizedBox(),
          Text(' Show Activity Status',
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
              " Allow accounts you follow and anyone you message see when you were last active on Vibez. With this feature turned off, you won't be able to see the activity status of other users.",
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
        title: Text('Activity Status'),
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
