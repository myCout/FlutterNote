import 'package:flutter/material.dart';
import 'package:flutter_book/App/app_color.dart';
import 'package:flutter_book/Model/Book.dart';
import 'package:flutter_book/widget/widget_collection_cell.dart';

// import 'package:flutter_book/App/app_color.dart';
// import 'package:flutter_book/App/app_navigator.dart';
// import 'package:flutter_book/App/app_screen.dart';
// import 'package:flutter_book/Model/NovelModel.dart';
// import 'package:flutter_book/widget/widget_cover_view.dart';
// import 'package:flutter_book/widget/widget_novelcover_image.dart';

class CollectionWidget extends StatelessWidget {
  final List<Book> dataSource;

  const CollectionWidget({Key key, this.dataSource}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var width = Screen.width;
    return Container(
      color: AppColor.white,
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, //每行个数
          childAspectRatio: 0.55, //宽高比为1
          crossAxisSpacing: 10.0, //横轴间距
        ),
        itemCount: dataSource.length,
        itemBuilder: (context, index) {
          return Container(
              color: AppColor.white,
              child: BookCollectionCell(model: dataSource[index]));
        },
      ),
    );
  }
}
