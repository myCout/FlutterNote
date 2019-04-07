import 'package:flutter/material.dart';
import 'package:flutter_minizb/untils/cache_manager.dart';

class AppManager {
  static initApp(BuildContext context) async { 
    ///初始化用户信息
    try {
      // Store<AppState> store = StoreProvider.of(context);
      // User localUser = await UserManager.getUserFromLocalStorage();
      // if (localUser != null) {
      //   store.dispatch(UpdateUserAction(localUser));
      // }

      // ///读取主题
      // String themeIndex = await SPUtils.get(GankConfig.THEME_COLOR);
      // if (themeIndex != null && themeIndex.isNotEmpty) {
      //   await AppManager.switchThemeData(context, int.parse(themeIndex));
      // }

      // ///切换语言
      // String localeIndex = await SPUtils.get(GankConfig.LOCALE);
      // if (localeIndex != null && localeIndex.length != 0) {
      //   await AppManager.changeLocale(context, int.parse(localeIndex));
      // }

      // ///初始化收藏
      // await FavoriteManager.init();

      /// 初始化缓存
      await CacheManager.init();
      return true;
    } catch (e) {
      return false;
    }
  }
 }