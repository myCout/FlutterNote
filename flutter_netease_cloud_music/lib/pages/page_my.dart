import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {// with AutomaticKeepAliveClientMixin
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => null;
}
