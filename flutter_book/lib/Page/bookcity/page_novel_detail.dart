import 'package:flutter/material.dart';
import 'package:flutter_book/App/app_color.dart';
import 'package:flutter_book/Model/Book.dart';
import 'package:flutter_book/widget/widget_detail_toolbar.dart';

import '../../public.dart';

class NovelDetailPage extends StatefulWidget {
  final Book bookModel;

  const NovelDetailPage({Key key, this.bookModel}) : super(key: key);

  @override
  _NovelDetailPageState createState() => _NovelDetailPageState();
}

class _NovelDetailPageState extends State<NovelDetailPage> with RouteAware {
  @override
  Widget build(BuildContext context) {
    Book model = widget.bookModel;
    var width = (Screen.width - 10 * 2 - 10 * 3) / 4;
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        title: Text(model.name),
        backgroundColor: AppColor.white,
      ),
      body: Container(
        color: AppColor.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
              height: ScreenUtil.getScaleH(context, 140),
              child: Row(
                children: <Widget>[
                  NovelCoverImage(
                      imgUrl: model.cover, width: width, height: width / .7),
                  Container(
                    // color: AppColor.blue,
                    margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    // height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          model.name,
                          style: TextStyle(
                            color: AppColor.color333,
                            fontSize: 18.0,
                            fontFamily: "Courier",
                          ),
                          textDirection: TextDirection.ltr,
                        ),
                        Text(
                          '作者:' + model.author,
                          style: TextStyle(
                            color: AppColor.color666,
                            fontSize: 11.0,
                            fontFamily: "Courier",
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                        // Text(model.name),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
              child: Text(
                model.intro,
                style: TextStyle(
                  color: AppColor.color666,
                  fontSize: 13.0,
                  fontFamily: "Courier",
                ),
                textDirection: TextDirection.ltr,
              ),
            ),
            Container(
              child: Divider(
                height: 1.0,
                indent: 0.0,
                color: AppColor.line, //line
              ),
            ),
            Container(
                child: Container(
              // color: AppColor.blue,
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              height: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '目录: ',
                        style: TextStyle(
                          color: AppColor.color333,
                          fontSize: 18.0,
                          fontFamily: "Courier",
                        ),
                      ),
                      Text(
                        '最新章节' + model.chapterUpdateName,
                        style: TextStyle(
                          color: AppColor.primary,
                          fontSize: 13.0,
                          fontFamily: "Courier",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
            Container(
              child: Divider(
                height: 1.0,
                indent: 0.0,
                color: AppColor.line, //line
              ),
            ),
            Expanded(
              child: Container(
                color: AppColor.white,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: BookDetailToolBar(
                bookModel: model,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
