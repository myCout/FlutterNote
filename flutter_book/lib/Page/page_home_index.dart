import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'page_bookcity.dart';
import 'page_profile.dart';
import 'page_bookshelf.dart';
class PageIndex extends StatefulWidget {
  @override
  _PageIndexState createState() => _PageIndexState();
}

class _PageIndexState extends State<PageIndex> {
    PageController _pageController;

    final List<BottomNavigationBarItem> bottomTabs = [
      BottomNavigationBarItem(title: Text('书架'),icon: Icon(CupertinoIcons.book)),
      BottomNavigationBarItem(title: Text('书城'),icon: Icon(CupertinoIcons.book_solid)),
      BottomNavigationBarItem(title: Text('我的'),icon: Icon(CupertinoIcons.info)),
    ];

    final List<Widget> tabBodies = [
      BookShelfPage(),
        BookCityPage(),
        ProfileScreen(),
        
    ];

int currentIndex = 0;
var currentPage;

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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottomTabs,
        onTap: (index){
          setState(() {
            currentIndex = index;
            currentPage = tabBodies[index];
          });
        },
      ),
      body: IndexedStack(
        index: currentIndex,
        children: tabBodies,
      ),
    );
  }
}