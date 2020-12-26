import 'package:Vibez/common/eventBus.dart';
import 'package:Vibez/components/home/following.dart';
import 'package:Vibez/pages/discover/discover.dart';
import 'package:Vibez/pages/inbox/inbox.dart';
import 'package:Vibez/pages/my/my.dart';
import 'package:Vibez/pages/upload/upload.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
              fontSize: 16.0, color: Color.fromRGBO(255, 255, 255, 1))),
    ),
    Tab(
      child: Text('Your Vibez',
          style: TextStyle(
              fontSize: 16.0, color: Color.fromRGBO(255, 255, 255, 1))),
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
        'icon': 'lib/assets/images/home-o.png',
        'actionIcon': 'lib/assets/images/home.png',
      },
      {
        'icon': 'lib/assets/images/discover-o.png',
        'actionIcon': 'lib/assets/images/discover.png',
      },
      {
        'icon': 'lib/assets/images/upload.png',
        'actionIcon': 'lib/assets/images/upload.png',
      },
      {
        'icon': 'lib/assets/images/inbox-o.png',
        'actionIcon': 'lib/assets/images/inbox.png',
      },
      {
        'icon': 'lib/assets/images/account-o.png',
        'actionIcon': 'lib/assets/images/account.png',
      }
    ];
    List<Widget> childs = [];
    for (var i = 0; i < tabList.length; i++) {
      childs.add(
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => {
            setState(() {
              currentIndex = i;
              if (i == 0) {
                _tabController.animateTo(0);
                eventBus.fire(new PlayVideo(null));
              } else {
                print("DDDDDDDDDDDDDDDDDDDDDDD");
                eventBus.fire(new PauseVideo(null));
              }
            }),
          },
          child: Container(
            width: MediaQuery.of(context).size.width / 100 * 20,
            padding: i == 2
                ? EdgeInsets.only(top: 2.0, right: 8.0, left: 8.0, bottom: 14.0)
                : EdgeInsets.all(20.0),
            child: Image.asset(
              currentIndex == i && i != 2
                  ? tabList[i]['actionIcon']
                  : tabList[i]['icon'],
            ),
          ),
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
          children: [
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
                      icon: Image.asset(
                        'lib/assets/images/vibez-logo.png',
                        width: 32.5,
                        height: 30.0,
                      ),
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
                      print(index.toString() + 'home.dart');
                    },
                  ),
                )
              ],
            ),
            [SizedBox(), Discover(), Upload(), Inbox(), My()][currentIndex],
            new Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 70.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: getTabList(), //自定义BottomNavigationBar
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DiyApp extends StatefulWidget {
  @override
  _DiyAppState createState() => _DiyAppState();
}

class _DiyAppState extends State<DiyApp> {
  @override
  Widget build(BuildContext context) {
    //创建widget 持有CounterNotifier 数据
    return ChangeNotifierProvider.value(
      value: CounterNotifier(),
      child: ProvidePage(),
    );
  }
}

class ProvidePage extends StatefulWidget {
  final String title;

  ProvidePage({Key key, this.title}) : super(key: key);

  @override
  _ProvidePageState createState() => _ProvidePageState();
}

class _ProvidePageState extends State<ProvidePage> {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterNotifier>(context);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("按钮"),
          Text("${counter.count}"),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              counter.increment();
            },
          ),
          IconButton(
            icon: Icon(Icons.subject),
            onPressed: () {
              counter.subtract();
            },
          ),
        ],
      ),
    );
  }
}

//核心：继承自ChangeNotifier
//这种文件本来应该单独放在一个类文件的
class CounterNotifier with ChangeNotifier {
  int _count = 0;
  int get count => _count;
  increment() {
    _count++;
    //核心方法，， 通知刷新UI,调用build方法
    notifyListeners();
  }

  subtract() {
    _count--;
    //核心方法，， 通知刷新UI,调用build方法
    notifyListeners();
  }
}
