import 'dart:ui';
import 'package:Vibez/pages/settings/privacy/ActivityStatus/ActivityStatus.dart';
import 'package:Vibez/pages/settings/privacy/AllowComboReact/AllowComboReact.dart';
import 'package:Vibez/pages/settings/privacy/BlockedUsers/BlockedUsers.dart';
import 'package:Vibez/pages/settings/privacy/Mentions/Mentions.dart';
import 'package:Vibez/pages/settings/privacy/MutedUsers/MutedUsers.dart';
import 'package:Vibez/pages/settings/privacy/RestrictedUsers/RestrictedUsers.dart';
import 'package:Vibez/pages/settings/privacy/Story/Story.dart';
import 'package:Vibez/pages/settings/privacy/comments/comments.dart';
import 'package:Vibez/pages/settings/privacy/comments/tagged.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Privacy extends StatefulWidget {
  @override
  _PrivacyState createState() => _PrivacyState();
}

class _PrivacyState extends State<Privacy> {
  final greyColor = Color.fromRGBO(184, 184, 184, 1);
  var _lights = true;

  List<GestureDetector> _buildList() => <List>[
        [
          SizedBox(),
          Text(' Account Privacy',
              style: TextStyle(fontSize: 17.0, color: Colors.white)),
          SizedBox(),
        ],
        [
          SizedBox(),
          Text(' Public Account',
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
          Text(' Interaction',
              style: TextStyle(fontSize: 17.0, color: Colors.white)),
          SizedBox(),
        ],
        [
          Image.asset('lib/assets/images/comment.png', width: 22.0, height: 18),
          Text(' Comments', style: TextStyle(fontSize: 17.0, color: greyColor)),
          Icon(Icons.chevron_right, color: greyColor, size: 30)
        ],
        [
          Image.asset('lib/assets/images/Tagged-Settings.png',
              width: 22.0, height: 18),
          Text(' Tags', style: TextStyle(fontSize: 17.0, color: greyColor)),
          Icon(Icons.chevron_right, color: greyColor, size: 30)
        ],
        [
          Icon(Icons.security, color: greyColor, size: 22.0),
          Text(' Mentions', style: TextStyle(fontSize: 17.0, color: greyColor)),
          Icon(Icons.chevron_right, color: greyColor, size: 30)
        ],
        [
          Image.asset('lib/assets/images/ads.png', width: 22.0, height: 18),
          Text(' Story', style: TextStyle(fontSize: 17.0, color: greyColor)),
          Icon(Icons.chevron_right, color: greyColor, size: 30)
        ],
        [
          Icon(Icons.account_circle, color: greyColor, size: 22.0),
          Text(' Allow Combo/React',
              style: TextStyle(fontSize: 17.0, color: greyColor)),
          Icon(Icons.chevron_right, color: greyColor, size: 30)
        ],
        [
          Image.asset('lib/assets/images/activiry.png',
              width: 22.0, height: 18),
          Text(' Activity Status',
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
          SizedBox()
        ],
        [
          SizedBox(),
          Text(' Users', style: TextStyle(fontSize: 17.0, color: Colors.white)),
          SizedBox(),
        ],
        [
          Icon(Icons.error, color: greyColor, size: 22.0),
          Text(' Restricted Users',
              style: TextStyle(fontSize: 17.0, color: greyColor)),
          Icon(Icons.chevron_right, color: greyColor, size: 30)
        ],
        [
          Image.asset('lib/assets/images/Blocked Settings Icon.png',
              width: 22.0, height: 18),
          Text(' Blocked Users',
              style: TextStyle(fontSize: 17.0, color: greyColor)),
          Icon(Icons.chevron_right, color: greyColor, size: 30)
        ],
        [
          Image.asset('lib/assets/images/Muted Settings Icon.png',
              width: 22.0, height: 18),
          Text(' Muted Users',
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
    print(index);
    switch (index) {
      case 4:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Comments();
        }));
        break;
      case 5:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Tagged();
        }));
        break;
      case 6:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Mentions();
        }));
        break;
      case 7:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Story();
        }));
        break;
      case 8:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return AllowComboReact();
        }));
        break;
      case 9:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ActivityStatus();
        }));
        break;
      case 12:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return RestrictedUsers();
        }));
        break;
      case 13:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return BlockedUsers();
        }));
        break;
        break;
      case 14:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return MutedUsers();
        }));
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy'),
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        leading: null,
      ),
      body: Container(
          color: Colors.black,
          width: double.infinity,
          height: double.infinity,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Column(
                children: _buildList(),
              );
            },
            itemCount: 1,
          )),
    );
  }
}
