import 'package:flutter/material.dart';
import 'package:flutter_book/Model/ModModel.dart';
import 'package:flutter_book/widget/widget_collection.dart';
import 'package:flutter_book/widget/widget_section_view.dart';

import '../../public.dart';

class ThirdModuleView extends StatelessWidget {
  final ModModel modModel;

  const ThirdModuleView({Key key, this.modModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Divider(
          height: 10.0,
          indent: 0.0,
          color: AppColor.line,
        ),
        SectionView('小编力荐'),
        CollectionWidget(
          dataSource: this.modModel.books.sublist(
              1, 9), // 不指定end, 默认到数组结尾;包含end: 从start（包括）到end（不包括）的对象, 原数组不变
        )
      ],
    );
  }
}
