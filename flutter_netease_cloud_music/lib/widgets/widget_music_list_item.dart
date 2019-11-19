import 'package:flutter/material.dart';
import 'package:flutter_netease_cloud_music/model/music.dart';
import 'package:flutter_netease_cloud_music/widgets/rounded_net_image.dart';
import 'package:flutter_netease_cloud_music/widgets/widget_hempty_view.dart';
import 'package:flutter_netease_cloud_music/widgets/widget_vempty_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../application.dart';
import 'app_common_text.dart';

class WidgetMusicListItem extends StatelessWidget {
  final MusicData _data;
  final VoidCallback onTap;

  WidgetMusicListItem(this._data, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Container(
        width: Application.screenWidth,
        height: ScreenUtil().setWidth(120),
        child: Row(
//          mainAxisSize: MainAxisSize.min,
//          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            HEmptyView(width: 15),
            _data.picUrl == null
                ? Container()
                : RoundedNetImage(
                    _data.picUrl,
                    width: 100,
                    height: 100,
                    radius: 5,
                  ),
            _data.index == null
                ? Container()
                : Container(
              color: Colors.green,
                    alignment: Alignment.center,
                    width: ScreenUtil().setWidth(60),
                    height: ScreenUtil().setWidth(50),
                    child: Text(
                      _data.index.toString(),
                      style: mGrayTextStyle,
                    ),
                  ),
            HEmptyView(width: 10),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    _data.songName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: commonTextStyle,
                  ),
                  VEmptyView(10),
                  Text(
                    _data.artists,
                    style: smallGrayTextStyle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: _data.mvid == 0
                  ? Container()
                  : IconButton(
                      icon: Icon(Icons.play_circle_outline),
                      onPressed: () {},
                      color: Colors.grey,
                    ),
            ),
            Align(
              alignment: Alignment.center,
              child: IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {},
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
