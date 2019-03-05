import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_shop/service/service_method.dart';

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
    getHttp();
    return Scaffold(
      appBar: AppBar(title: Text('百姓生活')),
      body:SingleChildScrollView(
        child: Text(homePageContent),
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
