import 'dart:ui';

import 'package:flutter_netease_cloud_music/App/app_color.dart';
import 'package:flutter_netease_cloud_music/public.dart';
import 'package:flutter_netease_cloud_music/widgets/widget_flexible_detail_bar.dart';

// ignore: must_be_immutable
class CustomSliverAppBar extends StatelessWidget {
  double expandedHeight = ScreenUtil().setWidth(340);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SliverAppBar(
        centerTitle: true,
        elevation: 0,
        // 类似AppBar，但是可以设置滚动效果
        pinned: true,
        //  固定在上面 不随着list滚动
        floating: true,
        // 向下滚动显示 向上 跟随影藏
        expandedHeight: expandedHeight,
        // 设置顶部向下伸展的高度
        brightness: Brightness.dark,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          '每日推荐',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
//        actions: <Widget>[
//          IconButton(
//            icon: Icon(Icons.shopping_cart),
//            tooltip: 'Open shopping cart',
//            onPressed: () {
//              // handle the press
//            },
//          ),
//        ],
        flexibleSpace: FlexibleDetailBar(
          content: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Spacer(),
                Container(
                  padding: EdgeInsets.only(left: ScreenUtil().setWidth(40)),
                  margin: EdgeInsets.only(bottom: ScreenUtil().setWidth(5)),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text:
                                '${DateUtil.formatDate(DateTime.now(), format: 'dd')} ',
                            style: TextStyle(fontSize: 30)),
                        TextSpan(
                            text:
                                '/ ${DateUtil.formatDate(DateTime.now(), format: 'MM')}',
                            style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: ScreenUtil().setWidth(40)),
                  margin: EdgeInsets.only(bottom: ScreenUtil().setWidth(20)),
                  child: Text(
                    '根据你的音乐口味，为你推荐好音乐。',
                    style: TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                ),
              ],
            ),
          ),
          background: Stack(
            children: <Widget>[
              Image.asset(
                'images/bg_daily.png',
                fit: BoxFit.cover,
              ),
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaY: 5,
                  sigmaX: 5,
                ),
                child: Container(
                  color: Colors.black38,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ],
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(ScreenUtil().setWidth(100)),
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(ScreenUtil().setWidth(30))),
            child: Container(
              color: AppColor.white,

            ),
          ),
        ),
      ),
    );
  }
}
