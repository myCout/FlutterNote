import 'package:flutter/material.dart';

class WarpDemo extends StatefulWidget {
  final Widget child;

  WarpDemo({Key key, this.child}) : super(key: key);

  _WarpDemoState createState() => _WarpDemoState();
}

class _WarpDemoState extends State<WarpDemo> {
  List<Widget> list;//数组
  @override
  void initState() {
    super.initState();
    list = List<Widget>()..add(buildAddButton());
  }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height =MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Warp流式布局'),
      ),
      body: Center(
        child: Opacity(
          opacity: 0.8,
          child: Container(
            width: width,
            height: height,
            color: Colors.blueGrey,
            child: Wrap(
              children: list,
              spacing: 20,//设置间距
            ),
          ),
        ),
      ),
      );
    }
  

  Widget buildAddButton(){
  //返回一个手势Widget，只用于显示事件
    return GestureDetector(
      onTap: (){
        if (list.length < 9) {
          setState(() {
            list.insert(list.length-1, buildPhoto());
          });
          
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          width: 80,
          height: 80,
          color: Colors.black54,
          child: Icon(Icons.add),
        ),
      ),
    );
}

  Widget buildPhoto() {
     return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 80.0,
          height: 80.0,
          color: Colors.amber,
          child: Center(
            child: Text('照片'),
          ),
        ),
    );
  }
}



