import 'package:flutter/material.dart';
import 'follow_people_contacts/index.dart';

class FollowInviteFriends extends StatefulWidget {
  @override
  _FollowInviteFriendsState createState() => _FollowInviteFriendsState();
}

class _FollowInviteFriendsState extends State<FollowInviteFriends> {
  final greyColor = Color.fromRGBO(184, 184, 184, 1);

  List<GestureDetector> _buildList() => <List>[
        [' Invite Friends via SMS'],
        [' Invite Friends via Emai'],
        [' Follow People in Contacts', Icons.chevron_right],
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
                      Expanded(
                        child: Text(
                          e[0],
                          style: TextStyle(
                            fontSize: 17.0,
                            color: greyColor,
                          ),
                        ),
                      ),
                      e.length == 2
                          ? Icon(
                              e[1],
                              color: greyColor,
                              size: 30,
                            )
                          : SizedBox(),
                    ],
                  ),
                ),
                onTap: () => operation(index),
              ),
            ),
          )
          .values
          .toList();

  void operation(int index) => {
        if (index == 2)
          {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return FollowPeopleContacts();
            }))
          }
      };

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Follow and Invite Friends"),
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
