import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  final greyColor = Color.fromRGBO(184, 184, 184, 1);
  var _lights = true;

  List<GestureDetector> _buildList() => <List>[
        [
          SizedBox(),
          Text(' Terms Of Service',
              style: TextStyle(fontSize: 17.0, color: greyColor)),
          Icon(Icons.chevron_right, color: greyColor, size: 30)
        ],
        [
          SizedBox(),
          Text(' Intellectual Property Policy',
              style: TextStyle(fontSize: 17.0, color: greyColor)),
          Icon(Icons.chevron_right, color: greyColor, size: 30)
        ],
        [
          SizedBox(),
          Text(' Privacy Policy',
              style: TextStyle(fontSize: 17.0, color: greyColor)),
          Icon(Icons.chevron_right, color: greyColor, size: 30)
        ],
        [
          SizedBox(),
          Text(' Privacy Policy for Young Users',
              style: TextStyle(fontSize: 17.0, color: greyColor)),
          Icon(Icons.chevron_right, color: greyColor, size: 30)
        ],
        [
          SizedBox(),
          Text(' Cookies Policy',
              style: TextStyle(fontSize: 17.0, color: greyColor)),
          Icon(Icons.chevron_right, color: greyColor, size: 30)
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
          Center(
            child: Text(' Vibez 1.0 released 10/22/2020',
                style: TextStyle(fontSize: 12.0, color: greyColor)),
          ),
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
          // return AboutForBusiness();
        }));
        break;
      default:
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("About"),
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
