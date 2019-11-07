import 'package:flutter/material.dart';
import 'package:flutter_netease_cloud_music/App/app_color.dart';
import 'package:flutter_netease_cloud_music/pages/page_discover.dart';
import 'package:flutter_netease_cloud_music/pages/page_my.dart';
import 'package:flutter_netease_cloud_music/widgets/widget_vempty_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return buildScaffold();
  }

  Widget buildScaffold() {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: AppColor.white,
      body: buildBody(),
//      body: buildSafeAreaTest(),
    );
  }

  Widget buildAppBar() {
    return PreferredSize(
        child: AppBar(
          elevation: 0,
        ),
        preferredSize: Size.zero);
  }

  Widget buildBody() {
    return SafeArea(
        bottom: false,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(150)),
                  child: TabBar(
                    labelStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    unselectedLabelStyle: TextStyle(fontSize: 15),
//                    unselectedLabelColor: AppColor.blue,
                    indicator: UnderlineTabIndicator(),
                    //选中项下划线风格
                    indicatorColor: AppColor.white,
                    //选中项下划线颜色，如果上面只是初始化，没有其他赋值，则默认0 不显示
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 3,
                    indicatorPadding: EdgeInsets.fromLTRB(8, 0, 8, 5),
                    controller: _tabController,
                    tabs: [
                      Tab(
                        text: '发现',
                      ),
                      Tab(
                        text: '我的',
                      ),
                      Tab(
                        text: '动态',
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: ScreenUtil().setWidth(20),
                  child: IconButton(
                    icon: Icon(
                      Icons.search,
                      size: ScreenUtil().setWidth(50),
                      color: Colors.black87,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            VEmptyView(20),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  DiscoverPage(),
                  MyPage(),
                  DiscoverPage(),
                ],
              ),
            ),
          ],
        ));
  }

  Widget buildSafeAreaTest() {
    return SafeArea(
        child: Container(
      color: Colors.blue,
    ));
  }
}
