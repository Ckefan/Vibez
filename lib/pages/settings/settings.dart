import 'package:Vibez/pages/settings/activity.dart';
import 'package:Vibez/pages/settings/privacy/index.dart';
import 'package:flutter/material.dart';

import 'follow_invite_friends/index.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final greyColor = Color.fromRGBO(184, 184, 184, 1);

  List<GestureDetector> _buildList() => <List>[
        [Icons.people, ' Follow and Invite Friends', Icons.chevron_right],
        ['lib/assets/images/activiry.png', ' Activity', Icons.chevron_right],
        ['lib/assets/images/archive.png', ' Archive', Icons.chevron_right],
        [Icons.notifications_active, ' Notifications', Icons.chevron_right],
        [Icons.lock, ' Privacy', Icons.chevron_right],
        [Icons.security, ' Security', Icons.chevron_right],
        ['lib/assets/images/ads.png', ' Ads', Icons.chevron_right],
        [Icons.account_circle, ' Account', Icons.chevron_right],
        [
          'lib/assets/images/diamond.png',
          ' Diamond Balance',
          Icons.chevron_right
        ],
        [Icons.help, ' Help', Icons.chevron_right],
        [Icons.error, ' About', Icons.chevron_right],
      ]
          .asMap()
          .map(
            (index, e) => MapEntry(
              index,
              GestureDetector(
                child: Padding(
                  padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      e[0] is String
                          ? Image.asset(
                              e[0],
                              width: 22.0,
                              height: 18,
                            )
                          : Icon(
                              e[0],
                              color: greyColor,
                              size: 22.0,
                            ),
                      Expanded(
                        child: Text(
                          e[1],
                          style: TextStyle(
                            fontSize: 17.0,
                            color: greyColor,
                          ),
                        ),
                      ),
                      Icon(
                        e[2],
                        color: greyColor,
                        size: 22,
                      ),
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
