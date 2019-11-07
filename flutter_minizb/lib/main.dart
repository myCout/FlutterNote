import 'package:flutter/material.dart';
import 'package:flutter_minizb/untils/net_utils.dart';
import 'model/user.dart';
import 'untils/app_api.dart';
import 'untils/app_manager.dart';
import 'pages/app_index.dart';

void main() {
  NetUtils.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  
  Future _incrementCounter() async {

    User user = await NetUtils.login(context, '17709218294', 'hy198611');
    if (user.code > 299) {
      print('失败');
      return;
    }
    print('登录成功');

    setState(() {
//      // _counter++;
//      AppManager.initApp(context).then((_) {
//      // Future.delayed(const Duration(seconds: 2), () {
//      //   Navigator.pushReplacementNamed(context, HomePage.ROUTER_NAME);
//      // });
//        loginTemp();
//      });

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('首页'),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  Future loginTemp() async {
    var todayJson;
      todayJson = await APPApi.postLoginTmp();
      // todayJson = await APPApi.getLiveHot();
      print('json = %$todayJson');
  }

}
