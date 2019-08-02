import 'package:flutter/material.dart';
import 'package:flutter_book/Page/bookcity/page_selected.dart';
import 'package:flutter_book/Page/bookcity/page_category.dart';

class TopTabController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
            ],
          ),
          // title: Text('Tabs Demo'),
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