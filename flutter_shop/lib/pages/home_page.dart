import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_shop/service/service_method.dart';
import 'package:flutter_shop/service/service_method.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'ad_banner.dart';
import 'leader_phone.dart';
import 'top_navigator.dart';
import 'recommend.dart';
import 'floor_content.dart';
import 'floor_title.dart';
// import 'hot_goods.dart';

// String advertesPicture = data['data']['advertesPicture']['PICTURE_ADDRESS']; //广告图片
//               AdBanner(advertesPicture:advertesPicture);   //广告组件  
// String  leaderImage= data['data']['shopInfo']['leaderImage'];  //店长图片
// String  leaderPhone = data['data']['shopInfo']['leaderPhone']; //店长电话 
// LeaderPhone(leaderImage:leaderImage,leaderPhone: leaderPhone)  //广告组件  
class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin{

  int page = 1;
  List<Map> hotGoodsList=[];

  @override
  bool get wantKeepAlive =>true;
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
              List<Map> navigatorList = (data['data']['category'] as List).cast(); //类别列表
              if(navigatorList.length>10){
                  navigatorList.removeRange(10, navigatorList.length);
                }
              String advertesPicture = data['data']['advertesPicture']['PICTURE_ADDRESS']; //广告图片
              String  leaderImage= data['data']['shopInfo']['leaderImage'];  //店长图片
              String  leaderPhone = data['data']['shopInfo']['leaderPhone']; //店长电话 
              List<Map> recommendList = (data['data']['recommend'] as List).cast(); // 商品推荐

              String floor1Title =data['data']['floor1Pic']['PICTURE_ADDRESS'];//楼层1的标题图片
              String floor2Title =data['data']['floor2Pic']['PICTURE_ADDRESS'];//楼层1的标题图片
              String floor3Title =data['data']['floor3Pic']['PICTURE_ADDRESS'];//楼层1的标题图片
              List<Map> floor1 = (data['data']['floor1'] as List).cast(); //楼层1商品和图片 
              List<Map> floor2 = (data['data']['floor2'] as List).cast(); //楼层1商品和图片 
              List<Map> floor3 = (data['data']['floor3'] as List).cast(); //楼层1商品和图片 

              return EasyRefresh(
                child: ListView(
                  children: <Widget>[
                          SwiperDiy(swiperDataList:swiperDataList ),   //页面顶部轮播组件
                          TopNavigator(navigatorList:navigatorList),   //导航组件
                          AdBanner(advertesPicture:advertesPicture), 
                          LeaderPhone(leaderImage:leaderImage,leaderPhone: leaderPhone),  //广告组件  
                          Recommend(recommendList:recommendList), 
                          
                          FloorTitle(picture_address:floor1Title),
                          FloorContent(floorGoodsList:floor1),
                          FloorTitle(picture_address:floor2Title),
                          FloorContent(floorGoodsList:floor2),
                          FloorTitle(picture_address:floor3Title),
                          FloorContent(floorGoodsList:floor3),  
                  ],
                ),
                loadMore: ()async{
                  print('加载更多');
                  var formPage = {'page':page};
                  await request('homePageBelowConten',formData: formPage).then((val){
                      var data =json.decode(val.toString());
                      List<Map> newGoodsList = (data['data'] as List).cast();
                      setState(() {
                        hotGoodsList.addAll(newGoodsList);
                      });
                  });
                },
              );
              // return SingleChildScrollView(
              //     child: Column(
              //         children: <Widget>[
              //             SwiperDiy(swiperDataList:swiperDataList ),   //页面顶部轮播组件
              //             TopNavigator(navigatorList:navigatorList),   //导航组件
              //             AdBanner(advertesPicture:advertesPicture), 
              //             LeaderPhone(leaderImage:leaderImage,leaderPhone: leaderPhone),  //广告组件  
              //             Recommend(recommendList:recommendList), 
                          
              //             FloorTitle(picture_address:floor1Title),
              //             FloorContent(floorGoodsList:floor1),
              //             FloorTitle(picture_address:floor2Title),
              //             FloorContent(floorGoodsList:floor2),
              //             FloorTitle(picture_address:floor3Title),
              //             FloorContent(floorGoodsList:floor3),  
              //             HotGoods()
              //           ],
              //       ) ,
              //   );
              
              // return Column(
              //   children: <Widget>[
              //     SwiperDiy(swiperDataList:swiperDataList),
              //     TopNavigator(navigatorList:navigatorList),   //导航组件
              //     AdBanner(advertesPicture:advertesPicture),   //广告组件  
              //     LeaderPhone(leaderImage:leaderImage,leaderPhone: leaderPhone)  //广告组件  
              //   ],
              // );
            }else{
              return Center(
                child: Text('加载中'),
              );
            }
          },
      )
    );
  }
 
 void _getHotGoods(){
    var formPage={'page':page};
    request('homePageBelowConten',formData: formPage).then((val){
        var data = json.decode(val.toString());
        List<Map> newGoodsList = (data['data'] as List).cast();
        setState(() {
          hotGoodsList.addAll(newGoodsList);
          page++;
        });
    });
  }

  Widget hotTitle =Container(
    margin: EdgeInsets.only(top: 10.0),
        padding:EdgeInsets.all(5.0),
        alignment:Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          border:Border(
            bottom: BorderSide(width:0.5 ,color:Colors.black12)
          )
        ),
        child: Text('火爆专区'),
  );

  //火爆专区子项
  Widget _wrapList(){
    if(hotGoodsList.length!=0){
       List<Widget> listWidget = hotGoodsList.map((val){
          return InkWell(
            onTap:(){print('点击了火爆商品');},
            child: 
            Container(
              width: ScreenUtil().setWidth(372),
              color:Colors.white,
              padding: EdgeInsets.all(5.0),
              margin:EdgeInsets.only(bottom:3.0),
              child: Column(
                children: <Widget>[
                  Image.network(val['image'],width: ScreenUtil().setWidth(375),),
                  Text(
                    val['name'],
                    maxLines: 1,
                    overflow:TextOverflow.ellipsis ,
                    style: TextStyle(color:Colors.pink,fontSize: ScreenUtil().setSp(26)),
                  ),
                  Row(
                    children: <Widget>[
                      Text('￥${val['mallPrice']}'),
                      Text(
                        '￥${val['price']}',
                        style: TextStyle(color:Colors.black26,decoration: TextDecoration.lineThrough),
                      )
                    ],
                  )
                ],
              ), 
            )
          );
      }).toList();
      return Wrap(
        spacing: 2,
        children: listWidget,
      );
    }else{
      return Text(' ');
    }
  }

  //火爆专区组合
  Widget _hotGoods(){
    return Container(
          child:Column(
            children: <Widget>[
              hotTitle,
               _wrapList(),
            ],
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

