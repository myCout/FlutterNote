import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_book/App/app_color.dart';
import 'package:flutter_book/config/config.dart';
import 'package:flutter_book/main.dart';
import 'AATest/Test_CounterModel.dart';
import 'public.dart';
import 'widget/widget_bottom_tabs.dart';
import 'package:flutter/cupertino.dart';

// import 'Page/page_home_index.dart';
// import 'package:flutter/rendering.dart';
import 'package:flutter/foundation.dart' as foundation;

// iOS 浅色主题
final ThemeData kIOSTheme = ThemeData(
  brightness: Brightness.light,
  //明暗模式为暗色
  accentColor: Colors.black,
  //(按钮）Widget 前景色为黑色
  primaryColor: AppColor.primary,
  dividerColor: Color(0xffeeeeee),
  scaffoldBackgroundColor: AppColor.paper,
  iconTheme: IconThemeData(color: Colors.yellow),
  // 设置 icon 主题色为黄色
  textTheme: TextTheme(body1: TextStyle(color: AppColor.color333)),
  hintColor: AppColor.line, //定义下划线颜色
);
// Android 深色主题
final ThemeData kAndroidTheme = ThemeData(
  brightness: Brightness.dark,
  //明暗模式为暗色
  accentColor: Colors.black,
  //(按钮）Widget 前景色为黑色
  primaryColor: Colors.white,
  dividerColor: Color(0xffeeeeee),
  scaffoldBackgroundColor: AppColor.paper,
  iconTheme: IconThemeData(color: Colors.yellow),
  // 设置 icon 主题色为黄色
  textTheme: TextTheme(body1: TextStyle(color: AppColor.darkGray)),
);

bool get isIOS => foundation.defaultTargetPlatform == TargetPlatform.iOS;

void main() {
  debugPaintBaselinesEnabled = false;
  AppConfig.env = Env.DEBUG;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: CounterModel(), //需要共享的数据资源
      child: MaterialApp(
        theme: isIOS ? kIOSTheme : kAndroidTheme,
        home: BottomNavigationWidget(),
      ),
    );
  }
}

//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//  final String title;
//
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: CupertinoNavigationBar(),
//      body: CupertinoTabScaffold(
//        tabBar: CupertinoTabBar(
//          activeColor: CupertinoColors.activeBlue,
//          backgroundColor: CupertinoColors.inactiveGray,
//          items: [
//            BottomNavigationBarItem(
//                icon: Icon(CupertinoIcons.home), title: Text("主页")),
//            BottomNavigationBarItem(
//                icon: Icon(CupertinoIcons.eye), title: Text("发现")),
//          ],
//        ),
//        tabBuilder: (BuildContext context, int index) {
//          return CupertinoTabView(builder: (BuildContext context) {
//            //点击tab的时候,根据index的值渲染对应的页面
//            if (index == 0) {
//              return TestPageOne();
//            } else {
//              return TestPageTwo();
//            }
//            //当tab有多个的时候,就可以使用switch
//          });
//        },
//      ),
//    );
//  }
//}
//
//class TestPageOne extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Center(
//        child: Text("页面一",
//            style: new TextStyle(
//              fontSize: 36.0,
//              color: CupertinoColors.activeBlue,
//              fontWeight: FontWeight.w800,
//            )));
//  }
//}
//
//class TestPageTwo extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Center(
//        child: new Text("页面二",
//            style: new TextStyle(
//              fontSize: 36.0,
//              color: Colors.pink,
//              fontWeight: FontWeight.w800,
//            )));
//  }
//}