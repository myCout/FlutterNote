import 'dart:async';

import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_book/AATest/Test_CountContainer.dart';
import 'package:flutter_book/AATest/Test_CounterModel.dart';
import 'package:flutter_book/AATest/Test_CustomEvent.dart';
import 'package:flutter_book/AATest/Test_CustomNotification.dart';

import '../../public.dart';

EventBus eventBus = EventBus();

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  String _msg = "通知";
  StreamSubscription subscription;

  @override
  void initState() {
    // TODO:监听CustomEvent事件，刷新UI
    subscription = eventBus.on<CustomEvent>().listen((event) {
      setState(() {
        _msg += event.msg;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: CounterModel(), //需要共享的数据资源
      child: buildBody(),
    );
  }

  Widget buildBody() {
    //取出资源
    final _counter = Provider.of<CounterModel>(context);

    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Text('1 Counter: ${_counter.counter}'),
          SizedBox(
            height: 40,
          ),
          SpinKitRotatingCircle(
            color: Colors.redAccent,
            size: 50.0,
          ),
          SizedBox(
            height: 40,
          ),

          FloatingActionButton(
            onPressed: () {
//              AppNavigator.pushTestPage(context)

              Navigator.of(context)
                  .pushNamed('second_page', arguments: "hello")
                  .then((msg) {
                setState(() {
                  print('CallBackValue = $msg');
                });
              });
            },
            child: Icon(Icons.pages),
          ),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('animation_page');
            },
            child: Text('动画'),
          ),
          SizedBox(
            height: 20,
          ),
          FlatButton(onPressed: () {}, child: Text('扁平化按钮，背景默认透明，点击后会有灰色背景'))
        ],
      ),
    );
  }

  Widget buildCounter() {
    return Container(
      child: CountContainer(count: 0, child: Counter()),
    );
  }

  Widget buildListView() {
    return Container(
      child: ListView(
        children: <Widget>[
          Text('Row One'),
          Text('Row Two'),
          Text('Row Three'),
          Text('Row Four'),
        ],
      ),
    );
  }

  Widget buildNotificationWidget() {
    return NotificationListener<CustomNotification>(
      onNotification: (notification) {
        setState(() {
          _msg += notification.msg + "  ";
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Text(_msg), CustomChild()],
      ),
    );
  }

  Widget buildEventBus() {
    return Container(
      child: Text(_msg),
    );
  }
}

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //获取InheritedWidget节点
    CountContainer state = CountContainer.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('InheritedWidget Demo'),
      ),
      body: Text('You have pushed the button this many times: ${state.count}'),
    );
    return null;
  }
}
