import 'package:flutter/material.dart';

class MyTabs extends StatefulWidget {
  MyTabs({Key key}) : super(key: key);

  @override
  _MyTabsState createState() => _MyTabsState();
}

class _MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin {
  int currentIndex = 0;

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

    return DefaultTabController(
      length: 2,
      child: Container(
        height: MediaQuery.of(context).size.height - 60,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: null,
            centerTitle: true,
            leading: null,
            titleSpacing: 0,
            bottomOpacity: 0,
            toolbarOpacity: 0,
            automaticallyImplyLeading: false,
            title: TabBar(
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 2.0, color: Colors.white),
              ),
              isScrollable: false,
              controller: _tabController,
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
          body: TabBarView(
            controller: _tabController,
            children: [
              GridView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
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
                      fit: BoxFit.fitWidth,
                    ),
                    Image.asset(
                      'lib/assets/images/sp.png',
                      fit: BoxFit.fitWidth,
                    ),
                    Image.asset(
                      'lib/assets/images/sp.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ]),
              Container(
                height: 20,
                color: Colors.red,
                child: Text(
                  'data',
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
