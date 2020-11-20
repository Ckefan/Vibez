import 'package:Vibez/components/home/following.dart';
import 'package:Vibez/pages/discover/discover.dart';
import 'package:Vibez/pages/inbox/inbox.dart';
import 'package:Vibez/pages/my/my.dart';
import 'package:Vibez/pages/upload/upload.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  Widget popup;
  int currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final bool useRootNavigator = true;
  PageController _pageController;
  TabController _tabController;

  final List<Tab> toptabs = <Tab>[
    Tab(
      child: Text('Following',
          style: TextStyle(
              fontSize: 16.0,
              fontFamily: 'Regular',
              color: Color.fromRGBO(255, 255, 255, 1))),
    ),
    Tab(
      child: Text('Your Vibez',
          style: TextStyle(
              fontSize: 16.0,
              fontFamily: 'Regular',
              color: Color.fromRGBO(255, 255, 255, 1))),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: toptabs.length, vsync: this)
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

  List<Widget> getTabList() {
    final List tabList = [
      {
        'icon': 'lib/assets/images/home.png',
        'actionIcon': 'lib/assets/images/home-o.png',
      },
      {
        'icon': 'lib/assets/images/discover.png',
        'actionIcon': 'lib/assets/images/discover-o.png',
      },
      {
        'icon': 'lib/assets/images/upload.png',
        'actionIcon': 'lib/assets/images/upload.png',
      },
      {
        'icon': 'lib/assets/images/inbox.png',
        'actionIcon': 'lib/assets/images/inbox-o.png',
      },
      {
        'icon': 'lib/assets/images/account.png',
        'actionIcon': 'lib/assets/images/account-o.png',
      }
    ];
    List<Widget> childs = [];
    for (var i = 0; i < tabList.length; i++) {
      childs.add(
        GestureDetector(
          onTap: () => {
            setState(() {
              currentIndex = i;
              switch (i) {
                case 0: //home page
                  _tabController.animateTo(0); //默认推荐选项卡
                  break;
                case 1: // shearch page
                  popup = Discover();
                  break;
                case 2: //upload page
                  popup = Upload();
                  break;
                case 3: //message page
                  popup = Inbox();
                  break;
                case 4: // my page
                  popup = My();
                  break;
              }
            })
          },
          child: i == 2
              ? Padding(
                  padding: EdgeInsets.only(bottom: 15.0),
                  child: Image.asset(
                    tabList[i]['icon'],
                    width: MediaQuery.of(context).size.width / 100 * 12,
                  ),
                )
              : Image.asset(
                  currentIndex == i
                      ? tabList[i]['actionIcon']
                      : tabList[i]['icon'],
                  width: MediaQuery.of(context).size.width / 100 * 8),
        ),
      );
    }
    return childs;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: _scaffoldKey,
        body: Stack(
          children: <Widget>[
            TabBarView(
              controller: _tabController,
              children: <Widget>[
                PageView(
                  allowImplicitScrolling: true,
                  controller: _pageController,
                  children: <Widget>[
                    Following(),
                  ],
                  onPageChanged: (int index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.red,
                  child: Text(
                    'data',
                    style: TextStyle(fontSize: 50, color: Colors.white),
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  centerTitle: true,
                  leading: IconButton(
                      //导航栏最左侧Widget，常见为抽屉菜单按钮或返回按钮。
                      icon: Icon(Icons.ac_unit),
                      onPressed: () {
                        print('点击了直播按钮');
                      }),
                  // actions: <Widget>[
                  //   //导航栏最右侧
                  //   //导航栏右侧菜单
                  //   IconButton(
                  //       icon: Icon(Icons.search),
                  //       onPressed: () {
                  //         print('点击了搜索按钮');
                  //       }),
                  // ],
                  title: TabBar(
                    indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(width: 2.0, color: Colors.white),
                        insets: EdgeInsets.symmetric(horizontal: 18.0)),
                    labelStyle: TextStyle(fontSize: 18),
                    isScrollable: true,
                    controller: _tabController,
                    tabs: toptabs,
                    onTap: (index) {
                      print(index);
                    },
                  ),
                )
              ],
            ),
            new Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 80.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: getTabList(), //自定义BottomNavigationBar
                ),
              ),
            )
          ],
        ),
        // bottomNavigationBar: Theme(
        //     data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
        //     child: bottomItems(_scaffoldKey, context)),
        // drawer: Container(),
      ),
    );
  }

  // BottomNavigationBar bottomItems(
  //     GlobalKey<ScaffoldState> _scaffoldKey, BuildContext context) {
  //   return BottomNavigationBar(
  //       onTap: (int index) {
  //         setState(() {
  //           currentIndex = index;
  //           switch (index) {
  //             case 0: //home page
  //               _tabController.animateTo(0); //默认推荐选项卡
  //               break;
  //             case 1: // shearch page
  //               popup = Discover();
  //               break;
  //             case 2: //upload page
  //               popup = Upload();
  //               break;
  //             case 3: //message page
  //               popup = Inbox();
  //               break;
  //             case 4: // my page
  //               popup = My();
  //               break;
  //           }
  //         });
  //         if (popup != null) {
  //           if (useRootNavigator) {
  //             showModalBottomSheet(
  //                 useRootNavigator: useRootNavigator,
  //                 context: context,
  //                 isScrollControlled: true,
  //                 builder: (BuildContext bc) {
  //                   return Padding(
  //                     padding: EdgeInsets.only(
  //                         top: MediaQuery.of(context).padding.top),
  //                     child: popup,
  //                   );
  //                 });
  //           } else {
  //             showModalBottomSheet(
  //                 useRootNavigator: useRootNavigator,
  //                 context: context,
  //                 builder: (BuildContext bc) {
  //                   return Padding(
  //                     padding: EdgeInsets.only(
  //                         top: MediaQuery.of(context).padding.top),
  //                     child: popup,
  //                   );
  //                 });
  //           }
  //         }
  //       },
  //       elevation: 0,
  //       currentIndex: currentIndex,
  //       type: BottomNavigationBarType.fixed,
  //       items: [
  //         BottomNavigationBarItem(
  //           icon: Image.asset('lib/assets/images/home-o.png'),
  //           activeIcon: Image.asset('lib/assets/images/home.png'),
  //           title: SizedBox.shrink(),
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Image.asset('lib/assets/images/discover-o.png'),
  //           activeIcon: Image.asset('lib/assets/images/discover.png'),
  //           title: SizedBox.shrink(),
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Image.asset('lib/assets/images/upload.png'),
  //           activeIcon: Image.asset('lib/assets/images/upload.png'),
  //           title: SizedBox.shrink(),
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Image.asset('lib/assets/images/inbox-o.png'),
  //           activeIcon: Image.asset('lib/assets/images/inbox.png'),
  //           title: SizedBox.shrink(),
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Image.asset('lib/assets/images/account-o.png'),
  //           activeIcon: Image.asset('lib/assets/images/account.png'),
  //           title: SizedBox.shrink(),
  //         ),
  //       ]);
  // }
}
