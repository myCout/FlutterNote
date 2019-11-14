import 'package:flutter/material.dart';

class HEmptyView extends StatelessWidget {
  final double width;

  const HEmptyView({Key key, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
//        color: Colors.blue,
      ),
      width: width,
    );
  }
}
