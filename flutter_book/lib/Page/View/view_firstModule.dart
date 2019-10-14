import 'package:flutter/material.dart';
import 'package:flutter_book/Model/ModModel.dart';
import 'package:flutter_book/public.dart';
import 'package:flutter_book/widget/widget_book_cell.dart';
import 'package:flutter_book/widget/widget_collection.dart';
import 'package:flutter_book/widget/widget_section_view.dart';

class FirstModulView extends StatelessWidget {
  final ModModel modModel;

  const FirstModulView({Key key, this.modModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SectionView('精选'),
        BookCell(this.modModel.books[0]),
        CollectionWidget(
          dataSource: this.modModel.books.sublist(
              1, 5), // 不指定end, 默认到数组结尾;包含end: 从start（包括）到end（不包括）的对象, 原数组不变
        )
      ],
    );
  }
}
