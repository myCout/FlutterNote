import 'package:flutter_web/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // 应用的根组件
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '腾讯新闻客户端下载页', //meta 里的titile
      debugShowCheckedModeBanner: false, // 关闭调试bar
      theme: ThemeData(
        primarySwatch: Colors.blue, // 页面主题 Material风格
      ),
      home: Home(), // 启动首页
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text( // 中心文本
          "下载页",
          style:
              TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.w500),
        ),
// 搜索图标及特性
        actions: <Widget>[ 
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          )
        ],
      ),
//调用body渲染类，此处可以添加多个方法调用
      body: Stack(
        children: [
            Body() 
        ],
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded( // 左侧
          flex: 1,
          child: Image.asset(// 图片组件
            "123.jpg", // 这是一张在web/asserts/下的背景图
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(width: 90.0),
        Expanded( // 右侧
          flex:1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text( // 文本组件
                "腾讯新闻",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w600, fontSize: 50.0, fontFamily: 'Merriweather'),
              ),
              const SizedBox(height: 14.0),// SizedBox用来增加间距
              Text(
                "腾讯新闻是腾讯公司为用户打造的一款全天候、全方位、及时报道的新闻产品，为用户提供高效优质的资讯、视频和直播服务。资讯超新超全，内容独家优质，话题评论互动。",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w400, fontSize: 24.0, fontFamily: "Microsoft Yahei"),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 20.0), 
              FlatButton(
                onPressed: () {}, // 下载按钮的响应事件
                color: Color(0xFFCFE8E4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text("点击下载", style: TextStyle(fontFamily: "Open Sans")),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 100.0),
      ],
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (choose the "Toggle Debug Paint" action
          // from the Flutter Inspector in Android Studio, or the "Toggle Debug
          // Paint" command in Visual Studio Code) to see the wireframe for each
          // widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hello, World!',
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
