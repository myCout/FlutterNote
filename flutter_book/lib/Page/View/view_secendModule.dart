import 'package:flutter/material.dart';
import 'package:flutter_book/Model/Book.dart';
import 'package:flutter_book/Model/ModModel.dart';
// import 'package:flutter_book/widget/widget_book_cell.dart';
import 'package:flutter_book/widget/widget_section_view.dart';
import 'package:flutter_book/widget/widget_tableview.dart';

import '../../public.dart';

class SecendModuleView extends StatelessWidget {
  final ModModel modModel;

  const SecendModuleView({Key key, this.modModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Book> showData = this.modModel.books.sublist(0, 4);
    return Column(
      children: <Widget>[
        Divider(
          height: 10.0,
          indent: 0.0,
          color: AppColor.line,
        ),
        SectionView('小编力荐'),
        TableView(
          dataSourceList: showData,
        )
      ],
    );
  }
}
