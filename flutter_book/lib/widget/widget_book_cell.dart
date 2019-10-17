import 'package:flutter/material.dart';
import 'package:flutter_book/Model/Book.dart';
import 'package:flutter_book/widget/widget_cover_view.dart';

import '../public.dart';

class BookCell extends StatelessWidget {
  final Book bookModel;

  BookCell(this.bookModel);

  @override
  Widget build(BuildContext context) {
    var imgWidth = (Screen.width - 50) / 4;
    var imgHeight = imgWidth / .7;
    return Container(
      height: imgHeight + 10,
      color: AppColor.white,
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Row(
        // textDirection: TextDirection.ltr,
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          // CoverView(model: bookModel, width: width, height: height),
          // ExtendedImage.network(
          //   bookModel.cover,
          //   // color: AppColor.primary,
          //   fit: BoxFit.cover,
          //   width: imgWidth + 1,
          //   height: imgHeight,
          //   cache: true,
          //   // border: Border.all(color: Colors.red, width: 10.0),
          //   // shape: boxShape,
          //   // borderRadius: BorderRadius.all(Radius.circular(30.0)),
          // ),
          NovelCoverImage(
              imgUrl: bookModel.cover, width: imgWidth, height: imgHeight),
          BookDetail(context, bookModel)
        ],
      ),
    );
  }
}

Widget BookDetail(BuildContext context, Book bookModel) {
  return Expanded(
    child: Container(
      // padding: EdgeInsets.all(0),
      margin: EdgeInsets.fromLTRB(10, 0, 0, 5),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                bookModel.name,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontFamily: "Courier",
                ),
                textDirection: TextDirection.ltr,
              )
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  bookModel.intro,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.0,
                    fontFamily: "Courier",
                  ),
                  textDirection: TextDirection.ltr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(bookModel.author,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.0,
                      fontFamily: "Courier",
                    ),
                    textDirection: TextDirection.ltr,
                    maxLines: 1),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
