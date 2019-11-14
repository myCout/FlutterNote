import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netease_cloud_music/model/recommend.dart';
import 'package:flutter_netease_cloud_music/widgets/widget_banner.dart';
import 'package:flutter_netease_cloud_music/widgets/widget_catergory.dart';
import 'package:flutter_netease_cloud_music/widgets/widget_future_builder.dart';

//import 'package:flutter_netease_cloud_music/model/banner.dart' as mBanner;
import 'package:flutter_netease_cloud_music/model/banner_model_entity.dart';
import 'package:flutter_netease_cloud_music/public.dart';
import 'package:flutter_netease_cloud_music/widgets/widget_play_list_cover.dart';
import 'package:flutter_netease_cloud_music/widgets/widget_recommend.dart';

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  //with TickerProviderStateMixin,  AutomaticKeepAliveClientMixin
  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildBanner(),
          VEmptyView(20),
          HomeCategory(callback: (index) {
            print(index);
          }),
//          RecommendList(title: "推荐歌单",),
          _buildRecommendPlayList(),
        ],
      ),
    );
  }

  Widget _buildBanner() {
    return CustomFutureBuilder<BannersList>(
      futureFunc: NetUtils.getBannerData,
      builder: (context, data) {
        return CustomBanner(data.banners.map((e) => e.pic).toList());
      },
    );
  }

  Widget _buildRecommendPlayList() {
    return CustomFutureBuilder<RecommendData>(
      futureFunc: NetUtils.getRecommendData,
      builder: (context, response) {
        var data = response.recommend;
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
                        width: width,
                        child: Text(
                          data[index].name,
                          style: smallCommonTextStyle,
                          maxLines: 2,
                        ),
                      )
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

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => null;
}
