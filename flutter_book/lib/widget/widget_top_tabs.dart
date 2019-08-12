import 'package:flutter/material.dart';
import 'package:flutter_book/App/app_color.dart';
import 'package:flutter_book/Page/bookcity/page_selected.dart';
import 'package:flutter_book/Page/bookcity/page_category.dart';

class TopTabController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          title: Container(
            padding: EdgeInsets.symmetric(horizontal: 105),//顶部导航栏与两侧的距离,horizontal表示水平方向
            child: TabBar(
              labelColor: AppColor.darkGray,
              labelStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
              unselectedLabelColor: AppColor.gray,
              indicatorColor: AppColor.secondary,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 3,
              indicatorPadding: EdgeInsets.fromLTRB(8, 0, 8, 5),
              tabs: <Widget>[
                Tab(text: '精选',),
                Tab(text: '分类',)
              ],
            ),
          ),
          backgroundColor: AppColor.white,
          elevation: 0,
        ),
        body: TabBarView(
          children: [
            SelectedList(),
            CategoryPage(),
          ],
        ),
      ),
    );
  }
}