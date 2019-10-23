import 'package:flutter/material.dart';
import 'package:flutter_book/AATest/Test_CunstomPage.dart';
import 'package:flutter_book/Model/Book.dart';
import 'package:flutter_book/Page/bookcity/page_novel_detail.dart';
import 'package:flutter_book/Page/page_login.dart';

class AppNavigator {
  static push(BuildContext context, Widget widget) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => widget,
        ));
  }
// 使用 Navigator.of(context).push(CustomRoute(SecondPage()))),

  static pushNovelDetail(BuildContext context, Book model) {
    AppNavigator.push(context, NovelDetailPage(bookModel: model));
  }

   static pushLogin(BuildContext context) {
     AppNavigator.push(context,LoginPage());
   }

  static pushTestPage(BuildContext context) {
    AppNavigator.push(context,TestPage());
  }


}
