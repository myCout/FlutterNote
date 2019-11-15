import 'package:flutter_netease_cloud_music/model/album.dart';
import 'package:flutter_netease_cloud_music/public.dart';
import 'package:flutter_netease_cloud_music/widgets/widget_future_builder.dart';

class NewAlbum extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Text(
              '新碟上架',
              style: commonTextStyle,
            ),
          ),
          _buildNewAlbumsList(),
        ],
      ),
    );
  }

  Widget _buildNewAlbumsList() {
    return CustomFutureBuilder<AlbumData>(
      futureFunc: NetUtils.getAlbumData,
      builder: (context, response) {
        var data = response.albums;
        var width = ScreenUtil().setWidth(200);
        return Container(
//          color: Colors.blue,
          height: ScreenUtil().setWidth(300),
          child: ListView.separated(
            padding:
                EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(15)),
            itemCount: data.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            separatorBuilder: (BuildContext context, int index) {
              return HEmptyView(width: ScreenUtil().setWidth(30));
            },
            itemBuilder: (context, index) {
              return Container(
//                color: Colors.red,
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: PlayListCoverWidget(
                            url: data[index].picUrl,
                            playCount: 10,
                            width: width),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 5),
                        width: width-5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              data[index].name,
                              style: smallCommonTextStyle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis, //超出范围...
                            ),
                            Text(
                              data[index].company,
                              style: smallGrayTextStyle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis, //超出范围...
                            ),
                          ],
                        )
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
