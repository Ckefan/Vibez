import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopicFilter extends StatefulWidget {
  @override
  _TopicFilterState createState() => _TopicFilterState();
}

class _TopicFilterState extends State<TopicFilter> {
  final greyColor = Color.fromRGBO(184, 184, 184, 1);
  var index = 2;

  List<GestureDetector> _buildList() => <List>[
        [
          SizedBox(),
          Text(' See fewer ads on certain topics',
              style: TextStyle(fontSize: 17.0, color: Colors.white)),
          SizedBox(),
        ],
        [
          SizedBox(),
          Text(
              ' Choose topics that may be sensitive or that affect your experience.',
              style: TextStyle(fontSize: 12.0, color: greyColor)),
          SizedBox(
            width: 30,
          ),
        ],
        [
          SizedBox(),
          Text(' Alcohol', style: TextStyle(fontSize: 17.0, color: greyColor)),
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
          Text(' Social Issues',
              style: TextStyle(fontSize: 17.0, color: greyColor)),
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
          Text(' Politics', style: TextStyle(fontSize: 17.0, color: greyColor)),
          Container(
            width: 26,
            height: 26,
            margin: EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              color: index == 4
                  ? Color.fromRGBO(41, 169, 224, 1)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(50.0),
              border: Border.all(
                  width: 1,
                  color: index == 4
                      ? Color.fromRGBO(41, 169, 224, 1)
                      : Colors.white),
            ),
          )
        ],
        [
          SizedBox(),
          Text(' Parenting',
              style: TextStyle(fontSize: 17.0, color: greyColor)),
          Container(
            width: 26,
            height: 26,
            margin: EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              color: index == 5
                  ? Color.fromRGBO(41, 169, 224, 1)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(50.0),
              border: Border.all(
                  width: 1,
                  color: index == 5
                      ? Color.fromRGBO(41, 169, 224, 1)
                      : Colors.white),
            ),
          )
        ],
        [
          SizedBox(),
          Text(' Sexual Ads',
              style: TextStyle(fontSize: 17.0, color: greyColor)),
          Container(
            width: 26,
            height: 26,
            margin: EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              color: index == 6
                  ? Color.fromRGBO(41, 169, 224, 1)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(50.0),
              border: Border.all(
                  width: 1,
                  color: index == 6
                      ? Color.fromRGBO(41, 169, 224, 1)
                      : Colors.white),
            ),
          )
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

  void operation(int _index) {
    print(_index);
    setState(() {
      index = _index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Topic Filter'),
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
