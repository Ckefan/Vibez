import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuyDiamonds extends StatefulWidget {
  @override
  _BuyDiamondsState createState() => _BuyDiamondsState();
}

class _BuyDiamondsState extends State<BuyDiamonds> {
  final greyColor = Color.fromRGBO(184, 184, 184, 1);
  var _lights = true;

  List<GestureDetector> _buildList() => <List>[
        [
          SizedBox(),
          Container(
            padding: EdgeInsets.only(top: 50, bottom: 50),
            alignment: Alignment.center,
            child: Text.rich(
              TextSpan(children: [
                TextSpan(
                    text: 'DIAMOND',
                    style: TextStyle(
                        fontSize: 19,
                        color: greyColor,
                        fontFamily: 'ExtraLight')),
                TextSpan(
                    text: ' Balance',
                    style: TextStyle(
                        fontSize: 19,
                        color: Color.fromRGBO(41, 169, 224, 1),
                        fontFamily: 'ExtraLight'))
              ]),
            ),
          ),
          SizedBox(),
        ],
        [
          Image.asset('lib/assets/images/diamonds.png', width: 62, height: 62),
          Padding(
            padding: EdgeInsets.only(left: 13),
            child: Text.rich(
              TextSpan(children: [
                TextSpan(
                    text: '400',
                    style: TextStyle(
                        fontSize: 19,
                        color: greyColor,
                        fontFamily: 'ExtraLight')),
                TextSpan(
                    text: ' DIAMONDS',
                    style: TextStyle(
                        fontSize: 19,
                        color: Color.fromRGBO(41, 169, 224, 1),
                        fontFamily: 'ExtraLight'))
              ]),
            ),
          ),
          Container(
            width: 86.0,
            height: 34.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.0, -1.0),
                end: Alignment(0.0, 1.0),
                colors: [
                  Color.fromRGBO(41, 169, 224, 1),
                  Color.fromRGBO(82, 168, 204, 1),
                ],
              ),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: RaisedButton(
              child: Text(
                "\$4.99",
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.w300),
              ),
              color: Colors.transparent,
              elevation: 0, // 正常时阴影隐藏
              highlightElevation: 0, // 点击
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return BuyDiamonds();
                }));
              },
            ),
          )
        ],
        [
          Image.asset('lib/assets/images/diamonds.png', width: 62, height: 62),
          Padding(
            padding: EdgeInsets.only(left: 13),
            child: Text.rich(
              TextSpan(children: [
                TextSpan(
                    text: '800',
                    style: TextStyle(
                        fontSize: 19,
                        color: greyColor,
                        fontFamily: 'ExtraLight')),
                TextSpan(
                    text: ' DIAMONDS',
                    style: TextStyle(
                        fontSize: 19,
                        color: Color.fromRGBO(41, 169, 224, 1),
                        fontFamily: 'ExtraLight'))
              ]),
            ),
          ),
          Container(
            width: 86.0,
            height: 34.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.0, -1.0),
                end: Alignment(0.0, 1.0),
                colors: [
                  Color.fromRGBO(41, 169, 224, 1),
                  Color.fromRGBO(82, 168, 204, 1),
                ],
              ),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: RaisedButton(
              child: Text(
                "\$9.99",
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.w300),
              ),
              color: Colors.transparent,
              elevation: 0, // 正常时阴影隐藏
              highlightElevation: 0, // 点击
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return BuyDiamonds();
                }));
              },
            ),
          )
        ],
        [
          Image.asset('lib/assets/images/diamonds.png', width: 62, height: 62),
          Padding(
            padding: EdgeInsets.only(left: 13),
            child: Text.rich(
              TextSpan(children: [
                TextSpan(
                    text: '2,500',
                    style: TextStyle(
                        fontSize: 19,
                        color: greyColor,
                        fontFamily: 'ExtraLight')),
                TextSpan(
                    text: ' DIAMONDS',
                    style: TextStyle(
                        fontSize: 19,
                        color: Color.fromRGBO(41, 169, 224, 1),
                        fontFamily: 'ExtraLight'))
              ]),
            ),
          ),
          Container(
            width: 86.0,
            height: 34.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.0, -1.0),
                end: Alignment(0.0, 1.0),
                colors: [
                  Color.fromRGBO(41, 169, 224, 1),
                  Color.fromRGBO(82, 168, 204, 1),
                ],
              ),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: RaisedButton(
              child: Text(
                "\$28.99",
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.w300),
              ),
              color: Colors.transparent,
              elevation: 0, // 正常时阴影隐藏
              highlightElevation: 0, // 点击
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return BuyDiamonds();
                }));
              },
            ),
          )
        ],
        [
          Image.asset('lib/assets/images/diamonds.png', width: 62, height: 62),
          Padding(
            padding: EdgeInsets.only(left: 13),
            child: Text.rich(
              TextSpan(children: [
                TextSpan(
                    text: '5,000',
                    style: TextStyle(
                        fontSize: 19,
                        color: greyColor,
                        fontFamily: 'ExtraLight')),
                TextSpan(
                    text: ' DIAMONDS',
                    style: TextStyle(
                        fontSize: 19,
                        color: Color.fromRGBO(41, 169, 224, 1),
                        fontFamily: 'ExtraLight'))
              ]),
            ),
          ),
          Container(
            width: 86.0,
            height: 34.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.0, -1.0),
                end: Alignment(0.0, 1.0),
                colors: [
                  Color.fromRGBO(41, 169, 224, 1),
                  Color.fromRGBO(82, 168, 204, 1),
                ],
              ),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: RaisedButton(
              child: Text(
                "\$54.99",
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.w300),
              ),
              color: Colors.transparent,
              elevation: 0, // 正常时阴影隐藏
              highlightElevation: 0, // 点击
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return BuyDiamonds();
                }));
              },
            ),
          )
        ],
        [
          Image.asset('lib/assets/images/diamonds.png', width: 62, height: 62),
          Padding(
            padding: EdgeInsets.only(left: 13),
            child: Text.rich(
              TextSpan(children: [
                TextSpan(
                    text: '10,000',
                    style: TextStyle(
                        fontSize: 19,
                        color: greyColor,
                        fontFamily: 'ExtraLight')),
                TextSpan(
                    text: ' DIAMONDS',
                    style: TextStyle(
                        fontSize: 19,
                        color: Color.fromRGBO(41, 169, 224, 1),
                        fontFamily: 'ExtraLight'))
              ]),
            ),
          ),
          Container(
            width: 86.0,
            height: 34.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.0, -1.0),
                end: Alignment(0.0, 1.0),
                colors: [
                  Color.fromRGBO(41, 169, 224, 1),
                  Color.fromRGBO(82, 168, 204, 1),
                ],
              ),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: RaisedButton(
              child: Text(
                "\$99.99",
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.w300),
              ),
              color: Colors.transparent,
              elevation: 0, // 正常时阴影隐藏
              highlightElevation: 0, // 点击
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return BuyDiamonds();
                }));
              },
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
                child: Container(
                  padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 1, color: greyColor))),
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
    switch (index) {
      case 1:
        print(index);
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          // return TopicFilter();
        }));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          // return BuyDiamondsForBusiness();
        }));
        break;
      default:
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Buy Diamonds"),
          backgroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
          leading: null),
      body: Container(
        color: Colors.black,
        width: double.infinity,
        height: double.infinity,
        child: Column(children: _buildList()),
      ),
    );
  }
}
