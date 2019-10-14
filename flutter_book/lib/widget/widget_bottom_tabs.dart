import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_book/App/app_color.dart';
import 'package:flutter_book/Page/page_bookcity.dart';
import 'package:flutter_book/Page/page_bookshelf.dart';
import 'package:flutter_book/Page/page_profile.dart';

import '../public.dart';

class BottomNavigationWidget extends StatefulWidget {
  @override
  // _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
  State<StatefulWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
//  final _bottomNavigationColor = Colors.blue;
  int currentIndex = 1;
  var currentPage;

  List<Widget> list = List();
  final List<Widget> tabBodies = [
    BookShelfPage(),
    BookCityPage(),
    ProfileScreen()
  ];

  List<Image> _tabImages = [
    Image.asset(Assets.assetsImgsTabBookshelfN),
    Image.asset(Assets.assetsImgsTabBookstoreN),
    Image.asset(Assets.assetsImgsTabMeN),
  ];
  List<Image> _tabSelectedImages = [
    Image.asset(Assets.assetsImgsTabBookshelfP),
    Image.asset(Assets.assetsImgsTabBookstoreP),
    Image.asset(Assets.assetsImgsTabMeP),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 667)..init(context);
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: tabBodies,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Colors.white,
        activeColor: AppColor.primary,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: getTabIcon(0), title: Text('书架')),
          BottomNavigationBarItem(icon: getTabIcon(1), title: Text('书城')),
          BottomNavigationBarItem(icon: getTabIcon(2), title: Text('我的')),
        ],
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }

  Image getTabIcon(int index) {
    if (index == currentIndex) {
      return _tabSelectedImages[index];
    } else {
      return _tabImages[index];
    }
  }
}
