import 'package:flutter/material.dart';

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
      width: width,
//      color: Colors.lightGreenAccent,
//      child: buildExtendedImgView(),
      child: buildDefaultImgView(),
      decoration: BoxDecoration(border: Border.all(color: AppColor.paper)),
    );
  }

  Widget buildExtendedImgView() {
    return Container(
      child: ExtendedImage.network(
        imgUrl,
        fit: BoxFit.cover,
        width: width,
        height: height,
        cache: true,
        border: Border.all(color: AppColor.paper, width: 1.0),
      ),
    );
  }

  Widget buildDefaultImgView() {
    return Container(
      child: Image(
        image: NetworkImage(imgUrl),
        fit: BoxFit.cover,
        width: width,
        height: height,
      ),
    );
  }
}
