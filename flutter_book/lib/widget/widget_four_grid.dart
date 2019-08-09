import 'package:flutter/material.dart';
import 'package:flutter_book/App/app_color.dart';

class FourGridWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,//
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Wrap(),
          )
        ],
      ),
    );
  }
}