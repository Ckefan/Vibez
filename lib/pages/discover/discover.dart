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

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.black,
      child: Padding(
        padding: EdgeInsets.only(top: 30.0, bottom: 60.0),
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
                      // title: MyInput(),
                      titlePadding: EdgeInsets.all(0),
                      background: Container(
                        margin: EdgeInsets.only(top: 60),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(0.0, -1.0),
                            end: Alignment(0.0, 1.0),
                            colors: [
                              Color.fromRGBO(0, 0, 0, 1),
                              Color.fromRGBO(110, 114, 116, .6),
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
                                          color:
                                              Color.fromRGBO(246, 246, 246, 1),
                                          fontSize: 18,
                                          fontFamily: 'ExtraLight'),
                                    ),
                                    Text(
                                      "HOTS",
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(246, 246, 246, 1),
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
            body: ListView.builder(
              padding: EdgeInsets.all(0),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 80,
                  color: Colors.primaries[index % Colors.primaries.length],
                  alignment: Alignment.center,
                  child: Text(
                    '$index',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                );
              },
              itemCount: 20,
            )),
      ),
    );
  }
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;

  StickyTabBarDelegate({@required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.black,
      child: this.child,
    );
  }

  @override
  double get maxExtent => this.child.preferredSize.height;

  @override
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
