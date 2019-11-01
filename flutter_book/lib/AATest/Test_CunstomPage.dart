import 'package:flutter_book/public.dart';

import 'Test_CounterModel.dart';

class TestPage extends BaseWidget {
  @override
//  _TestPageState createState() => _TestPageState();

  BaseWidgetState<BaseWidget> getState() {
    return _TestPageState();
  }
}

class _TestPageState extends BaseWidgetState<TestPage> {
  String msg;

  @override
  Widget buildWidget(BuildContext context) {
    // TODO: implement buildWidget
    return null;
  }

  @override
  void onCreate() {
    // TODO: implement onCreate
    log('onCreate');
  }

  @override
  void onPause() {
    // TODO: implement onPause
    log('onPause');
  }

  @override
  void onResume() {
    // TODO: implement onResume
    log('onResume');
  }

  @override
  Widget build(BuildContext context) {
//    final _counter = Provider.of<CounterModel>(context);
    msg = ModalRoute
        .of(context)
        .settings
        .arguments as String;
    print('msg = ${msg}');
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      //使用Consumer来封装counter的读取
//      body: buildConsumerDemo(),
      body: buildCallbackDemo(),
    );
  }

  Widget buildCallbackDemo() {
    return Container(
      child: Column(
        children: <Widget>[
          Text('Message from first screen: $msg'),
          RaisedButton(
              child: Text('back'),
              onPressed: () =>
              {
                Navigator.pop(context, "hello callBackValue")
                //多层回退，退到指定界面
//              Navigator.popUntil(context,ModalRoute.withName('B'));
              })
        ],
      ),
    );
  }

  Widget buildConsumerDemo() {
    return Container(
        child: Column(
          children: <Widget>[
            Consumer<CounterModel>(
              //builder函数可以直接获取到counter参数
                builder: (context, CounterModel counter, _) {
                  return Text('Value: ${counter.counter}');
                }),
            //使用Consumer来封装increment的读取
            Consumer<CounterModel>(
              //builder函数可以直接获取到increment参数
              builder: (context, CounterModel counter, child) =>
                  FloatingActionButton(
                    onPressed: counter.increment,
                    child: child,
                  ),
              child: TestIcon(),
            ),
          ],
        ));
  }


}

//用于打印build方法执行情况的自定义控件
class TestIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("TestIcon build");
    return Icon(Icons.add); //返回Icon实例
  }
}
