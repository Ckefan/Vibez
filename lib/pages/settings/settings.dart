import 'dart:ui';

import 'package:Vibez/pages/entry/entry.dart';
import 'package:Vibez/pages/settings/about/About.dart';
import 'package:Vibez/pages/settings/account/Account.dart';
import 'package:Vibez/pages/settings/activity.dart';
import 'package:Vibez/pages/settings/ads/Ads.dart';
import 'package:Vibez/pages/settings/balance/Balance.dart';
import 'package:Vibez/pages/settings/help/Help.dart';
import 'package:Vibez/pages/settings/privacy/privacy.dart';
import 'package:Vibez/pages/settings/security/Security.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'follow_invite_friends/index.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final greyColor = Color.fromRGBO(184, 184, 184, 1);

  List<GestureDetector> _buildList() => <List>[
        [
          Icon(Icons.people, color: greyColor, size: 22.0),
          Expanded(
            child: Text(
              ' Follow and Invite Friends',
              style: TextStyle(fontSize: 17.0, color: greyColor),
            ),
          ),
          Icon(Icons.chevron_right, color: greyColor, size: 30)
        ],
        [
          Image.asset('lib/assets/images/activiry.png',
              width: 22.0, height: 18),
          Expanded(
            child: Text(
              ' Activity',
              style: TextStyle(fontSize: 17.0, color: greyColor),
            ),
          ),
          Icon(Icons.chevron_right, color: greyColor, size: 30)
        ],
        [
          Image.asset('lib/assets/images/archive.png', width: 22.0, height: 18),
          Expanded(
            child: Text(
              ' Archive',
              style: TextStyle(fontSize: 17.0, color: greyColor),
            ),
          ),
          Icon(Icons.chevron_right, color: greyColor, size: 30)
        ],
        [
          Icon(Icons.notifications_active, color: greyColor, size: 22.0),
          Expanded(
            child: Text(
              ' Notifications',
              style: TextStyle(fontSize: 17.0, color: greyColor),
            ),
          ),
          Icon(Icons.chevron_right, color: greyColor, size: 30)
        ],
        [
          Icon(Icons.lock, color: greyColor, size: 22.0),
          Expanded(
            child: Text(
              ' Privacy',
              style: TextStyle(fontSize: 17.0, color: greyColor),
            ),
          ),
          Icon(Icons.chevron_right, color: greyColor, size: 30)
        ],
        [
          Icon(Icons.security, color: greyColor, size: 22.0),
          Expanded(
            child: Text(
              ' Security',
              style: TextStyle(
                fontSize: 17.0,
                color: greyColor,
              ),
            ),
          ),
          Icon(Icons.chevron_right, color: greyColor, size: 30)
        ],
        [
          Image.asset('lib/assets/images/ads.png', width: 22.0, height: 18),
          Expanded(
            child: Text(
              ' Ads',
              style: TextStyle(fontSize: 17.0, color: greyColor),
            ),
          ),
          Icon(Icons.chevron_right, color: greyColor, size: 30)
        ],
        [
          Icon(Icons.account_circle, color: greyColor, size: 22.0),
          Expanded(
            child: Text(
              ' Account',
              style: TextStyle(fontSize: 17.0, color: greyColor),
            ),
          ),
          Icon(Icons.chevron_right, color: greyColor, size: 30)
        ],
        [
          Image.asset('lib/assets/images/diamond.png', width: 22.0, height: 18),
          Expanded(
            child: Text(
              ' Diamond Balance',
              style: TextStyle(fontSize: 17.0, color: greyColor),
            ),
          ),
          Icon(Icons.chevron_right, color: greyColor, size: 30)
        ],
        [
          Icon(Icons.help, color: greyColor, size: 22.0),
          Expanded(
            child: Text(' Help',
                style: TextStyle(fontSize: 17.0, color: greyColor)),
          ),
          Icon(Icons.chevron_right, color: greyColor, size: 30)
        ],
        [
          Icon(Icons.error, color: greyColor, size: 22.0),
          Expanded(
            child: Text(
              ' About',
              style: TextStyle(fontSize: 17.0, color: greyColor),
            ),
          ),
          Icon(Icons.chevron_right, color: greyColor, size: 30)
        ],
        [
          SizedBox(),
          Expanded(
            child: Divider(
              color: Color.fromRGBO(246, 246, 246, 1),
              height: 0,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
          ),
          SizedBox(),
        ],
        [
          SizedBox(),
          Center(
            child: Text(' Log Out',
                style: TextStyle(
                    fontSize: 20.0,
                    color: Color.fromRGBO(255, 35, 57, 1),
                    fontFamily: 'Medium')),
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
                    children: [e[0], e[1], e[2]],
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
          return FollowInviteFriends();
        }));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Activity();
        }));
        break;
      case 4:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Privacy();
        }));
        break;
      case 5:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Security();
        }));
        break;
      case 6:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Ads();
        }));
        break;
      case 7:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Account();
        }));
        break;
      case 8:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Balance();
        }));
        break;
      case 9:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Help();
        }));
        break;
      case 10:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return About();
        }));
        break;
      case 12:
        showCupertinoModalPopup(
            context: context,
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            builder: (BuildContext context) {
              return CupertinoActionSheet(
                title: Text(''),
                message: Text('Are you sure you want to log out?'),
                actions: <Widget>[
                  CupertinoActionSheetAction(
                    child: Text('Log Out'),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Entry();
                      }));
                    },
                    isDestructiveAction: true,
                  ),
                  CupertinoActionSheetAction(
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.pop(context, 'Cancel');
                    },
                    isDefaultAction: true,
                  ),
                ],
              );
            });
        break;
      default:
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Settings"),
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
