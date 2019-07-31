import 'package:flutter/material.dart';
import 'package:flutter_book/Page/page_bookcity.dart';
import 'package:flutter_book/Page/page_bookshelf.dart';
import 'package:flutter_book/Page/page_profile.dart';


class BottomNavigationWidget extends StatefulWidget {
  @override
  // _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
  State<StatefulWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  final _bottomNavigationColor = Colors.blue;
  int currentIndex = 0;
  var currentPage;
  PageController _pageController;

  List<Widget> list = List();
  final List<Widget> tabBodies = [
    BookShelfPage(),
    BookCityPage(),
    ProfileScreen()
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: tabBodies,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: _bottomNavigationColor,
              ),
              title: Text(
                '书架',
                style: TextStyle(color: _bottomNavigationColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.email,
                color: _bottomNavigationColor,
              ),
              title: Text(
                '书城',
                style: TextStyle(color: _bottomNavigationColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.pages,
                color: _bottomNavigationColor,
              ),
              title: Text(
                '我的',
                style: TextStyle(color: _bottomNavigationColor),
              ))
        ],
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
            currentPage = tabBodies[index];
          });
        },
        type: BottomNavigationBarType.shifting,
      ),
    );
  }
}