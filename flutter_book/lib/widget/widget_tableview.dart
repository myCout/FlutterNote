import 'package:flutter/material.dart';
import 'package:flutter_book/App/app_color.dart';
import 'package:flutter_book/Model/Book.dart';
import 'package:flutter_book/public.dart';

import 'widget_book_cell.dart';

class TableView extends StatelessWidget {
  final List<Book> dataSourceList;

  const TableView({Key key, this.dataSourceList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColor.white,
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: getListData(context),
        ));
  }

  getListData(BuildContext context) {
    List<Widget> widgets = [];
    for (var item in dataSourceList) {
      widgets.add(GestureDetector(
        onTap: () {
          AppNavigator.pushNovelDetail(context, item);
        },
        child: Padding(
          padding: EdgeInsets.all(0),
          child: BookCell(item),
        ),
      ));
    }
    return widgets;
  }
}
