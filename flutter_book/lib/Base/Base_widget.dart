import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_book/Base/BaseFuntion.dart';

abstract class BaseWidget extends StatefulWidget {
  BaseWidgetState baseWidgetState;

  @override
  BaseWidgetState createState() {
    baseWidgetState = getState();
    return baseWidgetState;
  }

  BaseWidgetState getState();

  String getStateName() {
    return baseWidgetState.getClassName();
  }
}

abstract class BaseWidgetState<T extends BaseWidget> extends State<T>
    with BaseFunction, WidgetsBindingObserver {
  bool _onResumed = false; //页面展示标记
  bool _onPause = false; //页面暂停标记

  @override
  void initState() {
    // TODO: implement initState
    initBaseCommon(this, context);
    WidgetsBinding.instance.addObserver(this);
    onCreate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return getBaseView(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    onDestory();
    WidgetsBinding.instance.removeObserver(this);
    _onResumed = false;
    _onPause = false;
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    //此处可以拓展 是不是从前台回到后台
    if (state == AppLifecycleState.resumed) {
      //on resume
//      if (NavigatorManger().isTopPage(this)) {
//        onForeground();
//        onResume();
//      }
    } else if (state == AppLifecycleState.paused) {
      //onpause
//      if (NavigatorManger().isTopPage(this)) {
//        onBackground();
//        onPause();
//      }
    }
    super.didChangeAppLifecycleState(state);
  }
}
