import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CashOut extends StatefulWidget {
  @override
  _CashOutState createState() => _CashOutState();
}

class _CashOutState extends State<CashOut> {
  final greyColor = Color.fromRGBO(184, 184, 184, 1);
  var _lights = true;

  List<GestureDetector> _buildList() => <List>[
        [
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: Text.rich(
              TextSpan(children: [
                TextSpan(
                    text: 'CASH',
                    style: TextStyle(
                        fontSize: 19,
                        color: greyColor,
                        fontFamily: 'ExtraLight')),
                TextSpan(
                    text: ' OUT',
                    style: TextStyle(
                        fontSize: 19,
                        color: Color.fromRGBO(0, 255, 111, 1),
                        fontFamily: 'ExtraLight'))
              ]),
            ),
          ),
        ],
        [
          Text.rich(
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
                      fontFamily: 'ExtraLight')),
              TextSpan(
                  text: ' AVAILABLE',
                  style: TextStyle(
                      fontSize: 19, color: greyColor, fontFamily: 'ExtraLight'))
            ]),
          ),
        ],
        [
          Text('400',
              style: TextStyle(
                  fontSize: 50.0,
                  color: Color.fromRGBO(41, 169, 224, 1),
                  fontFamily: 'Medium')),
        ],
        [
          Text('CHANGE AMOUNT',
              style: TextStyle(
                  fontSize: 13.0, color: greyColor, fontFamily: 'ExtraLight')),
        ],
        [
          Text('\$2.00',
              style: TextStyle(
                  fontSize: 100.0,
                  color: Color.fromRGBO(50, 214, 68, 1),
                  fontFamily: 'Medium')),
        ],
        [
          Container(
            width: 300.0,
            height: 50.0,
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.0, -1.0),
                end: Alignment(0.0, 1.0),
                colors: [
                  Color.fromRGBO(52, 225, 75, 1),
                  Color.fromRGBO(42, 155, 29, 1),
                ],
              ),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: RaisedButton(
              child: Text(
                "Cash Out",
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 25,
                    fontWeight: FontWeight.w300),
              ),
              color: Colors.transparent,
              elevation: 0, // 正常时阴影隐藏
              highlightElevation: 0, // 点击
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  // return ConfirmationCode();
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
                child: Padding(
                  padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
                  child: e[0],
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
          // return CashOutForBusiness();
        }));
        break;
      default:
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("CashOut"),
          backgroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
          leading: null),
      body: Container(
        color: Colors.black,
        width: double.infinity,
        height: double.infinity,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: _buildList()),
      ),
    );
  }
}
