import 'package:flutter/material.dart';
import 'package:flutter_book/App/app_color.dart';
import 'package:flutter_book/App/app_screen.dart';
import 'package:flutter_book/Model/Book.dart';
import 'package:flutter_book/public.dart';
import 'package:flutter_book/widget/widget_cover_view.dart';

class BookCollectionCell extends StatelessWidget {
  final Book model;

  const BookCollectionCell({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = (Screen.width - 10 * 2 - 10 * 3) / 4;
    return GestureDetector(
      onTap: () {
        AppNavigator.pushNovelDetail(context, model);
      },
      child: Container(
        width: width,
        color: AppColor.white,
        child: Column(
          children: <Widget>[
            CoverView(
              model: model,
              width: width,
              height: width / .75,
            ),
            // NovelCovelImageWidget(
            //   imgUrl: model.cover,
            //   width: 90,
            //   height: 120,
            // ),
            // SizedBox(
            //   height: 5,
            // ),
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
