import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_book/App/app_color.dart';

class NovelCovelImageWidget extends StatelessWidget {
  final String imgUrl;
  final double width;
  final double height;

  const NovelCovelImageWidget({Key key, this.imgUrl, this.width, this.height}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image(
        image: CachedNetworkImageProvider(imgUrl),
        fit: BoxFit.cover,
        width: width,
        height: height,
        color: AppColor.primary,
      ),
      decoration: BoxDecoration(border: Border.all(color: AppColor.paper)),
    );
  }
}