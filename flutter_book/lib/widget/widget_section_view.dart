import 'package:flutter/material.dart';
import 'package:flutter_book/public.dart';

class SectionView extends StatelessWidget {
  final String title;
  SectionView(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
            child: Row(
              children: <Widget>[
                Image.asset(Assets.assetsImgsHomeTip),
                SizedBox(width: 10),
                Text('$title',
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Divider(
            height: 1.0,
            indent: 0.0,
            color: AppColor.line, //line
          ),
        ],
      ),
    );
  }
}
