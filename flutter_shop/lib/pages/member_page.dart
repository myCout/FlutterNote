import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_shop/config/httpHeaders.dart';

class MemberPage extends StatefulWidget {
  final Widget child;

  MemberPage({Key key, this.child}) : super(key: key);

  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  String showText = '还没有请求数据';
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
         appBar: AppBar(title: Text('请求数据')),
         body: SingleChildScrollView(
           child: Column(
             children: <Widget>[
               RaisedButton(
                 onPressed: _jike,
                 child: Text('请求数据'),
               )
             ],
           ),
         ),
       ),
    );
  }

  void _jike() {
        print('开始向极客时间请求数据..................');
        getHttp().then((val){
          setState(() {
            showText = val['date'].toString();
          });
        });

  }

  Future getHttp() async {
    try {
      Response response;
      Dio dio = new Dio();
      dio.options.headers= httpHeaders;
      response =await dio.get('https://time.geekbang.org/serv/v1/column/topList');
      print("hhhhh:$response");
      return response.data;
    } catch (e) {
      return print(e);
    }
  }

}
