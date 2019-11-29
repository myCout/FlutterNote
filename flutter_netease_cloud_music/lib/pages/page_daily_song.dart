import 'dart:ui';

import 'package:flutter_netease_cloud_music/model/daily_songs.dart';
import 'package:flutter_netease_cloud_music/model/music.dart';
import 'package:flutter_netease_cloud_music/provider/play_songs_model.dart';
import 'package:flutter_netease_cloud_music/public.dart';
import 'package:flutter_netease_cloud_music/widgets/widget_flexible_detail_bar.dart';
import 'package:flutter_netease_cloud_music/widgets/widget_future_builder.dart';
import 'package:flutter_netease_cloud_music/widgets/widget_music_list_item.dart';
import 'package:flutter_netease_cloud_music/widgets/widget_sliver_appbar.dart';
import 'package:flutter_netease_cloud_music/widgets/widget_sliver_future_builder.dart';
import 'package:provider/provider.dart';

class DailySongPage extends StatefulWidget {
  @override
  _DailySongPageState createState() => _DailySongPageState();
}

class _DailySongPageState extends State<DailySongPage> {

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
      backgroundColor: Colors.white,
//      appBar: AppBar(
//        automaticallyImplyLeading: false, //设置没有返回按钮
//      ),
      body: CustomScrollView(
        slivers: <Widget>[
          CustomSliverAppBar(),
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
