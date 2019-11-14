import 'package:flutter_netease_cloud_music/App/app_color.dart';
import 'package:flutter_netease_cloud_music/public.dart';

//封面
class PlayListCoverWidget extends StatelessWidget {
  final String url;
  final int playCount;
  final double width;

  const PlayListCoverWidget({Key key, this.url, this.playCount, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      child: Container(
        width: width,
        height: width,
        color: AppColor.white,
        child: Stack(
          children: <Widget>[
            Utils.showNetImage(url),
          ],
        ),
      ),
    );
  }
}
