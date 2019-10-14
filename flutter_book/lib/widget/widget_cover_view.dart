import 'package:flutter/material.dart';
import 'package:flutter_book/Model/Book.dart';
import 'package:flutter_book/widget/widget_cover_image.dart';

import '../public.dart';

class CoverView extends StatelessWidget {
  final Book model;
  final double width;
  final double height;

  const CoverView({Key key, this.model, this.width, this.height})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.pushNovelDetail(context, model);
      },
      child: Container(
        color: AppColor.white,
        width: width,
        height: height + 2,
        // margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // SizedBox(height: 5),
            NovelCoverImage(
                imgUrl: model.cover, width: width, height: this.height),
            // SizedBox(height: 0),
            // Text(
            //   model.name,
            //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            //   maxLines: 2,
            // )
          ],
        ),
      ),
    );

//    return Container();
  }
}
