import 'package:flutter/material.dart';
// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_book/App/app_color.dart';

import '../public.dart';

class NovelCoverImage extends StatelessWidget {
  final String imgUrl;
  final double width;
  final double height;

  const NovelCoverImage({Key key, this.imgUrl, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      child: ExtendedImage.network(
        imgUrl,
        fit: BoxFit.cover,
        width: width,
        height: height,
        cache: true,
        // border: Border.all(color: Colors.red, width: 1.0),
        // shape: boxShape,
        // borderRadius: BorderRadius.all(Radius.circular(30.0)),
        // color: AppColor.primary,
      ),
      // decoration: BoxDecoration(border: Border.all(color: AppColor.paper)),
    );
  }
}
