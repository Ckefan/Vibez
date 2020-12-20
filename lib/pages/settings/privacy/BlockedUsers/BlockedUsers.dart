import 'dart:ui';
import 'package:Vibez/components/myInput.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlockedUsers extends StatefulWidget {
  @override
  _BlockedUsersState createState() => _BlockedUsersState();
}

class _BlockedUsersState extends State<BlockedUsers> {
  final FocusNode focusNode = FocusNode();
  final greyColor = Color.fromRGBO(184, 184, 184, 1);
  String search = '';
  List _searchList = [];
  List _list = [
    {
      'name': 'ssfds',
      'sub_name': 'awierw',
      'img':
          'https://img.alicdn.com/imgextra/i1/1822315018/O1CN01PD9Yww1mwI5LtqTN4_!!1822315018.jpg',
      'active': false
    },
    {
      'name': 'asdf',
      'sub_name': 'awierw',
      'img':
          'https://img.alicdn.com/imgextra/i1/1822315018/O1CN01PD9Yww1mwI5LtqTN4_!!1822315018.jpg',
      'active': false
    },
    {
      'name': 'ersdf',
      'sub_name': 'awierw',
      'img':
          'https://img.alicdn.com/imgextra/i1/1822315018/O1CN01PD9Yww1mwI5LtqTN4_!!1822315018.jpg',
      'active': false
    },
    {
      'name': 'yuio',
      'sub_name': 'awierw',
      'img':
          'https://img.alicdn.com/imgextra/i1/1822315018/O1CN01PD9Yww1mwI5LtqTN4_!!1822315018.jpg',
      'active': false
    }
  ];

  List<Padding> getList() => (search != '' ? _searchList : _list)
      .map((e) => Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Row(
              children: [
                Container(
                  width: 53.0,
                  height: 53.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(e['img']),
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        e['name'],
                        style: TextStyle(
                            color: Color.fromRGBO(246, 246, 246, 1),
                            fontSize: 18.0),
                      ),
                      Text(
                        "@${e['sub_name']}",
                        style: TextStyle(
                            color: Color.fromRGBO(184, 184, 184, 1),
                            fontSize: 13.0),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 111.0,
                  height: 29.0,
                  child: OutlineButton(
                    padding: EdgeInsets.all(0),
                    borderSide: new BorderSide(
                      color: Color.fromRGBO(184, 184, 184, 1),
                    ),
                    onPressed: () {
                      print('Follow');
                    },
                    child: Text(
                      'Un-Restrict',
                      style: TextStyle(fontSize: 15.0, color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ))
      .toList();

  void onSeach(v) {
    setState(() {
      search = v;
      _searchList = _list.where((e) => e['name'].contains(v)).toList();
    });
  }

  Widget _infoText() => Container(
        margin: EdgeInsets.only(left: 30, right: 30),
        child: Text(
            "Resticted Users will be able to comment on your posts but will only be visible to them. Your Story & Lives will not be visible to user. People you restrict won't get notified that you have restricted them and your online status. Comments made by Restricted Users are only seen by you and the other user.",
            style: TextStyle(fontSize: 12.0, color: greyColor)),
      );

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      title: Text('Blocked Users'),
      backgroundColor: Colors.black,
      elevation: 0,
      centerTitle: true,
      leading: null,
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBar,
      body: Container(
        color: Colors.black,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            MyInput(
              onSeach: onSeach,
            ),
            _infoText(),
            GestureDetector(
              onTap: () {
                focusNode.unfocus();
              },
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height -
                    appBar.preferredSize.height -
                    200 -
                    110,
                child: ListView(
                  children: [...getList()],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
