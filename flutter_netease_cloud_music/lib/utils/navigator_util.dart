import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netease_cloud_music/route/routes.dart';

import '../application.dart';

class NavigatorUtil {
  static customNavigateTo(BuildContext context, String path,
      {bool replace = false,
      bool clearStack = false,
      Duration transitionDuration = const Duration(milliseconds: 250),
      RouteTransitionsBuilder transitionBuilder}) {
    Application.router.navigateTo(context, path,
        replace: replace,
        clearStack: clearStack,
        transitionDuration: transitionDuration,
        transitionBuilder: transitionBuilder,
        transition: TransitionType.fadeIn);
  }

  /// 登录页
  static void goLoginPage(BuildContext context) {
    NavigatorUtil.customNavigateTo(context, Routes.login, clearStack: true);
//    Application.router.navigateTo(context, "/login",transition: TransitionType.fadeIn);
  }
}
