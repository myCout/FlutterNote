import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netease_cloud_music/pages/page_daily_song.dart';
import 'package:flutter_netease_cloud_music/pages/page_home.dart';
import 'package:flutter_netease_cloud_music/pages/page_login.dart';
import 'package:flutter_netease_cloud_music/pages/page_splash.dart';

// splash 页面
var splashHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  return SplashPage();
});

// 登录页
var loginHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  return LoginPage();
});

// 跳转到主页
var homeHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  return HomePage();
});
//每日推荐
var dailySongHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  return DailySongPage();
});

//// 跳转到每日推荐歌曲
//var dailySongsHandler = new Handler(
//    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
//      return DailySongsPage();
//    });
//
//// 跳转到歌单
//var playListHandler = new Handler(
//    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
//      String data = params['data'].first;
//      return PlayListPage(Recommend.fromJson(FluroConvertUtils.string2map(data)));
//    });
//
//// 跳转到每日推荐歌曲
//var topListHandler = new Handler(
//    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
//      return TopListPage();
//    });
//
//
//// 跳转到播放歌曲
//var playSongsHandler = new Handler(
//    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
//      return PlaySongsPage();
//    });
//
//// 跳转到评论
//var commentHandler = new Handler(
//    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
//      String data = params['data'].first;
//      return CommentPage(CommentHead.fromJson(FluroConvertUtils.string2map(data)));
//    });
