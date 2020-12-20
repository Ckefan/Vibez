import 'package:flutter/material.dart';

class Security extends StatefulWidget {
  @override
  _SecurityState createState() => _SecurityState();
}

class _SecurityState extends State<Security> {
  final greyColor = Color.fromRGBO(184, 184, 184, 1);

  List<GestureDetector> _buildList() => <List>[
        [
          SizedBox(),
          Text(' Login Security',
              style: TextStyle(fontSize: 17.0, color: Colors.white)),
          SizedBox(),
        ],
        [
          Image.asset('lib/assets/images/Password Icon.png',
              width: 22.0, height: 18),
          Text(' Password', style: TextStyle(fontSize: 17.0, color: greyColor)),
          Icon(Icons.chevron_right, color: greyColor, size: 30)
        ],
        [
          Image.asset('lib/assets/images/Saved Login Info Icon.png',
              width: 22.0, height: 18),
          Text(' Saved Login',
              style: TextStyle(fontSize: 17.0, color: greyColor)),
          Icon(Icons.chevron_right, color: greyColor, size: 30)
        ],
        [
          Icon(
            Icons.security,
            color: greyColor,
            size: 22.0,
          ),
          Text(' Two-Factor Authentication',
              style: TextStyle(fontSize: 17.0, color: greyColor)),
          Icon(Icons.chevron_right, color: greyColor, size: 30)
        ],
        [
          Image.asset('lib/assets/images/Emails From vibez Icon.png',
              width: 22.0, height: 18),
          Text(' Emails from Vibez',
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
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          // return FollowInviteFriends();
        }));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          // return Activity();
        }));
        break;
      case 4:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          // return Privacy();
        }));
        break;
      default:
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Security"),
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
