import 'package:flutter/material.dart';
import 'package:flutter_book/App/app_color.dart';
import 'package:flutter_book/App/app_screen.dart';
import 'package:flutter_book/Model/NovelModel.dart';
import 'package:flutter_book/widget/widget_novelcover_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vector_math/vector_math_64.dart' as Vector;

class CollectionWidget extends StatelessWidget {
  List<Widget> list = [
    // this.buildPhoto(),
    buildPhoto(),
    buildPhoto(),
    buildPhoto(),
    buildPhoto(),
    // buildPhoto(),
    // buildPhoto(),
  ];

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.blueGrey,
      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: Wrap(
        spacing: 15.0, // 主轴(水平)方向间距
        runSpacing: 10.0, // 纵轴（垂直）方向间距
        alignment: WrapAlignment.start, //沿主轴方向居中
        children: list,),
    );
  }
}

Widget buildPhoto() {
  // var width = Screen.width;
  // var height = width * 1.25;
  NovelModel model;
  // model.imgUrl = 'http://img-tailor.11222.cn/pm/book/operate/2019010321241999.jpg';
  // model.name = '鹿鼎记';
  // model.author = '金庸';
  return NovelCell(model: model);
}

class NovelCell extends StatelessWidget {

  final NovelModel model;
  const NovelCell({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = (Screen.width - 15*2 - 15*3)/4;
    return GestureDetector(
      onTap: () {

      },
      child: Container(
        width: width,
        color: AppColor.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,//竖直方向，从上往下布局
          children: <Widget>[
            NovelCovelImageWidget(imgUrl: 'http://img-tailor.11222.cn/pm/book/operate/2019010321241999.jpg',width: width,height: width/0.75,),
            SizedBox(height: 5,),
            Text( '鹿鼎记', overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold), maxLines: 1,),
            SizedBox(height: 3,),
            Text('金庸',style: TextStyle(fontSize: 12, color: AppColor.gray),maxLines: 1,),
          ],
        ),
      ),
    );
  }
}
