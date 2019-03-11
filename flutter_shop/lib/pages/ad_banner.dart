import 'package:flutter/material.dart';
//广告图片
class AdBanner extends StatelessWidget {
  final String advertesPicture;
  AdBanner({Key key, this.advertesPicture}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(advertesPicture),
    );
  }
}
