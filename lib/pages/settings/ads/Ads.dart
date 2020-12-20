import 'package:Vibez/pages/settings/ads/AdsForBusiness.dart';
import 'package:Vibez/pages/settings/ads/TopicFilter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Ads extends StatefulWidget {
  @override
  _AdsState createState() => _AdsState();
}

class _AdsState extends State<Ads> {
  final greyColor = Color.fromRGBO(184, 184, 184, 1);
  var _lights = true;

  List<GestureDetector> _buildList() => <List>[
        [
          SizedBox(),
          Text(' Ads', style: TextStyle(fontSize: 17.0, color: Colors.white)),
          SizedBox(),
        ],
        [
          SizedBox(),
          Text(' Allow Personalized Ads',
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
          Text(' Ad Topic Filter',
              style: TextStyle(fontSize: 17.0, color: greyColor)),
          Icon(Icons.chevron_right, color: greyColor, size: 30)
        ],
        [
          SizedBox(),
          Text(' Ads for Business',
              style: TextStyle(fontSize: 17.0, color: greyColor)),
          Icon(Icons.chevron_right, color: greyColor, size: 30)
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
          return TopicFilter();
        }));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return AdsForBusiness();
        }));
        break;
      default:
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Ads"),
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
