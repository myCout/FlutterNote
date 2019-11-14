import 'package:flutter_netease_cloud_music/App/app_color.dart';
import 'package:flutter_netease_cloud_music/public.dart';

//注意 typedef 需要放在class外面
typedef IndexCallback = Function(int index);

class HomeCategory extends StatelessWidget {
  final IndexCallback callback;
  const HomeCategory({Key key, this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var map = {
      '每日推荐': 'images/icon_daily.png',
      '歌单': 'images/icon_playlist.png',
      '排行榜': 'images/icon_rank.png',
      '电台': 'images/icon_radio.png',
      '直播': 'images/icon_look.png',
    };

    var keys = map.keys.toList();
    var width = ScreenUtil().setWidth(100);
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      color: AppColor.white,
      height: 100,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(), //屏蔽滚动
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: keys.length, //列数，每行几个
            mainAxisSpacing: 10, //主轴间距（这里是水平方向）
            crossAxisSpacing: 10, //交叉轴间距
            childAspectRatio: 1 / 1.1 //长宽比
            ),
        itemCount: keys.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              callback(index);
            },
            child: Container(
              color: AppColor.white,
              child: Column(
                children: <Widget>[
                  Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                        width: width,
                        height: width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(width / 2),
                            border:
                                Border.all(color: Colors.black12, width: 0.5),
                            gradient: RadialGradient(
                              colors: [
                                Color(0xFFFF8174),
                                Colors.red,
                              ],
                              center: Alignment(-1.7, 0),
                              radius: 1,
                            ),
                            color: Colors.red),
                      ),
                      Image.asset(
                        map[keys[index]],
                        width: width,
                        height: width,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 5),
                        child: keys[index] == '每日推荐'
                            ? Text(
                                '${DateUtil.formatDate(DateTime.now(), format: 'dd')}',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              )
                            : Text(
                                '',
                              ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      '${keys[index]}',
                      style: smallCommonTextStyle,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
