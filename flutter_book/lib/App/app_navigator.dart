import 'package:flutter/material.dart';

class AppNavigator {
  static push(BuildContext context, Widget widget) {
      Navigator.push(context, MaterialPageRoute(
        builder: (BuildContext context) => widget,
      )    
    );
  }

  // static pushNovelDetail(BuildContext context, Novel novel) {
  //   AppNavigator.push(context, NovelDetailPage(novel.id));
  // }

  // static pushLogin(BuildContext context) {
  //   Navigator.push(context, MaterialPageRoute(builder: (context) {
  //     return LoginScene();
  //   }));
  // }

}
