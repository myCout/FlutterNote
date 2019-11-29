import 'package:flutter_netease_cloud_music/App/app_color.dart';
import 'package:flutter_netease_cloud_music/model/top_list_model.dart';
import 'package:flutter_netease_cloud_music/public.dart';
import 'package:flutter_netease_cloud_music/widgets/rounded_net_image.dart';
import 'package:flutter_netease_cloud_music/widgets/widget_future_builder.dart';

class TopListPage extends StatefulWidget {
  @override
  _TopListPageState createState() => _TopListPageState();
}

class _TopListPageState extends State<TopListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        title: Text('排行榜'),
        elevation: 0,
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return CustomFutureBuilder<TopListModel>(
      futureFunc: NetUtils.getTopListData,
      builder: (context, data) {
        //官方推荐
        var officialTopListData =
            data.list.where((l) => l.tracks.isNotEmpty).toList();
        //更多榜单
        var moreTopListData = data.list.where((l) => l.tracks.isEmpty).toList();

        return SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: <Widget>[
                buildTitle('官方榜'),
                buildOfficialList(officialTopListData),
                buildTitle('更多榜单'),
                buildMoreTopList(moreTopListData),
              ],
            ),
          )
        );
      },
    );
  }

  Widget buildOfficialList(List<TopList> officialList) {
    return Container(
      child: ListView.separated(
        itemCount: officialList.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(
            top: ScreenUtil().setWidth(10), left: ScreenUtil().setWidth(20)),
        itemBuilder: (BuildContext context, int index) {
          var model = officialList[index];
          var i = 1;
          return Container(
//            color: Colors.greenAccent,
            height: ScreenUtil().setWidth(200),
            child: Row(
              children: <Widget>[
                RoundedNetImage(
                  model.coverImgUrl,
                  width: 200,
                  height: 200,
                  radius: 10,
                ),
                Expanded(
                    child: Container(
//                  color: Colors.blueGrey,
                  padding: EdgeInsets.only(left: 10),
//                  color: AppColor.red,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: model.tracks.map((item) {
                      return Container(
                        alignment: Alignment.centerLeft,
                        height: ScreenUtil().setWidth(55),
                        child: Text(
                          '${i++}.${item.first} - ${item.second}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: common13TextStyle,
                        ),
                      );
                    }).toList(),
                  ),
                ))
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return VEmptyView(20);
        },
      ),
    );
  }

  Widget buildMoreTopList(List<TopList> moreTopList) {
    return Container(
//      color: Colors.green,
//      padding: EdgeInsets.only(
//          left: ScreenUtil().setWidth(20), right: ScreenUtil().setWidth(20)),
      child: GridView.builder(
          padding: EdgeInsets.only(
              top: ScreenUtil().setWidth(10), left: ScreenUtil().setWidth(0)),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          //屏蔽滚动
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, //列数，每行几个
              mainAxisSpacing: 10, //主轴间距（这里是水平方向）
              crossAxisSpacing: 10, //交叉轴间距
              childAspectRatio: 1 / 1.0 //长宽比
              ),
          itemCount: moreTopList.length,
          itemBuilder: (context, index) {
            var model = moreTopList[index];
            return GestureDetector(
              onTap: () {},
              child: Container(
//                color: Colors.green,
                child: Column(
                  children: <Widget>[
                    RoundedNetImage(
                      model.coverImgUrl,
                      width: 200,
                      height: 200,
                      radius: 10,
                    ),
                    Text(
                      model.name,
                      style: smallCommonTextStyle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget buildTitle(String title) {
    return Container(
//      color: Colors.green,
      height: ScreenUtil().setWidth(55),
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: bold20TextStyle,
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
