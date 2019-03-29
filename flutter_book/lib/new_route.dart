import 'package:flutter/material.dart';
import 'package:flutter_book/random_words.dart';

class NewRoute extends StatelessWidget {
  NewRoute(this.tip);
  final String tip;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
      ),
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(tip),
            RandomWordsWidget(),
          ],
        )
      ),
    );
  }
}