import 'package:flutter_book/public.dart';

import 'Test_CounterModel.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
//    final _counter = Provider.of<CounterModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      //使用Consumer来封装counter的读取
      body: Consumer<CounterModel>(
          //builder函数可以直接获取到counter参数
          builder: (context, CounterModel counter, _) {
        return Text('Value: ${counter.counter}');
      }),
      //使用Consumer来封装increment的读取
      floatingActionButton: Consumer<CounterModel>(
        //builder函数可以直接获取到increment参数
        builder: (context, CounterModel counter, child) => FloatingActionButton(
          onPressed: counter.increment,
          child: child,
        ),
        child: TestIcon(),
      ),
    );
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
