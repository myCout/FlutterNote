import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_book/App/app_color.dart';
import 'package:flutter_book/Page/page_bookcity.dart';
import 'package:flutter_book/Page/page_bookshelf.dart';
import 'package:flutter_book/Page/page_profile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class BottomNavigationWidget extends StatefulWidget {
  @override
  // _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
  State<StatefulWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  final _bottomNavigationColor = Colors.blue;
  int currentIndex = 1;
  var currentPage;
  PageController _pageController;

  List<Widget> list = List();
  final List<Widget> tabBodies = [
    BookShelfPage(),
    BookCityPage(),
    ProfileScreen()
  ];

  List<Image> _tabImages = [
    Image.asset('imgs/tab_bookshelf_n.png'),
    Image.asset('imgs/tab_bookstore_n.png'),
    Image.asset('imgs/tab_me_n.png'),
  ];
  List<Image> _tabSelectedImages = [
    Image.asset('imgs/tab_bookshelf_p.png'),
    Image.asset('imgs/tab_bookstore_p.png'),
    Image.asset('imgs/tab_me_p.png'),
  ];

  @override
  void initState() {
     currentPage = tabBodies[currentIndex];
    _pageController = new PageController()..addListener((){
      if (currentPage != _pageController.page.round()) {
        setState(() {
          currentPage = _pageController.page.round();
        });
      }
    });
    super.initState();
  }

getTabIcon(int index) {
  if (index == currentIndex) {
    return _tabSelectedImages[index];
  } else {
    return _tabImages[index];
  }
}
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750,height: 1334)..init(context);
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: tabBodies,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Colors.white,
        activeColor: AppColor.primary,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: getTabIcon(0),title: Text('书架')),
          BottomNavigationBarItem(icon: getTabIcon(1),title: Text('书城')),
          BottomNavigationBarItem(icon: getTabIcon(2),title: Text('我都')),
        ],
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
            currentPage = tabBodies[index];
          });
        },
      ),
    );
  }
}