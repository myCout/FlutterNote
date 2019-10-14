import 'package:flutter/material.dart';
import 'package:flutter_book/Model/UpdateItemModel.dart';
// import 'package:flutter_book/Page/bookcity/page_category.dart';

class UpdatedItem extends StatelessWidget {
  final UpdateItemModel model;
  final VoidCallback onPressed;
  //用来给model赋值
  const UpdatedItem({Key key, this.model, this.onPressed})
      : super(key: key); //数据模型

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[buildTopRow(context), buildBottomRow(context)],
    );
  }

  Widget buildTopRow(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          //Paddng 控件，用来设置 Image 控件边距
          padding: EdgeInsets.all(10), //上下左右边距均为 10
          child: ClipRRect(
            //圆角矩形裁剪控件
            borderRadius: BorderRadius.circular(8.0), //圆角半径为 8
            child: Image.asset(model.appIcon, width: 80, height: 80),
          ),
        ),
        Expanded(
          //用来拉伸中间区域
          child: Column(
            //用来垂直摆放子 Widget
            mainAxisAlignment: MainAxisAlignment.center, //垂直方向居中对齐
            crossAxisAlignment: CrossAxisAlignment.start, //水平方向左对齐
            children: <Widget>[
              Text(
                model.appName,
                maxLines: 1,
              ),
              Text(
                model.appDate,
                maxLines: 1,
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 10, 0), //右边距为 10，其余均为0
          child: FlatButton(
            child: Text("Open"),
            onPressed: () {},
            // onPressed: ,
          ),
        )
      ],
    );
  }

  Widget buildBottomRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(model.appDescription),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text("${model.appVersion} ~ ${model.appSize} MB"),
          )
        ],
      ),
    );
  }
}
