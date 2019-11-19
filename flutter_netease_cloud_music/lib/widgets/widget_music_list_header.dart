import 'package:flutter/material.dart';
import 'package:flutter_netease_cloud_music/provider/play_songs_model.dart';
import 'package:flutter_netease_cloud_music/widgets/widget_hempty_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'app_common_text.dart';


typedef PlayModelCallback = void Function(PlaySongsModel model);

class MusicListHeader extends StatelessWidget implements PreferredSizeWidget {
  MusicListHeader({this.count, this.tail, this.onTap});

  final int count;
  final Widget tail;
  final PlayModelCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(
          top: Radius.circular(ScreenUtil().setWidth(30))),
      child: Container(
        color: Colors.white,
        child: Consumer<PlaySongsModel>(builder: (context, model, child) {
          return InkWell(
            onTap: (){
              onTap(model);
            },
            child: SizedBox.fromSize(
              size: preferredSize,
              child: Row(
                children: <Widget>[
                  HEmptyView(width:20),
                  Icon(
                    Icons.play_circle_outline,
                    size: ScreenUtil().setWidth(50),
                  ),
                  HEmptyView(width:10),
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: Text(
                      "播放全部",
                      style: mCommonTextStyle,
                    ),
                  ),
                  HEmptyView(width:5),
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: count == null
                        ? Container()
                        : Text(
                            "(共$count首)",
                            style: smallGrayTextStyle,
                          ),
                  ),
                  Spacer(),
                  tail ?? Container(),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(ScreenUtil().setWidth(100));
}
