import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Balance extends StatefulWidget {
  @override
  _BalanceState createState() => _BalanceState();
}

class _BalanceState extends State<Balance> {
  final greyColor = Color.fromRGBO(184, 184, 184, 1);
  var _lights = true;

  List<GestureDetector> _buildList() => <List>[
        [
          SizedBox(),
          Text.rich(TextSpan(children: [
            TextSpan(
                text: 'DIAMOND',
                style: TextStyle(
                    fontSize: 19, color: greyColor, fontFamily: 'ExtraLight')),
            TextSpan(
                text: 'Balance',
                style: TextStyle(
                    fontSize: 19,
                    color: Color.fromRGBO(41, 169, 224, 1),
                    fontFamily: 'ExtraLight'))
          ])),
          SizedBox(),
        ],
        [
          SizedBox(),
          Text(' Language', style: TextStyle(fontSize: 17.0, color: greyColor)),
          SizedBox(),
        ],
        [
          SizedBox(),
          Text(' Contact Syncing',
              style: TextStyle(fontSize: 17.0, color: greyColor)),
          SizedBox(),
        ],
        [
          SizedBox(),
          Text(' Cellular Data Use',
              style: TextStyle(fontSize: 17.0, color: greyColor)),
          SizedBox(),
        ],
        [
          SizedBox(),
          Text(' Cellular Data Use',
              style: TextStyle(fontSize: 17.0, color: greyColor)),
          SizedBox(),
        ],
        [
          SizedBox(),
          Text(' Cellular Data Use',
              style: TextStyle(fontSize: 17.0, color: greyColor)),
          SizedBox(),
        ],
        [
          SizedBox(),
          Text(' Cellular Data Use',
              style: TextStyle(fontSize: 17.0, color: greyColor)),
          SizedBox(),
        ],
        [
          SizedBox(),
          Text(' Cellular Data Use',
              style: TextStyle(fontSize: 17.0, color: greyColor)),
          SizedBox(),
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
          // return BalanceForBusiness();
        }));
        break;
      default:
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Balance"),
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
