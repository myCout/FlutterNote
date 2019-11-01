import 'package:flutter/material.dart';
import 'package:flutter_book/Base/Base_widget.dart';
import 'package:flutter_book/Model/UpdateItemModel.dart';
import 'package:flutter_book/public.dart';
import 'package:flutter_book/widget/widget_updatedItem.dart';
import 'package:flutter/src/widgets/framework.dart';

class BookShelfPage extends BaseWidget {
  @override
  BaseWidgetState<BaseWidget> getState() {
    return _BookShelfPageState();
  }
}

class _BookShelfPageState extends BaseWidgetState<BookShelfPage>
    with SingleTickerProviderStateMixin {

  @override
  Widget buildWidget(BuildContext context) {
    // TODO: implement buildWidget
    return null;
  }

  @override
  void onCreate() {
    // TODO: implement onCreate
    log('onCreate');
  }

  @override
  void onPause() {
    // TODO: implement onPause
    log('onPause');
  }

  @override
  void onResume() {
    // TODO: implement onResume
    log('onResume');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('书架'),
      ),
      body: ListView(
        children: <Widget>[
          // Text("dataddddddddd"),
          UpdatedItem(
            model: UpdateItemModel(
                appIcon: R.assetsImgsIcon,
                appDescription:
                    "Thanks for using Google Maps! This release brings bug fixes that improve our product to help you discover new places and navigate to them.",
                appName: "Google Maps - Transit & Fond",
                appSize: "137.2",
                appVersion: "Version 5.19",
                appDate: "2019年6月5日"),
            onPressed: () {},
          )
        ],
      ),
    );
  }


}
