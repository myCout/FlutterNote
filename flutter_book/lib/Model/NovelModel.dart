import 'package:flutter/material.dart';
import 'package:flutter_book/App/app_color.dart';

class NovelModel {
  String id;
  String name;
  String imgUrl;
  String firstChapter;
  String  author;
  String introduction;
  int chapterCount;
  int recommendCount;
  List<String> tags;
  String status;

  NovelModel.fromJson(Map data) {
    id = data['bid'];
  }

   String recommendCountStr() {
    if (recommendCount >= 10000) {
      return (recommendCount / 10000).toStringAsFixed(1) + '万人推荐';
    } else {
      return recommendCount.toString() + '人推荐';
    }
  }

  Color statusColor() {
    return status == '连载' ? AppColor.blue : AppColor.primary;
  }

}