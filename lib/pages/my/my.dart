import 'package:Vibez/pages/settings/settings.dart';
import 'package:flutter/material.dart';

class My extends StatefulWidget {
  @override
  _MyState createState() => _MyState();
}

class _MyState extends State<My> with SingleTickerProviderStateMixin {
  int currentIndex = 0;

  final whiteColor = Color.fromRGBO(246, 246, 246, 1);
  final grayColor = Colors.white60;

  PageController _pageController;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this)
      ..addListener(() {
        if (_tabController.indexIsChanging) {
          //判断tabBar是否切换
          onPageChange(_tabController.index, p: _pageController);
        }
      });
    _tabController.animateTo(0); //默认选项卡
    _pageController = new PageController(initialPage: 0, keepPage: true);
  }

  void onPageChange(int index, {PageController p, TabController t}) async {}

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final List<Tab> toptabs = <Tab>[
      Tab(
        child: SizedBox(
          width: width * 0.4,
          child: Image.asset(
            'lib/assets/images/feature-active.png',
            width: 20.0,
            height: 20.0,
          ),
        ),
      ),
      Tab(
        child: SizedBox(
          width: width * 0.4,
          child: Image.asset(
            'lib/assets/images/tagged.png',
            width: 20.0,
            height: 20.0,
          ),
        ),
      ),
    ];
    final List<Tab> toptabsTagged = <Tab>[
      Tab(
        child: SizedBox(
          width: width * 0.5,
          child: Image.asset(
            'lib/assets/images/feature.png',
            width: 20.0,
            height: 20.0,
          ),
        ),
      ),
      Tab(
        child: SizedBox(
          width: width * 0.5,
          child: Image.asset(
            'lib/assets/images/tagged-active.png',
            width: 20.0,
            height: 20.0,
          ),
        ),
      ),
    ];

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
                titleSpacing: 0,
                primary: false,
                automaticallyImplyLeading: false,
                expandedHeight: 330.0,
                backgroundColor: Colors.transparent,
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: EdgeInsets.all(0),
                  background: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 45,
                          ),
                          Text(
                            'My profile',
                            style: TextStyle(
                                color: whiteColor,
                                fontSize: 17.0,
                                fontFamily: 'Medium'),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Settings();
                              }));
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 10.0,
                                  left: 10.0,
                                  bottom: 10.0,
                                  right: 16.0),
                              child: Icon(Icons.settings,
                                  size: 25.0, color: whiteColor),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Joe',
                                  style: TextStyle(
                                      color: whiteColor, fontSize: 16.0),
                                ),
                                Row(
                                  children: [
                                    Text('@joeballer',
                                        style: TextStyle(
                                          color: grayColor,
                                        )),
                                    Image.asset(
                                      'lib/assets/images/user-selecte-dDM.png',
                                      width: 16.0,
                                      height: 16.0,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 95.0,
                                  height: 95.0,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 4.0,
                                        color: grayColor,
                                      )),
                                ),
                                Container(
                                  width: 82.0,
                                  height: 82.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'lib/assets/images/user-img.png',
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    width: 32.0,
                                    height: 32.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage(
                                            'lib/assets/images/usa.jpg',
                                          ),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Container(
                              width: 82.0,
                              height: 28.0,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  border:
                                      Border.all(color: grayColor, width: 2)),
                              child: Text.rich(
                                TextSpan(children: [
                                  TextSpan(
                                    text: '50M ',
                                    style: TextStyle(
                                        fontSize: 15.0, color: whiteColor),
                                  ),
                                  TextSpan(
                                      text: 'views',
                                      style: TextStyle(
                                          fontSize: 8.0, color: whiteColor))
                                ]),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 200.0,
                        alignment: Alignment.center,
                        // child: Text(
                        //   '17 year old tryna make a living. amosc: username243',
                        //   style: TextStyle(color: grayColor,),
                        //   textAlign:TextAlign.center,

                        // ),
                        child: Transform.translate(
                          offset: Offset(0, 10 * 1 / 2),
                          child: Text(
                            '17 year old tryna make a living. amosc: username243',
                            strutStyle: StrutStyle(
                                forceStrutHeight: true, height: .4, leading: 1),
                            style: TextStyle(fontSize: 10, color: grayColor),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Container(
                        width: 153.0,
                        margin: EdgeInsets.only(top: 20.0, bottom: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  '21',
                                  style: TextStyle(
                                      fontSize: 16, color: whiteColor),
                                ),
                                Text(
                                  'Videos',
                                  style:
                                      TextStyle(fontSize: 9, color: whiteColor),
                                )
                              ],
                            ),
                            Container(
                              width: 2.0,
                              height: 38.0,
                              color: grayColor,
                            ),
                            Column(
                              children: [
                                Text(
                                  '1M',
                                  style: TextStyle(
                                      fontSize: 16, color: whiteColor),
                                ),
                                Text(
                                  'Followers',
                                  style:
                                      TextStyle(fontSize: 9, color: whiteColor),
                                )
                              ],
                            ),
                            Container(
                              width: 2.0,
                              height: 38.0,
                              color: grayColor,
                            ),
                            Column(
                              children: [
                                Text(
                                  '101',
                                  style: TextStyle(
                                      fontSize: 16, color: whiteColor),
                                ),
                                Text(
                                  'Following',
                                  style:
                                      TextStyle(fontSize: 9, color: whiteColor),
                                )
                              ],
                            )
                          ],
                        ),
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
                              "Edot Profile",
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
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: StickyTabBarDelegate(
                  child: TabBar(
                    controller: _tabController,
                    indicatorColor: Colors.white,
                    tabs: [toptabs, toptabsTagged][currentIndex],
                    onTap: (index) {
                      print(index.toString() + 'home.dart');
                      print(currentIndex);
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: this._tabController,
            children: [
              GridView(
                padding: EdgeInsets.only(top: 10),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, //横轴三个子widget
                    crossAxisSpacing: 0, //横轴方向的间距。
                    mainAxisSpacing: 0, //竖轴方向的间距。
                    childAspectRatio: .7 //宽高比为1时，子widget
                    ),
                children: [
                  Image.asset(
                    'lib/assets/images/sp.png',
                    fit: BoxFit.fill,
                  ),
                  Image.asset(
                    'lib/assets/images/sp.png',
                    fit: BoxFit.fill,
                  ),
                  Image.asset(
                    'lib/assets/images/sp.png',
                    fit: BoxFit.fill,
                  ),
                  Image.asset(
                    'lib/assets/images/sp.png',
                    fit: BoxFit.fill,
                  ),
                  Image.asset(
                    'lib/assets/images/sp.png',
                    fit: BoxFit.fill,
                  ),
                  Image.asset(
                    'lib/assets/images/sp.png',
                    fit: BoxFit.fill,
                  ),
                ],
              ),
              GridView(
                padding: EdgeInsets.only(top: 10),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, //横轴三个子widget
                    crossAxisSpacing: 0, //横轴方向的间距。
                    mainAxisSpacing: 0, //竖轴方向的间距。
                    childAspectRatio: .7 //宽高比为1时，子widget
                    ),
                children: <Widget>[
                  Image.asset(
                    'lib/assets/images/sp.png',
                    fit: BoxFit.fill,
                  ),
                  Image.asset(
                    'lib/assets/images/sp.png',
                    fit: BoxFit.fill,
                  ),
                  Image.asset(
                    'lib/assets/images/sp.png',
                    fit: BoxFit.fill,
                  ),
                  Image.asset(
                    'lib/assets/images/sp.png',
                    fit: BoxFit.fill,
                  ),
                  Image.asset(
                    'lib/assets/images/sp.png',
                    fit: BoxFit.fill,
                  ),
                  Image.asset(
                    'lib/assets/images/sp.png',
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            ],
          ),
        ),
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
