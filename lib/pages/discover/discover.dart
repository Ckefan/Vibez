import 'dart:ui';

import 'package:Vibez/components/myInput.dart';
import 'package:flutter/material.dart';

class Discover extends StatefulWidget {
  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  final whiteColor = Color.fromRGBO(246, 246, 246, 1);
  final grayColor = Colors.white60;

  @override
  void initState() {
    super.initState();
  }

  List<Padding> _genreList() => [
        {'img': 'lib/assets/images/Funny Category.png', 'name': 'Trending'},
        {'img': 'lib/assets/images/Cute Category.png', 'name': 'Funny'},
        {'img': 'lib/assets/images/Funny Category.png', 'name': 'Cute'},
        {'img': 'lib/assets/images/Music Category.png', 'name': 'Goofy'},
        {'img': 'lib/assets/images/Cute Category.png', 'name': 'Music'},
        {'img': 'lib/assets/images/Funny Category.png', 'name': 'Trending'},
        {'img': 'lib/assets/images/Music Category.png', 'name': 'Trending'},
      ]
          .map(
            (e) => Padding(
              padding: EdgeInsets.only(right: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(e['img'], width: 73, height: 73),
                  Text(
                    e['name'],
                    style: TextStyle(
                        color: Color.fromRGBO(138, 138, 138, 1), fontSize: 13),
                  ),
                ],
              ),
            ),
          )
          .toList();

  List<Padding> _videoList() => [
        'lib/assets/images/sp.png',
        'lib/assets/images/sp.png',
        'lib/assets/images/sp.png',
        'lib/assets/images/sp.png',
        'lib/assets/images/sp.png',
        'lib/assets/images/sp.png',
        'lib/assets/images/sp.png',
        'lib/assets/images/sp.png',
        'lib/assets/images/sp.png',
      ]
          .map((e) => Padding(
              padding: EdgeInsets.only(right: 10),
              child: Image.asset(e, width: 103, height: 172)))
          .toList();
  List<Padding> _recommendedUsersList() => [
        {
          'img': 'lib/assets/images/user-img.png',
          'name': 'Tommy',
          'num': '12M',
          'isFollow': false
        },
        {
          'img': 'lib/assets/images/user-img.png',
          'name': 'Tommy',
          'num': '2M',
          'isFollow': false
        },
        {
          'img': 'lib/assets/images/user-img.png',
          'name': 'Tommy',
          'num': '52M',
          'isFollow': true
        },
        {
          'img': 'lib/assets/images/user-img.png',
          'name': 'Tommy',
          'num': '22M',
          'isFollow': false
        },
        {
          'img': 'lib/assets/images/user-img.png',
          'name': 'Tommy',
          'num': '22M',
          'isFollow': false
        },
      ]
          .map((e) => Padding(
              padding: EdgeInsets.only(right: 10, bottom: 20.0),
              child: Stack(
                alignment: Alignment.center,
                overflow: Overflow.visible,
                children: [
                  Container(
                    width: 97.0,
                    height: 115.0,
                    padding: EdgeInsets.only(top: 5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colors.white, width: 2)),
                    child: Column(
                      children: [
                        Container(
                          width: 55.0,
                          height: 55.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(e['img']),
                            ),
                          ),
                        ),
                        Text(
                          e['name'],
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.play_arrow,
                                size: 14, color: Colors.white),
                            Text(
                              e['num'],
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: -12.0,
                    child: Container(
                      width: 63.0,
                      height: 24.0,
                      // margin: EdgeInsets.only(top: 70.0),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.0, -1.0),
                          end: Alignment(0.0, 1.0),
                          colors: e['isFollow']
                              ? [
                                  Color.fromRGBO(41, 169, 224, 1),
                                  Color.fromRGBO(82, 168, 204, 1),
                                ]
                              : [
                                  Color.fromRGBO(255, 35, 57, 1),
                                  Color.fromRGBO(188, 0, 53, 1),
                                ],
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: RaisedButton(
                          padding: EdgeInsets.all(0),
                          child: Text(
                            e['isFollow'] ? 'Following' : 'Follow',
                            style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontSize: 10.0,
                            ),
                          ),
                          color: Colors.transparent,
                          elevation: 0, // 正常时阴影隐藏
                          highlightElevation: 0, // 点击
                          onPressed: () {}),
                    ),
                  ),
                ],
              )))
          .toList();

  List<Padding> _topTags() => [
        {'img': 'lib/assets/images/user-img.png', 'name': '#asfsf'},
        {'img': 'lib/assets/images/user-img.png', 'name': '#456'},
        {'img': 'lib/assets/images/user-img.png', 'name': '#sdfgdf'},
        {'img': 'lib/assets/images/user-img.png', 'name': '#6787'},
        {'img': 'lib/assets/images/user-img.png', 'name': '#09-'},
        {'img': 'lib/assets/images/user-img.png', 'name': '#3456'},
        {'img': 'lib/assets/images/user-img.png', 'name': '#sdgf'},
        {'img': 'lib/assets/images/user-img.png', 'name': '#jhgj'},
        {'img': 'lib/assets/images/user-img.png', 'name': '#sdfr'},
      ]
          .map((e) => Padding(
                padding: EdgeInsets.only(right: 10, bottom: 10.0),
                child: Column(
                  children: [
                    Image.asset(
                      e['img'],
                      width: 63,
                      height: 63,
                    ),
                    Text(
                      e['name'],
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: 'ExtraLight'),
                    )
                  ],
                ),
              ))
          .toList();

  List _suggestedList() => [
        {'img': 'lib/assets/images/sp.png', 'id': '123'},
        {'img': 'lib/assets/images/sp.png', 'id': '123'},
        {'img': 'lib/assets/images/sp.png', 'id': '123'},
        {'img': 'lib/assets/images/sp.png', 'id': '123'},
        {'img': 'lib/assets/images/sp.png', 'id': '123'},
        {'img': 'lib/assets/images/sp.png', 'id': '123'}
      ]
          .map((e) => Image.asset(
                e['img'],
                width: 108.0,
                height: 147.0,
              ))
          .toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.black,
      child: Padding(
        padding: EdgeInsets.only(top: 20.0, bottom: 60.0),
        child: NestedScrollView(
          headerSliverBuilder: (context, bool) {
            return [
              SliverAppBar(
                elevation: null,
                centerTitle: true,
                leading: null,
                primary: false,
                automaticallyImplyLeading: false,
                expandedHeight: 200.0,
                pinned: true,
                backgroundColor: Colors.black,
                title: MyInput(),
                flexibleSpace: FlexibleSpaceBar(
                    titlePadding: EdgeInsets.all(0),
                    background: Container(
                      margin: EdgeInsets.only(top: 60),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.0, -1.0),
                          end: Alignment(0.0, 1.0),
                          colors: [
                            Color.fromRGBO(0, 0, 0, 1),
                            Color.fromRGBO(110, 114, 116, .4),
                            Color.fromRGBO(0, 0, 0, 1),
                          ],
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('lib/assets/images/vibez-logo.png',
                                  width: 60, height: 52),
                              Column(
                                children: [
                                  Text(
                                    "THIS WEEK'S",
                                    style: TextStyle(
                                        color: Color.fromRGBO(246, 246, 246, 1),
                                        fontSize: 18,
                                        fontFamily: 'ExtraLight'),
                                  ),
                                  Text(
                                    "HOTS",
                                    style: TextStyle(
                                        color: Color.fromRGBO(246, 246, 246, 1),
                                        fontSize: 35,
                                        fontFamily: 'ExtraLight'),
                                  )
                                ],
                              )
                            ],
                          ),
                          Container(
                            // width: 85.0,
                            height: 24.0,
                            margin: EdgeInsets.only(top: 10.0),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment(0.0, -1.0),
                                end: Alignment(0.0, 1.0),
                                colors: [
                                  Color.fromRGBO(158, 152, 153, 1),
                                  Color.fromRGBO(79, 76, 77, 1),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: RaisedButton(
                                child: Text(
                                  "Watch Now",
                                  style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: 12.0,
                                  ),
                                ),
                                color: Colors.transparent,
                                elevation: 0, // 正常时阴影隐藏
                                highlightElevation: 0, // 点击
                                onPressed: () {}),
                          ),
                        ],
                      ),
                    )),
              ),
            ];
          },
          body: ListView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(0),
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Genre',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontFamily: 'Bold'),
                        ),
                        FlatButton(
                          child: Text(
                            'See All',
                            style: TextStyle(
                                color: Color.fromRGBO(138, 138, 138, 1),
                                fontSize: 12,
                                fontFamily: 'Bold'),
                          ),
                          onPressed: () {
                            print(123123);
                          },
                        )
                      ],
                    ),
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: _genreList(),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Color.fromRGBO(112, 112, 112, 1),
                height: 0,
                thickness: 1,
                indent: 0,
                endIndent: 0,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Trending Videos',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontFamily: 'Bold'),
                    ),
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: _videoList(),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Color.fromRGBO(112, 112, 112, 1),
                height: 0,
                thickness: 1,
                indent: 0,
                endIndent: 0,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recommended Users',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontFamily: 'Bold'),
                    ),
                    SingleChildScrollView(
                      padding: EdgeInsets.only(top: 10),
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: _recommendedUsersList(),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Color.fromRGBO(112, 112, 112, 1),
                height: 0,
                thickness: 1,
                indent: 0,
                endIndent: 0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Top Tags',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontFamily: 'Bold'),
                        ),
                        FlatButton(
                          child: Text(
                            'See More',
                            style: TextStyle(
                                color: Color.fromRGBO(138, 138, 138, 1),
                                fontSize: 12,
                                fontFamily: 'Bold'),
                          ),
                          onPressed: () {
                            print(123123);
                          },
                        )
                      ],
                    ),
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: _topTags(),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Color.fromRGBO(112, 112, 112, 1),
                height: 0,
                thickness: 1,
                indent: 0,
                endIndent: 0,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Suggested',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontFamily: 'Bold'),
                    ),
                    GridView.builder(
                        padding: EdgeInsets.only(top: 10),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, //横轴三个子widget
                            crossAxisSpacing: 0, //横轴方向的间距。
                            mainAxisSpacing: 0, //竖轴方向的间距。
                            childAspectRatio: .72 //宽高
                            ),
                        itemCount: _suggestedList().length,
                        itemBuilder: (context, index) {
                          return _suggestedList()[index];
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
