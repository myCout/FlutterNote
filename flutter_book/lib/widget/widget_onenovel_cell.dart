import 'package:flutter/material.dart';
import 'package:flutter_book/Model/Book.dart';
// import 'package:flutter_book/Model/NovelModel.dart';
// import 'package:flutter_book/widget/widget_cover_view.dart';

class OneNovelCell extends StatelessWidget {
  final Book model;

  const OneNovelCell({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Text('ddddddddddddddddddsds'),
        ],
      ),
    );
  }
}
