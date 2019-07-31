import 'package:flutter/material.dart';
import 'widget/widget_bottom_tabs.dart';
import 'Page/page_home_index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: BottomTabs(),
      home: BottomNavigationWidget(),
      // home: TabBarDemo(),
    );
  }
}



