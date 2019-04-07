import 'package:flutter/material.dart';
import 'view_banner.dart';

class HomeHotLive extends StatefulWidget {
  @override
  _HomeHotLiveState createState() => _HomeHotLiveState();
}

class _HomeHotLiveState extends State<HomeHotLive> {
  @override
  Widget build(BuildContext context) {
    // var data =json.decode(snapshot.data.toString());
    List<Map> swiperDataList;// = (data['data']['slides'] as List).cast();//轮播
    return Container(
      child: ListView(
        children: <Widget>[
          Card(color: Colors.red,),
          Card(color: Colors.green,),
          Card(color: Colors.black12,),
          // SwiperDiy(swiperDataList:swiperDataList ),   //页面顶部轮播组件
        ],
      ),
    );
  }
}