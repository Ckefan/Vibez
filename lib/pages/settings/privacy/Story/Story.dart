import 'dart:ui';
import 'package:Vibez/pages/settings/privacy/Story/HideStory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Story extends StatefulWidget {
  @override
  _StoryState createState() => _StoryState();
}

class _StoryState extends State<Story> {
  final greyColor = Color.fromRGBO(184, 184, 184, 1);
  var _lights = true;
  var index = 1;

  List<GestureDetector> _buildList() => <List>[
        [
          SizedBox(),
          Text(' Hide Story From',
              style: TextStyle(fontSize: 17.0, color: Colors.white)),
          Icon(Icons.chevron_right, color: greyColor, size: 30)
        ],
        [
          SizedBox(),
          Text(' Hide specific people from viewing your story and lives.',
              style: TextStyle(fontSize: 12.0, color: greyColor)),
          SizedBox(
            width: 30,
          ),
        ],
        [
          SizedBox(),
          Divider(
            color: Color.fromRGBO(246, 246, 246, 1),
            height: 0,
            thickness: 1,
            indent: 0,
            endIndent: 0,
          ),
          SizedBox(),
        ],
        [
          SizedBox(),
          Text(' Sharing',
              style: TextStyle(fontSize: 17.0, color: Colors.white)),
          SizedBox(),
        ],
        [
          SizedBox(),
          Text(' Allow Resharing',
              style: TextStyle(fontSize: 17.0, color: greyColor)),
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
          Text(' Allow Sharing as Message',
              style: TextStyle(fontSize: 17.0, color: greyColor)),
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
          Divider(
            color: Color.fromRGBO(246, 246, 246, 1),
            height: 0,
            thickness: 1,
            indent: 0,
            endIndent: 0,
          ),
          SizedBox()
        ],
        [
          SizedBox(),
          Text(' Allow Message Replies',
              style: TextStyle(fontSize: 17.0, color: Colors.white)),
          SizedBox(),
        ],
        [
          SizedBox(),
          Text(' Everyone', style: TextStyle(fontSize: 17.0, color: greyColor)),
          Container(
            width: 26,
            height: 26,
            margin: EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              color: index == 1
                  ? Color.fromRGBO(41, 169, 224, 1)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(50.0),
              border: Border.all(
                  width: 1,
                  color: index == 1
                      ? Color.fromRGBO(41, 169, 224, 1)
                      : Colors.white),
            ),
          )
        ],
        [
          SizedBox(),
          Text(' People You Follow',
              style: TextStyle(fontSize: 17.0, color: greyColor)),
          Container(
            width: 26,
            height: 26,
            margin: EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              color: index == 2
                  ? Color.fromRGBO(41, 169, 224, 1)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(50.0),
              border: Border.all(
                  width: 1,
                  color: index == 2
                      ? Color.fromRGBO(41, 169, 224, 1)
                      : Colors.white),
            ),
          )
        ],
        [
          SizedBox(),
          Text(' No One', style: TextStyle(fontSize: 17.0, color: greyColor)),
          Container(
            width: 26,
            height: 26,
            margin: EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              color: index == 3
                  ? Color.fromRGBO(41, 169, 224, 1)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(50.0),
              border: Border.all(
                  width: 1,
                  color: index == 3
                      ? Color.fromRGBO(41, 169, 224, 1)
                      : Colors.white),
            ),
          )
        ],
        [
          SizedBox(),
          Text(' Choose who can reply to your stories',
              style: TextStyle(fontSize: 12.0, color: greyColor)),
          SizedBox(width: 20),
        ],
      ]
          .asMap()
          .map(
            (index, e) => MapEntry(
              index,
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                child: Padding(
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
                onTap: () => operation(index),
              ),
            ),
          )
          .values
          .toList();

  void operation(int index) {
    print(index);
    switch (index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return HideStory();
        }));
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Story'),
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
