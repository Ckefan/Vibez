import 'package:flutter/material.dart';

class Mentions extends StatefulWidget {
  @override
  _MentionsState createState() => _MentionsState();
}

class _MentionsState extends State<Mentions> {
  final greyColor = Color.fromRGBO(184, 184, 184, 1);
  var index = 1;

  List<GestureDetector> _buildList() => <List>[
        [
          SizedBox(),
          Text(' Allow @mentions from',
              style: TextStyle(fontSize: 17.0, color: greyColor)),
          SizedBox(),
        ],
        [
          SizedBox(),
          Text(' Everyone', style: TextStyle(fontSize: 17.0, color: greyColor)),
          Container(
            width: 26,
            height: 26,
            margin: EdgeInsets.all(15),
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
          Text(' People you Follow',
              style: TextStyle(fontSize: 17.0, color: greyColor)),
          Container(
            width: 26,
            height: 26,
            margin: EdgeInsets.all(15),
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
            margin: EdgeInsets.all(15),
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
          Text(
              " Choose who can mention you in posts. When they try to mention you they will see if you don't allow tags from everyone.",
              style: TextStyle(fontSize: 12.0, color: greyColor)),
          SizedBox(width: 35),
        ],
      ]
          .asMap()
          .map(
            (index, e) => MapEntry(
              index,
              GestureDetector(
                 behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: EdgeInsets.only(left: 15, top: 0, bottom: 0),
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

  void operation(int i) {
    setState(() {
      index = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mentions'),
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
