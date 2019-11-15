import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netease_cloud_music/App/app_color.dart';
import 'package:flutter_netease_cloud_music/model/mv.dart';
import 'package:flutter_netease_cloud_music/model/recommend.dart';
import 'package:flutter_netease_cloud_music/widgets/widget_banner.dart';
import 'package:flutter_netease_cloud_music/widgets/widget_catergory.dart';
import 'package:flutter_netease_cloud_music/widgets/widget_future_builder.dart';

//import 'package:flutter_netease_cloud_music/model/banner.dart' as mBanner;
import 'package:flutter_netease_cloud_music/model/banner_model_entity.dart';
import 'package:flutter_netease_cloud_music/public.dart';
import 'package:flutter_netease_cloud_music/widgets/widget_new_album.dart';

//import 'package:flutter_netease_cloud_music/widgets/widget_play_list_cover.dart';
import 'package:flutter_netease_cloud_music/widgets/widget_recommend.dart';

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scaffold(
        backgroundColor: AppColor.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildBanner(),
                VEmptyView(20),
                HomeCategory(callback: (index) {
                  print(index);
                }),
                RecommendList(),
//          VEmptyView(20),
                NewAlbum(),
                _buildTopMv(),
//          _buildRecommendPlayList(),
              ],
            ),
          ),
        ));
  }

  Widget _buildBanner() {
    return CustomFutureBuilder<BannersList>(
      futureFunc: NetUtils.getBannerData,
      builder: (context, data) {
        return CustomBanner(data.banners.map((e) => e.pic).toList());
      },
    );
  }

  Widget _buildTopMv() {
    return CustomFutureBuilder<MVData>(
      futureFunc: NetUtils.getMVData,
      builder: (context, response) {
        var data = response.data;
        return ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(15)),
          shrinkWrap: true,
          itemCount: data.length,
          physics: NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) {
            return VEmptyView(ScreenUtil().setWidth(50));
          },
          itemBuilder: (context, index) {
            return Container(
              color: AppColor.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ClipRRect(
                    borderRadius:
                    BorderRadius.all(Radius.circular(8)),
                    child: Utils.showNetImage(
                      data[index].cover,
                    ),
                  ),
                  VEmptyView(ScreenUtil().setWidth(20)),
                  Text('${data[index].name}',maxLines: 1,overflow: TextOverflow.ellipsis,style: commonTextStyle,),
                  Text('${data[index].artistName}',style: smallCommonTextStyle,),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
