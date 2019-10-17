import 'package:flutter/material.dart';
import 'package:flutter_book/App/app_color.dart';
import 'package:flutter_book/App/app_screen.dart';
import 'package:flutter_book/Model/Book.dart';
import 'package:flutter_book/public.dart';

class BookCollectionCell extends StatelessWidget {
  final Book model;

  const BookCollectionCell({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var imgWidth = (Screen.width - 50) / 4;
    var imgHeight = imgWidth / .7;
    return GestureDetector(
      onTap: () {
        AppNavigator.pushNovelDetail(context, model);
      },
      child: Container(
        // width: imgWidth,
        // height: imgHeight + ScreenUtil().setHeight(90),
        color: AppColor.white,
        child: Column(
          children: <Widget>[
            NovelCoverImage(
                imgUrl: model.cover, width: imgWidth, height: imgHeight),
            Text(
              model.name,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              maxLines: 1,
            ),
            // SizedBox(
            //   height: 3,
            // ),
            Text(
              model.author,
              style: TextStyle(fontSize: 12, color: AppColor.gray),
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
