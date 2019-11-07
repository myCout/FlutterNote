import 'package:flutter/material.dart';
import 'package:flutter_netease_cloud_music/widgets/app_common_text.dart';
import 'package:flutter_netease_cloud_music/widgets/widget_vempty_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NetErrorWidget extends StatelessWidget {
  final VoidCallback callback;

  const NetErrorWidget({Key key, this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        alignment: Alignment.center,
        height: ScreenUtil().setHeight(200),
        child: Column(
          children: <Widget>[
            Icon(
              Icons.error_outline,
              size: ScreenUtil().setWidth(80),
            ),
            VEmptyView(ScreenUtil().setWidth(10)),
            Text(
              '点击重新请求',
              style: commonTextStyle,
            )
          ],
        ),
      ),
    );
  }
}
