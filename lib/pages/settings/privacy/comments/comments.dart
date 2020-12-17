import 'dart:ui';
import 'package:Vibez/pages/settings/privacy/comments/allowcomments.dart';
import 'package:Vibez/pages/settings/privacy/comments/tagged.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Comments extends StatefulWidget {
  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  final greyColor = Color.fromRGBO(184, 184, 184, 1);
  var _lights = true;

  List<GestureDetector> _buildList() => <List>[
        [
          SizedBox(),
          Text(' Controls',
              style: TextStyle(fontSize: 17.0, color: Colors.white)),
          SizedBox(),
        ],
        [
          Image.asset('lib/assets/images/inbox.png', width: 22.0, height: 18),
          Text(' Comments', style: TextStyle(fontSize: 17.0, color: greyColor)),
          Icon(Icons.chevron_right, color: greyColor, size: 30)
        ],
        [
          Image.asset('lib/assets/images/inbox.png', width: 22.0, height: 18),
          Text(' Tagged', style: TextStyle(fontSize: 17.0, color: greyColor)),
          Icon(Icons.chevron_right, color: greyColor, size: 30)
        ],
        [
          SizedBox(),
          Text(
              ' New Comments from comment blocked users will only be visible to them.',
              style: TextStyle(fontSize: 12.0, color: greyColor)),
          SizedBox(width: 20),
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
          Text(' Hide Offensive Comments',
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
              ' Auto hide comments that may be offensive from post, stories, and live videos.',
              style: TextStyle(fontSize: 12.0, color: greyColor)),
          SizedBox(width: 20),
        ],
      ]
          .asMap()
          .map(
            (index, e) => MapEntry(
              index,
              GestureDetector(
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
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return AllowComments();
        }));
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Tagged();
        }));
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments'),
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
