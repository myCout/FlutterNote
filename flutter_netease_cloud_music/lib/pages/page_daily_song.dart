import 'dart:ui';

import 'package:flutter_netease_cloud_music/model/daily_songs.dart';
import 'package:flutter_netease_cloud_music/model/music.dart';
import 'package:flutter_netease_cloud_music/provider/play_songs_model.dart';
import 'package:flutter_netease_cloud_music/public.dart';
import 'package:flutter_netease_cloud_music/widgets/widget_flexible_detail_bar.dart';
import 'package:flutter_netease_cloud_music/widgets/widget_future_builder.dart';
import 'package:flutter_netease_cloud_music/widgets/widget_music_list_item.dart';
import 'package:flutter_netease_cloud_music/widgets/widget_sliver_future_builder.dart';
import 'package:provider/provider.dart';

class DailySongPage extends StatefulWidget {
  @override
  _DailySongPageState createState() => _DailySongPageState();
}

class _DailySongPageState extends State<DailySongPage> {
  double _expandedHeight = ScreenUtil().setWidth(340);
  int _count;
  DailySongsData data;
  final List<Color> colorList = [
    Colors.red,
    Colors.orange,
    Colors.green,
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.pink,
    Colors.teal,
    Colors.deepPurpleAccent
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            // 类似AppBar，但是可以设置滚动效果
            pinned: true,
            //  固定在上面 不随着list滚动
            floating: true,
            // 向下滚动显示 向上 跟随影藏
            expandedHeight: _expandedHeight,
            // 设置顶部向下伸展的高度
            brightness: Brightness.dark,
            iconTheme: IconThemeData(color: Colors.white),
            title: Text(
              '每日推荐',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
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
                      margin:
                          EdgeInsets.only(bottom: ScreenUtil().setWidth(20)),
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
          ),
          CustomSliverFutureBuilder<DailySongsData>(
            futureFunc: NetUtils.getDailySongsData,
            builder: (context, data) {
//              setCount(data.recommend.length);
              return Consumer<PlaySongsModel>(
                builder: (context, model, child) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        this.data = data;
                        var d = data.recommend[index];

                        return WidgetMusicListItem(
                          MusicData(
                              mvid: d.mvid,
                              picUrl: d.album.picUrl,
                              songName: d.name,
                              artists:
                                  "${d.artists.map((a) => a.name).toList().join('/')} - ${d.album.name}"),
                          onTap: () {
//                            playSongs(model, index);
                          },
                        );
                      },
                      childCount: data.recommend.length,
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  setCount(int count) {
    Future.delayed(Duration(milliseconds: 300), () {
      if (mounted) {
        setState(() {
          _count = count;
        });
      }
    });
  }
}
