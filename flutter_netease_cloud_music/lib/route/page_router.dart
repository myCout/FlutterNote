import 'package:fluro/fluro.dart';
import 'package:flutter_netease_cloud_music/pages/page_daily_song.dart';
import 'package:flutter_netease_cloud_music/public.dart';
import 'package:flutter_netease_cloud_music/route/route_handles.dart';

import '../Application.dart';

String root = "/";
String login = "/login";
String home = "/home";
String dailySongs = "/daily_songs";
String topList = "/top_list";
//下面是传参的样式
String sendParams1 = "/send_params1/:userId";
String sendParams2 = "/send_params2/:id/:name";

final Map<String, Handler> pageRoutes = {
  root: splashHandler,
  login: loginHandler,
  home: homeHandler,
  dailySongs: dailySongHandler,
  topList: topListHandler,
  sendParams1: Handler(handlerFunc: (BuildContext context, params) {
    return DailySongPage(
//      name:params['userId'].first //如果要传参，则使用这种方式
        );
  })
};

class PageRouter {
  static final router = Router();
  static setupRouters() {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
      return Container();
    });
    pageRoutes.forEach((path, handler) {
      router.define(path,
          handler: handler, transitionType: TransitionType.inFromRight);
    });
    Application.router = router;
  }
}
