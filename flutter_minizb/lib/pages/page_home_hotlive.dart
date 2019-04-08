import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_minizb/untils/app_api.dart';
import 'view_banner.dart';

class HomeHotLive extends StatefulWidget {
  @override
  _HomeHotLiveState createState() => _HomeHotLiveState();
}

class _HomeHotLiveState extends State<HomeHotLive> {
  List _bannerArray;

  @override
  void initState() {
    super.initState();
    _getHomeBannerData();
  }

  void _getHomeBannerData() async {
    // await APPApi.postLoginTmp()
    var bannerData = await APPApi.getHomeBanner();
    var data =json.decode(bannerData.toString());

    // print('banner + $bannerData');
    setState(() {
      _bannerArray = (data['d']['carousel'] as List).cast();
    });
  }
  @override
  Widget build(BuildContext context) {
    // var data =json.decode(snapshot.data.toString());
    List<Map> swiperDataList = _bannerArray;// = (data['data']['slides'] as List).cast();//轮播
    return Container(
      child: ListView.builder(
      //   children: <Widget>[
      //   SwiperDiy(swiperDataList:swiperDataList ),   //页面顶部轮播组件
      //     Image.network(  //网络图片
      //   'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1546851657199&di=fdd278c2029f7826790191d59279dbbe&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F0112cb554438090000019ae93094f1.jpg%401280w_1l_2o_100sh.jpg',
      //   scale: 2.0,  //进行缩放
      //   fit:BoxFit.cover  // 充满父容器
      // ),
      //     Image.network(  //网络图片
      //   'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1546851657199&di=fdd278c2029f7826790191d59279dbbe&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F0112cb554438090000019ae93094f1.jpg%401280w_1l_2o_100sh.jpg',
      //   scale: 2.0,  //进行缩放
      //   fit:BoxFit.cover  // 充满父容器
      // ),
      //     Image.network(  //网络图片
      //   'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1546851657199&di=fdd278c2029f7826790191d59279dbbe&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F0112cb554438090000019ae93094f1.jpg%401280w_1l_2o_100sh.jpg',
      //   scale: 2.0,  //进行缩放
      //   fit:BoxFit.cover  // 充满父容器
      // ),
      //     // SwiperDiy(swiperDataList:swiperDataList ),   //页面顶部轮播组件
      //   ], 
        itemBuilder: (BuildContext context, int index) {
            SwiperDiy(swiperDataList:swiperDataList );
        },
      ),
    );
  }
}