import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdsForBusiness extends StatefulWidget {
  @override
  _AdsForBusinessState createState() => _AdsForBusinessState();
}

class _AdsForBusinessState extends State<AdsForBusiness> {
  final greyColor = Color.fromRGBO(184, 184, 184, 1);
  var index = 2;

  List<GestureDetector> _buildList() => <List>[
        [
          SizedBox(),
          Container(
            margin: EdgeInsets.only(top: 50, bottom: 50),
            width: 100,
            alignment: Alignment.center,
            child: Text(' Advertise Your Business with Vibez',
                style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.white,
                    fontFamily: 'ExtraLight')),
          ),
          SizedBox(),
        ],
        [
          SizedBox(),
          Text(
              ' Visit www.vibez.com/business to learn more and setup an ad campaign.',
              style: TextStyle(fontSize: 12.0, color: greyColor)),
          SizedBox(
            width: 30,
          ),
        ],
        [
          SizedBox(),
          Container(
            margin: EdgeInsets.only(top: 50, bottom: 50),
            width: 120,
            alignment: Alignment.center,
            child: RaisedButton(
              color: Color.fromRGBO(41, 169, 224, 1),
              onPressed: () {
                print('Visit Now');
              },
              child: Text(
                'Visit Now',
                style: TextStyle(fontSize: 15.0, color: Colors.white),
              ),
              shape: RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(),
        ]
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
        title: Text('Ads for Business'),
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
