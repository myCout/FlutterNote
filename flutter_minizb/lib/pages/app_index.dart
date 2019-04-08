import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'page_home.dart';
import 'page_follow.dart';
import 'page_messge.dart';
import 'page_me.dart';

class PageIndex extends StatefulWidget {
  @override
  _PageIndexState createState() => _PageIndexState();
}

class _PageIndexState extends State<PageIndex> {
  
   PageController _pageController;
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon:Icon(CupertinoIcons.home),
      title:Text('首页')
    ),
    BottomNavigationBarItem(
      icon:Icon(CupertinoIcons.info),
      title:Text('关注')
    ),
    BottomNavigationBarItem(
      icon:Icon(CupertinoIcons.shopping_cart),
      title:Text('消息')
    ),
     BottomNavigationBarItem(
      icon:Icon(CupertinoIcons.profile_circled),
      title:Text('个人中心')
    ),
  ];
  final List<Widget> tabBodies = [
    HomePage(),
    FollowPage(),
    MessagePage(),
    MePage()
  ];
  int currentIndex= 0;
  var currentPage ;
  @override
  void initState() {
   currentPage=tabBodies[currentIndex];
   _pageController=new PageController()
      ..addListener(() {
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
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        type:BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items:bottomTabs,
        onTap: (index){
          setState(() {
           currentIndex=index;
            currentPage =tabBodies[currentIndex]; 
          });
        },
      ),
      body: IndexedStack(
        index: currentIndex,
        children: tabBodies
      )
    );
  }
}
