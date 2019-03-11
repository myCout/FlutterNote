import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_shop/service/service_method.dart';
import 'package:flutter_shop/service/service_method.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'ad_banner.dart';
import 'leader_phone.dart';

// String advertesPicture = data['data']['advertesPicture']['PICTURE_ADDRESS']; //广告图片
//               AdBanner(advertesPicture:advertesPicture);   //广告组件  
// String  leaderImage= data['data']['shopInfo']['leaderImage'];  //店长图片
// String  leaderPhone = data['data']['shopInfo']['leaderPhone']; //店长电话 
// LeaderPhone(leaderImage:leaderImage,leaderPhone: leaderPhone)  //广告组件  
class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  String homePageContent='正在获取数据';
 @override
 void initState() {
    getHomePageContent().then((val){
      setState(() {
           homePageContent=val.toString();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // getHttp();
    return Scaffold(
      appBar: AppBar(title: Text('百姓生活')),
      body:FutureBuilder(//用来等待异步请求
          future: getHomePageContent(),
          builder: (context,snapshot){
            if (snapshot.hasData) {
              var data =json.decode(snapshot.data.toString());
              List<Map> swiperDataList = (data['data']['slides'] as List).cast();//轮播
              return Column(
                children: <Widget>[
                  SwiperDiy(swiperDataList:swiperDataList)
                ],
              );
            }else{
              return Center(
                child: Text('加载中'),
              );
            }
          },
      )
    );
  }
}

void getHttp() async {
  try {
    Response response;
    var data = {'name':'jishu'};
    response = await Dio().get(
      "https://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/dabaojian?name=大胸美女", 
    );
    return print(response);
  } catch (e) {
    return print(e);
  }
}

// 首页轮播组件编写
class SwiperDiy extends StatelessWidget {
  final List swiperDataList;
  SwiperDiy({Key key,this.swiperDataList}):super(key:key);
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =ScreenUtil(width: 750,height: 1334)..init(context);
    print('设备宽度:${ScreenUtil.screenWidth}');
     print('设备高度:${ScreenUtil.screenHeight}');
      print('设备像素密度:${ScreenUtil.pixelRatio}');
    return Container(
      height: ScreenUtil().setHeight(333),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
        itemBuilder: (BuildContext context,int index){
          return Image.network("${swiperDataList[index]['image']}",fit:BoxFit.fill);
        },
        itemCount: swiperDataList.length,
        pagination: new SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}