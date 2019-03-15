import 'package:flutter/material.dart';
import '../service/service_method.dart';

class HotGoods extends StatefulWidget {
  final Widget child;

  HotGoods({Key key, this.child}) : super(key: key);

  _HotGoodsState createState() => _HotGoodsState();
}

class _HotGoodsState extends State<HotGoods> {
  void initState(){
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    request('homePageBelowConten', 1).then((val){

    });
    return Container(
       child:Text('2111212121'),
    );
  }
}

