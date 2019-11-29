import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netease_cloud_music/pages/page_login.dart';
import 'package:flutter_netease_cloud_music/route/page_router.dart';
import 'package:flutter_netease_cloud_music/route/routes.dart';

import '../Application.dart';

class AppNavigator {
  static push(BuildContext context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(
      builder: (BuildContext context) {
        return widget;
      },
    ));
  }

  static customNavigateTo(BuildContext context, String path,
      {bool replace = false,
      bool clearStack = false,
      Duration transitionDuration = const Duration(milliseconds: 600),
      RouteTransitionsBuilder transitionBuilder}) {
    Application.router.navigateTo(context, path,
        replace: replace,
        clearStack: clearStack,
        transitionDuration: transitionDuration,
        transitionBuilder: transitionBuilder,
        transition: TransitionType.material);//使用fadein动画会让手势返回失效
  }

// 使用 Navigator.of(context).push(CustomRoute(SecondPage()))),

  static pushPageLogin(BuildContext context) {
    AppNavigator.customNavigateTo(context, login, clearStack: true);
  }

  static pushPageHome(BuildContext context) {
    AppNavigator.customNavigateTo(context, home, clearStack: true);
  }

  static pushPageDailySongs(BuildContext context) {
    customNavigateTo(context, dailySongs);
  }
static pushPageTopList(BuildContext context) {
    customNavigateTo(context, topList);
  }


//  static pushNovelDetail(BuildContext context, Book model) {
//    AppNavigator.push(context, NovelDetailPage(bookModel: model));
//  }
//
//   static pushLogin(BuildContext context) {
//     AppNavigator.push(context,LoginPage());
//   }
//
//  static pushEditProfile(BuildContext context, UserModelEntity model) {
//    AppNavigator.push(context, EditProfile(userModel: model,));
//  }
//
//  static pushTestPage(BuildContext context) {
//    AppNavigator.push(context,TestPage());
//  }

}
