import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_minizb/untils/app_api.dart';
import 'view_banner.dart';

class HomeHotLive extends StatefulWidget {
  @override
  _HomeHotLiveState createState() => _HomeHotLiveState();
}

class _HomeHotLiveState extends State<HomeHotLive> {
  List _bannerArray;

  @override
  Widget build(BuildContext context) {
    // return layout(context);
    return homeView(context);
  }

  @override
  void initState() {
    super.initState();
    _getHomeBannerData();
  }

  Future _getHomeBannerData() async {
    // await APPApi.postLoginTmp()
    var bannerData = await APPApi.getHomeBanner();
    var data = json.decode(bannerData.toString());
    List<Map> swiperDataList = (data['d']['carousel'] as List).cast();//轮播
    // print(swiperDataList);
    setState(() {
      _bannerArray = swiperDataList ;
    });
  }

  Widget homeView(BuildContext context) {
    // return Container(
    //   child: SwiperDiy(swiperDataList:_bannerArray ),
    // );
     return EasyRefresh(
                child: ListView(
                  children: <Widget>[
                    SwiperDiy(swiperDataList:_bannerArray ),   //页面顶部轮播组件
                  ],
                ),
                loadMore: ()async{
                  print('加载更多');
                },
              );
  }

  Widget layout(BuildContext context) {
    return new Scaffold(
      appBar: buildAppBar(context),
      body:
          new ListView.builder(itemCount: _bannerArray.length, itemBuilder: itemView),
    );
  }

  Widget buildAppBar(BuildContext context) {
    return new AppBar(title: const Text('历史今日'));
  }

  Widget itemView(BuildContext context, int index) {
      // Model model = this._items[index];
      //设置分割线
      if (index.isOdd) return new Divider(height: 1.0);
      return Container(
        child: SwiperDiy(swiperDataList:_bannerArray)
      );
    }

  // @override
  // Widget build(BuildContext context) {
  //   // var data =json.decode(snapshot.data.toString());
  //   List<Map> swiperDataList = _bannerArray;// = (data['data']['slides'] as List).cast();//轮播
  //   return Container(
  //     child: ListView(
  //       children: <Widget>[
  //         // SwiperDiy(swiperDataList:swiperDataList ),
  //         Image.network(  //网络图片
  //           'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1546851657199&di=fdd278c2029f7826790191d59279dbbe&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F0112cb554438090000019ae93094f1.jpg%401280w_1l_2o_100sh.jpg',
  //           scale: 2.0,  //进行缩放
  //           fit:BoxFit.cover  // 充满父容器
  //         ),
  //       ],
  //     ),
  //   );
  // }
}