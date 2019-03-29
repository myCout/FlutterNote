import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWordsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //生成随机字符串
    final wordPair = WordPair.random();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(wordPair.toString(),style: TextStyle(fontSize: 30,fontStyle: FontStyle.italic),),
    );
  }
}