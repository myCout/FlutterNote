// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_book/App/app_color.dart';
import 'package:flutter_book/public.dart';

class NovelCovelImageWidget extends StatelessWidget {
  final String imgUrl;
  final double width;
  final double height;

  const NovelCovelImageWidget({Key key, this.imgUrl, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ExtendedImage.network(
        imgUrl,
        fit: BoxFit.fill,
        width: ScreenUtil().setWidth(width),
        height: ScreenUtil().setHeight(height),
        cache: true,
        border: Border.all(color: Colors.red, width: 1.0),
        // shape: boxShape,
        // borderRadius: BorderRadius.all(Radius.circular(30.0)),
        // color: AppColor.primary,
      ),
      decoration: BoxDecoration(border: Border.all(color: AppColor.paper)),
    );
  }
}
