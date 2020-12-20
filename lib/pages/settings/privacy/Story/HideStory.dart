import 'dart:ui';
import 'package:Vibez/components/myInput.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HideStory extends StatefulWidget {
  @override
  _HideStoryState createState() => _HideStoryState();
}

class _HideStoryState extends State<HideStory> {
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
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    setState(() {
                      e['active'] = !e['active'];
                    });
                  },
                  child: Container(
                    width: 26,
                    height: 26,
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: e['active']
                          ? Color.fromRGBO(41, 169, 224, 1)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(50.0),
                      border: Border.all(
                          width: 1,
                          color: e['active']
                              ? Color.fromRGBO(41, 169, 224, 1)
                              : Colors.white),
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

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
        title: Text('Hide Story From'),
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        leading: null,
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop('ok');
            },
            child: Text(
              'Done',
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Medium',
                color: Color.fromRGBO(41, 169, 224, 1),
              ),
            ),
          ),
        ]);
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
            GestureDetector(
              onTap: () {
                focusNode.unfocus();
              },
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height -
                    appBar.preferredSize.height -
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
